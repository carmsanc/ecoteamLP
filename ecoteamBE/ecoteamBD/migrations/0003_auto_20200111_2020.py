# Generated by Django 3.0.2 on 2020-01-11 20:20

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('ecoteamBD', '0002_auto_20200111_2004'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tbl_puntorecoleccion',
            name='latitud',
            field=models.DecimalField(decimal_places=10, max_digits=20),
        ),
        migrations.AlterField(
            model_name='tbl_puntorecoleccion',
            name='longitud',
            field=models.DecimalField(decimal_places=10, max_digits=20),
        ),
    ]
