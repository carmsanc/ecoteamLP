from .models import *
from rest_framework import serializers

class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_usuarios
        fields = ('idUsuario','username','correo','contrasena','idSector', 'activado')

class SectorSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_sector
        fields = ('idSector','nombre', 'activado')

class DenunciaSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_denuncias
        fields = ('idDenuncia', 'motivo', 'direccion', 'descripcion', 'foto', 'idUsuario', 'activado')

class PuntoRecoleccionSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_puntoRecoleccion
        fields = ('idPunto','nombre','descripcion', 'latitud', 'longitud', 'idSector', 'activado')

class HorarioRecoleccionSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_horarioRecoleccion
        fields = ('idHorario', 'horaInicio','horaFin','idPunto', 'activado')
