from django.contrib import admin
from django.urls import path
from rest_framework.urlpatterns import format_suffix_patterns
from ecoteamBD import views

urlpatterns = [
    path('', views.index, name='index'),
    path('admin/', admin.site.urls),
    path('usuarios/', views.usuarios_lista.as_view()),
    path('usuarios/<str:pk>/', views.usuarios_detalle.as_view()),
    path('sector/', views.sector_lista.as_view()),
    path('sector/<str:pk>/', views.sector_detalle.as_view()),
    path('punto/', views.punto_lista.as_view()),
    path('punto/<str:pk>/', views.punto_detalle.as_view()),
    path('denuncia/', views.denuncia_lista.as_view()),
    path('denuncia/<str:pk>/', views.denuncia_detalle.as_view()),
    path('horario/', views.horario_lista.as_view()),
    path('horario/<str:pk>/', views.horario_detalle.as_view())

]
urlpatterns = format_suffix_patterns(urlpatterns)
