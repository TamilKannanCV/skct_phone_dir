// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'person.g.dart';
part 'person.freezed.dart';

enum Branch {
  be(name: "B.E"),
  bTech(name: "B.Tech");

  final String name;
  const Branch({required this.name});
}

enum Department {
  cse(name: "CSE", branch: Branch.be),
  it(name: "IT", branch: Branch.bTech),
  ece(name: "ECE", branch: Branch.be),
  eee(name: "EEE", branch: Branch.be),
  aids(name: "AIDS", branch: Branch.bTech),
  mech(name: "MECH", branch: Branch.be);

  final String name;
  final Branch branch;
  const Department({
    required this.name,
    required this.branch,
  });
}

enum PersonType {
  student,
  teacher,
}

@Freezed(fromJson: true, toJson: true)
class Person with _$Person {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Person({
    String? name,
    String? registerNumber,
    String? email,
    Department? department,
    DateTime? yearOfStudy,
    String? mobileNo,
    String? parentMobileNo,
    PersonType? personType,
  }) = _Person;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}
