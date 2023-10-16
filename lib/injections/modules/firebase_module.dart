import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@module
abstract class FirebaseModule {
  @singleton
  FirebaseAuth get auth => FirebaseAuth.instance;

  @singleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
