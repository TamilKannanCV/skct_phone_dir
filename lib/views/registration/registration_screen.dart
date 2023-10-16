import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skct_phone_dir/data/models/person.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'registration_screen.vm.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late final RegistrationScreenVm viewModel;
  PersonType _personType = PersonType.student;
  late final TextEditingController registerNumberController, nameController, emailController, mobileController, parentMobileController;
  Branch _branch = Branch.be;
  Department _department = Department.cse;

  final formStateKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<RegistrationScreenVm>(context, listen: false);

    registerNumberController = TextEditingController();
    nameController = TextEditingController.fromValue(TextEditingValue(text: viewModel.currentUser?.displayName ?? ""));
    emailController = TextEditingController.fromValue(TextEditingValue(text: viewModel.currentUser?.email ?? ""));
    mobileController = TextEditingController.fromValue(TextEditingValue(text: viewModel.currentUser?.phoneNumber ?? ""));
    parentMobileController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formStateKey,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar.large(
              title: Text("New Registration"),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 0.0),
              sliver: MultiSliver(
                children: [
                  Row(
                    children: [
                      ChoiceChip(
                        label: const Text("Student"),
                        selected: _personType == PersonType.student,
                        onSelected: (value) {
                          setState(() {
                            _personType = PersonType.student;
                          });
                        },
                      ),
                      SizedBox(width: 2.0.w),
                      ChoiceChip(
                        label: const Text("Teacher"),
                        selected: _personType == PersonType.teacher,
                        onSelected: (value) {
                          setState(() {
                            _personType = PersonType.teacher;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 3.0.h),
                  Visibility(
                    visible: _personType == PersonType.student,
                    child: TextFormField(
                      controller: registerNumberController,
                      validator: (value) {
                        if (_personType == PersonType.teacher) {
                          return null;
                        }
                        if (value == null || value.trim().isEmpty) {
                          return "*required";
                        }
                        return null;
                      },
                      textCapitalization: TextCapitalization.characters,
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                        FilteringTextInputFormatter.allow(RegExp(r"[0-9A-z]")),
                      ],
                      decoration: const InputDecoration(
                        labelText: "Register Number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "*required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "*required";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      enabled: false,
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                  TextFormField(
                    controller: mobileController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "*required";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: const InputDecoration(
                      labelText: "Mobile",
                      border: OutlineInputBorder(),
                      prefixText: "+91",
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                  Row(
                    children: [
                      DropdownMenu<Branch>(
                        initialSelection: _branch,
                        onSelected: (Branch? value) {
                          setState(() {
                            _branch = value ?? Branch.be;
                            if (_department.branch != _branch) {
                              _department = Department.values.firstWhere((e) => e.branch == _branch);
                            }
                          });
                        },
                        dropdownMenuEntries: Branch.values.map<DropdownMenuEntry<Branch>>((Branch value) {
                          return DropdownMenuEntry<Branch>(value: value, label: value.name);
                        }).toList(),
                      ),
                      SizedBox(width: 2.0.w),
                      DropdownMenu<Department>(
                        initialSelection: _department,
                        onSelected: (Department? value) {
                          setState(() {
                            _department = value ?? Department.cse;
                          });
                        },
                        dropdownMenuEntries: Department.values.where((e) => e.branch == _branch).map<DropdownMenuEntry<Department>>((Department value) {
                          return DropdownMenuEntry<Department>(value: value, label: value.name);
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.0.h),
                  if (_personType == PersonType.student) ...[
                    Text(
                      "Parent Details",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 2.0.h),
                    TextFormField(
                      controller: parentMobileController,
                      validator: (value) {
                        if (_personType == PersonType.teacher) {
                          return null;
                        }
                        if (value == null || value.trim().isEmpty) {
                          return "*required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        labelText: "Mobile",
                        border: OutlineInputBorder(),
                        prefixText: "+91",
                      ),
                    ),
                  ],
                  SizedBox(height: 8.0.h),
                  SizedBox(
                    height: 6.0.h,
                    child: Consumer<RegistrationScreenVm>(builder: (context, model, child) {
                      return FilledButton(
                          onPressed: model.registering == false
                              ? () {
                                  if (formStateKey.currentState?.validate() == false) {
                                    return;
                                  }
                                  model.registerUser(
                                    name: nameController.text,
                                    personType: _personType,
                                    email: emailController.text,
                                    mobile: mobileController.text,
                                    branch: _branch,
                                    department: _department,
                                    registerNumber: registerNumberController.text,
                                    parentMobile: parentMobileController.text,
                                  );
                                }
                              : null,
                          style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          child: model.registering ? const Center(child: CircularProgressIndicator()) : const Text("Done"));
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
