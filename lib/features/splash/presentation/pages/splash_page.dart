import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:test_ia/core/route/route_config.dart';
import 'package:test_ia/core/theme/pallet.dart';
import 'package:test_ia/features/splash/presentation/cubit/splash_cubit.dart';
// Make sure to import your login page file here, for example:
// import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // 1. Setup Fade Animation
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _animationController.forward();

    GetIt.I<SplashCubit>().checkIfUserAuthenticated();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: GetIt.I<SplashCubit>(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (value) => Timer(
              const Duration(milliseconds: 1500),
              () => context.go(RouteConfig.dashboard),
            ),
            error: (value) => Timer(
              const Duration(milliseconds: 1500),
              () => context.go(RouteConfig.login),
            ),
          );
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
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
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated Logo Container
                  Container(
                    height: 120.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: Pallet.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Pallet.black.withValues(alpha: 0.1),
                          blurRadius: 20.r,
                          spreadRadius: 5.r,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.blur_on_rounded,
                      size: 80.sp,
                      color: Pallet.white,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // App Title
                  Text(
                    "MY APP",
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.bold,
                      color: Pallet.white,
                      letterSpacing: 3.0,
                    ),
                  ),
                  SizedBox(height: 8.h),

                  // App Subtitle / Tagline
                  Text(
                    "Beautifully Connected",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Pallet.white.withValues(alpha: 0.7),
                      letterSpacing: 1.5,
                    ),
                  ),

                  SizedBox(height: 60.h),

                  // Subtle Loading Indicator
                  SizedBox(
                    width: 30.w,
                    height: 30.h,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Pallet.white),
                      strokeWidth: 2.5,
                      backgroundColor: Pallet.white.withValues(alpha: 0.2),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
