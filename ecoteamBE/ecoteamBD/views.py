
from django.http import HttpResponse, Http404
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status, generics
from .models import *
from .serializers import UsuarioSerializer, DenunciaSerializer, PuntoRecoleccionSerializer, SectorSerializer, HorarioRecoleccionSerializer

# Create your views Usuarios

class listaUsuarios(APIView):
    def get(self, request, format=None):
        usuarios1 = tbl_usuarios.objects.all()
        serializer = UsuarioSerializer(usuarios1, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        serializer = UsuarioSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class detalleUsuarios(APIView):

    def get_object(self, pk):
        try:
            return tbl_usuarios.objects.get(username=pk)
        except tbl_usuarios.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        usuarios1 = self.get_object(pk)
        serializer = UsuarioSerializer(usuarios1)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        usuarios1 = self.get_object(pk)
        serializer = UsuarioSerializer(usuarios1, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        usuarios1 = self.get_object(pk)
        usuarios1.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

# Create your views Sector

class SectorList(APIView):
    def get(self, request, format=None):
        sector1 = tbl_sector.objects.all()
        serializer = SectorSerializer(sector1, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        serializer = SectorSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class SectorDetalle(APIView):

    def get_object(self, pk):
        try:
            return tbl_sector.objects.get(idSector=pk)
        except tbl_sector.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        sector1 = self.get_object(pk)
        serializer = SectorSerializer(sector1)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        sector1 = self.get_object(pk)
        serializer = SectorSerializer(sector1, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        sector1 = self.get_object(pk)
        sector1.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

# Create your views PtoRec

class PtoRecoleccionList(APIView):
    def get(self, request, format=None):
        punto1 = tbl_puntoRecoleccion.objects.all()
        serializer = PuntoRecoleccionSerializer(punto1, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        serializer = PuntoRecoleccionSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class PtoRecoleccionDetalle(APIView):

    def get_object(self, pk):
        try:
            return tbl_puntoRecoleccion.objects.get(idPunto=pk)
        except tbl_puntoRecoleccion.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        noticia1 = self.get_object(pk)
        serializer = PuntoRecoleccionSerializer(noticia1)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        punto1 = self.get_object(pk)
        serializer = PuntoRecoleccionSerializer(punto1, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        punto1 = self.get_object(pk)
        punto1.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class denuncia_lista(APIView):
    def get(self, request, format=None):
        denuncia = tbl_denuncias.objects.all()
        serializer = DenunciaSerializer(denuncia, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        serializer = DenunciaSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class denuncia_detalle(APIView):
    def get_object(self, pk):
        try:
            return tbl_denuncias.objects.get(idDenuncia=pk)
        except tbl_denuncias.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        denuncia = self.get_object(pk)
        serializer = DenunciaSerializer(denuncia)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        denuncia = self.get_object(pk)
        serializer = DenunciaSerializer(denuncia, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        denuncia = self.get_object(pk)
        denuncia.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

class horario_lista(APIView):
    def get(self, request, format=None):
        horario = tbl_horarioRecoleccion.objects.all()
        serializer = HorarioRecoleccionSerializer(horario, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        serializer = HorarioRecoleccionSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class horario_detalle(APIView):
    def get_object(self, pk):
        try:
            return tbl_horarioRecoleccion.objects.get(idHorario=pk)
        except tbl_denuncias.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        horario = self.get_object(pk)
        serializer = HorarioRecoleccionSerializer(horario)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        horario = self.get_object(pk)
        serializer = HorarioRecoleccionSerializer(horario, data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk, format=None):
        horario = self.get_object(pk)
        horario.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
def index(request):

    return HttpResponse("Index de ecoteam")

