from django.db import models

class User(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    password = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name
    class Meta:
        ordering = ['-id']


class Note(models.Model):
    body=models.TextField()
    updated_at = models.DateTimeField(auto_now=True)
    created_at = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.body[0:50]
    
    class Meta:
        ordering = ['-updated_at']


class Register(models.Model):
    email = models.EmailField(max_length=50, unique=True)
    username = models.CharField(max_length=50, unique=True)
    password = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return self.username

    class Meta:
        ordering = ['-created_at'] 
    

