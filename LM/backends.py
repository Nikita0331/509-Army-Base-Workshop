from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.models import User
from LM.models import ViewUser

class CustomAuthBackend(ModelBackend):
    def authenticate(self, request, user_id=None, password=None, unit=None):
        # Check if the user is logging in from the admin section
        if request.path.startswith('/admin/'):
            return None  # Prevent authentication for admin section users

        try:
            # Attempt to retrieve the user from the custom ViewUser model
            view_user = ViewUser.objects.get(user_id=user_id)
            
            # Check if the user is active and if the password and unit match
            if view_user.status == 'active' and view_user.check_password(password) and view_user.unit == unit:
                # Use the user_id field from ViewUser model for authentication
                user, _ = User.objects.get_or_create(username=view_user.user_id)
                return user
        except ViewUser.DoesNotExist:
            pass

        return None  # Return None if authentication fails or the user does not exist
