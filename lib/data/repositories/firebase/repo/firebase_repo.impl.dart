import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:skct_phone_dir/data/models/person.dart';
import 'package:skct_phone_dir/data/repositories/firebase/repo/firebase_repo.dart';
import 'package:skct_phone_dir/data/repositories/firebase/service/firebase_service.dart';
import 'package:skct_phone_dir/global/logger.dart';

@Injectable(as: FirebaseRepo)
class FirebaseRepoImpl implements FirebaseRepo {
  final FirebaseService _firebaseService;

  FirebaseRepoImpl(this._firebaseService);
  @override
  Future<Either<void, dynamic>> registerUser({
    String? registerNumber,
    required String name,
    required PersonType personType,
    required String email,
    required String mobile,
    required Department department,
    String? parentMobile,
  }) async {
    try {
      final response = await _firebaseService.registerUser(
        name: name,
        personType: personType,
        email: email,
        mobile: mobile,
        department: department,
        parentMobile: parentMobile,
        registerNumber: registerNumber,
      );
      return Left(response);
    } catch (e) {
      logger.e(e);
      return Right(e);
    }
  }
}
