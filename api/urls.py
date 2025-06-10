from django.urls import path
from . import views
from .views import predict_disease
from django.urls import path
from .views import predict_disease





urlpatterns = [
    path("registers/", views.getRegisters),
    path("registers/create/", views.createRegister),
    path("registers/<str:pk>/update/", views.updateRegister),
    path("registers/<str:pk>/delete/", views.deleteRegister),
    path("registers/<str:pk>/", views.getRegister),
    path("predict_disease/", predict_disease),  # Add this line


    
]
