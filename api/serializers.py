from rest_framework.serializers import ModelSerializer
from .models import *
class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'

class NoteSerializer(ModelSerializer):
    class Meta:
        model = Note
        fields = '__all__'
class RegisterSerializer(ModelSerializer):
    class Meta:
        model = Register
        fields = '__all__'