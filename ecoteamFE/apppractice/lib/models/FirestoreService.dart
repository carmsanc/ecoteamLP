import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'basurero.dart';

final CollectionReference myCollection = Firestore.instance.collection('basurero');

class FirestoreService {
  
  Future<Basurero> createTODOTask(String nombre, String detalle,String fechaInicio,String fechaFin) async {
      final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection.document());

      final Basurero task = new Basurero(nombre, detalle,fechaInicio,fechaFin);
      final Map<String, dynamic> data = task.toMap();
      await tx.set(ds.reference, data);
      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Basurero.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getTaskList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = myCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }

  
}