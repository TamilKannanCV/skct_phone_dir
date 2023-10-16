import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skct_phone_dir/data/models/person.dart';
import 'package:skct_phone_dir/views/home/home_screen.vm.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeScreenVm viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<HomeScreenVm>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("SKCT Phone Directory"),
          ),
          StreamBuilder(
            stream: viewModel.firebaseFirestore.collection("contacts").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SliverList.list(
                    children: snapshot.data?.docs.map((e) {
                          final person = Person.fromJson(e.data());
                          return ListTile(
                            title: Text(person.name.toString()),
                            subtitle: Text("${person.personType?.name}"),
                            onTap: () {
                              showModalBottomSheet(
                                showDragHandle: true,
                                context: context,
                                builder: (context) => Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${person.name}",
                                        style: Theme.of(context).textTheme.titleLarge,
                                      ),
                                      SizedBox(height: 1.0.h),
                                      Wrap(
                                        spacing: 2.0.w,
                                        runSpacing: 1.0.h,
                                        children: [
                                          Card(
                                            elevation: 0.0,
                                            child: Container(
                                              constraints: BoxConstraints(minWidth: 40.0.w),
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Text(
                                                    "Branch",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                  Text("${person.department?.branch.name}"),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Card(
                                            elevation: 0.0,
                                            child: Container(
                                              constraints: BoxConstraints(minWidth: 40.0.w),
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const Text(
                                                    "Department",
                                                    style: TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                  Text("${person.department?.name}"),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if (person.registerNumber != null)
                                            Card(
                                              elevation: 0.0,
                                              child: Container(
                                                constraints: BoxConstraints(minWidth: 40.0.w),
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    const Text(
                                                      "Register Number",
                                                      style: TextStyle(fontWeight: FontWeight.bold),
                                                    ),
                                                    Text("${person.registerNumber}"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          if (person.parentMobileNo != null)
                                            Card(
                                              elevation: 0.0,
                                              child: Container(
                                                constraints: BoxConstraints(minWidth: 40.0.w),
                                                padding: const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    const Text(
                                                      "Parent Mobile Number",
                                                      style: TextStyle(fontWeight: FontWeight.bold),
                                                    ),
                                                    Text("${person.parentMobileNo}"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      Expanded(
                                          child: Container(
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            FilledButton.icon(
                                              onPressed: () {
                                                launchUrl(Uri.parse("tel:${person.mobileNo}"));
                                              },
                                              icon: const Icon(Icons.phone),
                                              label: const Text("Dial"),
                                            ),
                                            SizedBox(width: 2.0.w),
                                            FilledButton.icon(
                                              onPressed: () {
                                                launchUrl(Uri.parse("mailto:${person.email}"));
                                              },
                                              icon: const Icon(Icons.mail),
                                              label: const Text("Mail"),
                                            ),
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList() ??
                        []);
              }
              return const SliverToBoxAdapter();
            },
          ),
        ],
      ),
    );
  }
}
