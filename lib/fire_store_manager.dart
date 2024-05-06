import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class FireStorageService {
  final CollectionReference _phoneCollectionReference =
      FirebaseFirestore.instance.collection('logs');

  Future saveLog(String logDto) async {
    try {
      await _phoneCollectionReference.doc("1").set(
        {
          "log": logDto,
        },
      );
    } catch (e) {
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }
}
