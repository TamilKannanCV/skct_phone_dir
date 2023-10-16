// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonImpl _$$PersonImplFromJson(Map<String, dynamic> json) => _$PersonImpl(
      name: json['name'] as String?,
      registerNumber: json['register_number'] as String?,
      email: json['email'] as String?,
      department: $enumDecodeNullable(_$DepartmentEnumMap, json['department']),
      yearOfStudy: json['year_of_study'] == null
          ? null
          : DateTime.parse(json['year_of_study'] as String),
      mobileNo: json['mobile_no'] as String?,
      parentMobileNo: json['parent_mobile_no'] as String?,
      personType: $enumDecodeNullable(_$PersonTypeEnumMap, json['person_type']),
    );

Map<String, dynamic> _$$PersonImplToJson(_$PersonImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'register_number': instance.registerNumber,
      'email': instance.email,
      'department': _$DepartmentEnumMap[instance.department],
      'year_of_study': instance.yearOfStudy?.toIso8601String(),
      'mobile_no': instance.mobileNo,
      'parent_mobile_no': instance.parentMobileNo,
      'person_type': _$PersonTypeEnumMap[instance.personType],
    };

const _$DepartmentEnumMap = {
  Department.cse: 'cse',
  Department.it: 'it',
  Department.ece: 'ece',
  Department.eee: 'eee',
  Department.aids: 'aids',
  Department.mech: 'mech',
};

const _$PersonTypeEnumMap = {
  PersonType.student: 'student',
  PersonType.teacher: 'teacher',
};
