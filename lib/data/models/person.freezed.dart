// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Person _$PersonFromJson(Map<String, dynamic> json) {
  return _Person.fromJson(json);
}

/// @nodoc
mixin _$Person {
  String? get name => throw _privateConstructorUsedError;
  String? get registerNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  Department? get department => throw _privateConstructorUsedError;
  DateTime? get yearOfStudy => throw _privateConstructorUsedError;
  String? get mobileNo => throw _privateConstructorUsedError;
  String? get parentMobileNo => throw _privateConstructorUsedError;
  PersonType? get personType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonCopyWith<Person> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonCopyWith<$Res> {
  factory $PersonCopyWith(Person value, $Res Function(Person) then) =
      _$PersonCopyWithImpl<$Res, Person>;
  @useResult
  $Res call(
      {String? name,
      String? registerNumber,
      String? email,
      Department? department,
      DateTime? yearOfStudy,
      String? mobileNo,
      String? parentMobileNo,
      PersonType? personType});
}

/// @nodoc
class _$PersonCopyWithImpl<$Res, $Val extends Person>
    implements $PersonCopyWith<$Res> {
  _$PersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? registerNumber = freezed,
    Object? email = freezed,
    Object? department = freezed,
    Object? yearOfStudy = freezed,
    Object? mobileNo = freezed,
    Object? parentMobileNo = freezed,
    Object? personType = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      registerNumber: freezed == registerNumber
          ? _value.registerNumber
          : registerNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department?,
      yearOfStudy: freezed == yearOfStudy
          ? _value.yearOfStudy
          : yearOfStudy // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      parentMobileNo: freezed == parentMobileNo
          ? _value.parentMobileNo
          : parentMobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      personType: freezed == personType
          ? _value.personType
          : personType // ignore: cast_nullable_to_non_nullable
              as PersonType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonImplCopyWith<$Res> implements $PersonCopyWith<$Res> {
  factory _$$PersonImplCopyWith(
          _$PersonImpl value, $Res Function(_$PersonImpl) then) =
      __$$PersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? registerNumber,
      String? email,
      Department? department,
      DateTime? yearOfStudy,
      String? mobileNo,
      String? parentMobileNo,
      PersonType? personType});
}

/// @nodoc
class __$$PersonImplCopyWithImpl<$Res>
    extends _$PersonCopyWithImpl<$Res, _$PersonImpl>
    implements _$$PersonImplCopyWith<$Res> {
  __$$PersonImplCopyWithImpl(
      _$PersonImpl _value, $Res Function(_$PersonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? registerNumber = freezed,
    Object? email = freezed,
    Object? department = freezed,
    Object? yearOfStudy = freezed,
    Object? mobileNo = freezed,
    Object? parentMobileNo = freezed,
    Object? personType = freezed,
  }) {
    return _then(_$PersonImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      registerNumber: freezed == registerNumber
          ? _value.registerNumber
          : registerNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department?,
      yearOfStudy: freezed == yearOfStudy
          ? _value.yearOfStudy
          : yearOfStudy // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      mobileNo: freezed == mobileNo
          ? _value.mobileNo
          : mobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      parentMobileNo: freezed == parentMobileNo
          ? _value.parentMobileNo
          : parentMobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      personType: freezed == personType
          ? _value.personType
          : personType // ignore: cast_nullable_to_non_nullable
              as PersonType?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PersonImpl implements _Person {
  _$PersonImpl(
      {this.name,
      this.registerNumber,
      this.email,
      this.department,
      this.yearOfStudy,
      this.mobileNo,
      this.parentMobileNo,
      this.personType});

  factory _$PersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonImplFromJson(json);

  @override
  final String? name;
  @override
  final String? registerNumber;
  @override
  final String? email;
  @override
  final Department? department;
  @override
  final DateTime? yearOfStudy;
  @override
  final String? mobileNo;
  @override
  final String? parentMobileNo;
  @override
  final PersonType? personType;

  @override
  String toString() {
    return 'Person(name: $name, registerNumber: $registerNumber, email: $email, department: $department, yearOfStudy: $yearOfStudy, mobileNo: $mobileNo, parentMobileNo: $parentMobileNo, personType: $personType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.registerNumber, registerNumber) ||
                other.registerNumber == registerNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.yearOfStudy, yearOfStudy) ||
                other.yearOfStudy == yearOfStudy) &&
            (identical(other.mobileNo, mobileNo) ||
                other.mobileNo == mobileNo) &&
            (identical(other.parentMobileNo, parentMobileNo) ||
                other.parentMobileNo == parentMobileNo) &&
            (identical(other.personType, personType) ||
                other.personType == personType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, registerNumber, email,
      department, yearOfStudy, mobileNo, parentMobileNo, personType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      __$$PersonImplCopyWithImpl<_$PersonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonImplToJson(
      this,
    );
  }
}

abstract class _Person implements Person {
  factory _Person(
      {final String? name,
      final String? registerNumber,
      final String? email,
      final Department? department,
      final DateTime? yearOfStudy,
      final String? mobileNo,
      final String? parentMobileNo,
      final PersonType? personType}) = _$PersonImpl;

  factory _Person.fromJson(Map<String, dynamic> json) = _$PersonImpl.fromJson;

  @override
  String? get name;
  @override
  String? get registerNumber;
  @override
  String? get email;
  @override
  Department? get department;
  @override
  DateTime? get yearOfStudy;
  @override
  String? get mobileNo;
  @override
  String? get parentMobileNo;
  @override
  PersonType? get personType;
  @override
  @JsonKey(ignore: true)
  _$$PersonImplCopyWith<_$PersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
