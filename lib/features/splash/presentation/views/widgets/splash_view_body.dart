import 'package:books_app/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:books_app/core/utils/assets.dart';
import 'package:books_app/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //container can be used here
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 8,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  //init animation methode
  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 5),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }

  //navigate to home methode
  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // Get.to(
        //   () => const HomeView(),
        //   transition: Transition.fade,
        //   duration: kTransitionDuration,
        // );
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
