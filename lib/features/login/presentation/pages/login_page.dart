import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:test_ia/core/route/route_config.dart';
import 'package:test_ia/core/theme/pallet.dart';
import 'package:test_ia/features/login/presentation/cubit/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  final _emailCtrl = TextEditingController();
  final _pwdCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<LoginCubit>(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Pallet.deepPurple,
                Pallet.mediumPurple,
                Pallet.vibrantPink,
              ],
            ),
          ),
          child: SafeArea(
            child: BlocListener<LoginCubit, LoginState>(
              listener: (context, state) {
                state.mapOrNull(
                  initial: (value) =>
                      ScaffoldMessenger.of(context).clearSnackBars(),
                  success: (value) {
                    //clear loading and go to dashboard
                    ScaffoldMessenger.of(context).clearSnackBars();
                    context.go(RouteConfig.dashboard);
                  },
                  loading: (value) =>
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 5),
                          content: Text('Logging in...'),
                        ),
                      ),
                  error: (error) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(error.error.message)),
                    );
                  },
                );
              },
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // App Logo / Icon
                      Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.blur_on_rounded,
                          size: 60.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20.h),

                      // Welcome Text
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Login to your account to continue",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                      SizedBox(height: 40.h),

                      // Login Card
                      Container(
                        padding: EdgeInsets.all(24.0.w),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(28.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 20.r,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Email Field
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Email Address",
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                                validator: (value) =>
                                    EmailValidator.validate(value ?? '')
                                    ? null
                                    : 'Please enter a valid email',
                              ),
                              SizedBox(height: 20.h),

                              // Password Field
                              TextFormField(
                                obscureText: !_isPasswordVisible,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  prefixIcon: const Icon(Icons.lock_outline),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.r),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 20.h),

                              // Login Button
                              BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, state) {
                                  return ElevatedButton(
                                    onPressed: state is LoginLoading
                                        ? null
                                        : () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              GetIt.I<LoginCubit>()
                                                  .authenticateUser(
                                                    email: _emailCtrl.text,
                                                    password: _pwdCtrl.text,
                                                  );
                                            }
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Pallet.deepPurple,
                                      foregroundColor: Pallet.white,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 16.h,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          16.r,
                                        ),
                                      ),
                                      elevation: 2,
                                    ),
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
