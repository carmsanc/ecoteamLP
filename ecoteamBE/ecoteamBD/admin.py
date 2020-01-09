from django.contrib import admin
from .models import tbl_usuarios, tbl_puntoRecoleccion, tbl_sector, tbl_denuncias, tbl_horarioRecoleccion

# Register your models here.
modelos = [tbl_usuarios, tbl_puntoRecoleccion, tbl_sector, tbl_denuncias, tbl_horarioRecoleccion]


admin.site.register(modelos)

