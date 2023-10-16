import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:skct_phone_dir/data/models/person.dart';

@injectable
class FirebaseService {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _auth;

  FirebaseService(this._firebaseFirestore, this._auth);

  Future<void> registerUser({
    String? registerNumber,
    required String name,
    required PersonType personType,
    required String email,
    required String mobile,
    required Department department,
    String? parentMobile,
  }) async {
    final person = Person(
      name: name,
      registerNumber: registerNumber,
      personType: personType,
      email: email,
      mobileNo: mobile,
      department: department,
      parentMobileNo: parentMobile,
      yearOfStudy: DateTime.now(),
    );
    await _firebaseFirestore.collection("contacts").doc(_auth.currentUser?.uid).set(person.toJson());
  }
}
