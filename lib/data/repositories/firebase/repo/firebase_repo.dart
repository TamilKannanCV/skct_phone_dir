import 'package:dartz/dartz.dart';
import 'package:skct_phone_dir/data/models/person.dart';

abstract interface class FirebaseRepo {
  Future<Either<void, dynamic>> registerUser({
    String? registerNumber,
    required String name,
    required PersonType personType,
    required String email,
    required String mobile,
    required Department department,
    String? parentMobile,
  });
}
