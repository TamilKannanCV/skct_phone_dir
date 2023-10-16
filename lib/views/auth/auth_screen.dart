import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skct_phone_dir/gen/assets.gen.dart';
import 'package:skct_phone_dir/views/auth/auth_screen.vm.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, this.onResult});
  final void Function(bool success)? onResult;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late final AuthScreenVm viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<AuthScreenVm>(context, listen: false);
    viewModel.signInSilentlyWithGoogle(
      onResult: (success) {
        if (success) {
          widget.onResult?.call(true);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.images.logo
                      .image(
                        height: 15.0.h,
                        fit: BoxFit.fitHeight,
                      )
                      .animate()
                      .fade(
                        duration: const Duration(milliseconds: 600),
                      ),
                  SizedBox(height: 2.5.h),
                  Text(
                    "Welcome to SKCT Directory",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0.sp,
                    ),
                  ).animate(delay: const Duration(milliseconds: 500)).slideY().fade(),
                  SizedBox(height: 1.0.h),
                  SizedBox(
                    width: 70.0.w,
                    child: Text(
                      "This app helps you find the contacts in your college",
                      style: TextStyle(fontSize: 13.0.sp),
                      textAlign: TextAlign.center,
                    ),
                  ).animate(delay: const Duration(milliseconds: 600)).slideY().fade(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.0.h,
            child: Center(
              child: Consumer<AuthScreenVm>(builder: (context, model, child) {
                if (model.isAuthenticating) {
                  return const SizedBox.square(
                    dimension: 20.0,
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    viewModel.signInWithGoogle(
                      onResult: (success) {
                        if (success) {
                          widget.onResult?.call(true);
                        }
                      },
                    );
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    size: 18.0,
                  ),
                  label: const Text("Sign in with Google"),
                ).animate(delay: const Duration(seconds: 1)).slideY(begin: 1).fade();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
