from django.db import models

# Create your models here.


class tbl_sector(models.Model):
    idSector = models.AutoField(primary_key = True, unique = True)
    nombre = models.CharField(max_length=50)
    activado = models.BooleanField(default=True)
    def __str__(self):
        return self.nombre


class tbl_usuarios(models.Model):
    idUsuario = models.AutoField (primary_key = True, unique = True)
    username = models.CharField(max_length=50, unique=True)
    correo = models.EmailField(max_length=250)
    contrasena = models.CharField(max_length=20)
    activado = models.BooleanField(default=True)
    idSector = models.ForeignKey(tbl_sector, on_delete=models.PROTECT)
    def __str__(self):
        return self.username

class tbl_puntoRecoleccion(models.Model):
    idPunto = models.AutoField (primary_key = True, unique = True)
    nombre = models.CharField(max_length=50)
    descripcion = models.CharField(max_length=250)
    latitud = models.DecimalField(max_digits=20, decimal_places=10)
    longitud = models.DecimalField(max_digits=20, decimal_places=10)
    activado = models.BooleanField(default=True)
    idSector = models.ForeignKey(tbl_sector, on_delete=models.PROTECT)

class tbl_denuncias(models.Model):
    idDenuncia = models.AutoField(primary_key = True, unique = True)
    motivo = models.CharField(max_length=30)
    direccion = models.CharField(max_length=200)
    descripcion = models.CharField(max_length=250)
    foto = models.ImageField(null=True)
    activado = models.BooleanField(default=True)
    idUsuario = models.ForeignKey(tbl_usuarios, on_delete=models.PROTECT)

class tbl_horarioRecoleccion(models.Model):
    idHorario = models.AutoField(primary_key = True, unique = True)
    horaInicio = models.DateTimeField()
    horaFin= models.DateTimeField()
    activado = models.BooleanField(default=True)
    idPunto = models.ForeignKey(tbl_puntoRecoleccion, on_delete=models.PROTECT)



