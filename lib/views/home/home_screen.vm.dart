import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeScreenVm extends ChangeNotifier {
  final FirebaseFirestore firebaseFirestore;
  HomeScreenVm(this.firebaseFirestore);
}
