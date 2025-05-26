import 'package:chat_bot/core/cache/cache_constants.dart';
import 'package:chat_bot/core/cache/cache_helper.dart';
import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:chat_bot/core/widgets/custom_app_button.dart';
import 'package:chat_bot/features/auth/presentation/views/sign_in_view.dart';
import 'package:chat_bot/features/on_boarding/presentation/views/widgets/on_boarding_image.dart';
import 'package:chat_bot/features/on_boarding/presentation/views/widgets/on_boarding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static const routeName = '/onBoarding_view';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _imageController;
  late AnimationController _textController;
  late AnimationController _buttonController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _imageSlideAnimation;
  late Animation<double> _imageScaleAnimation;
  late Animation<double> _titleFadeAnimation;
  late Animation<double> _subtitleFadeAnimation;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    // Main fade controller
    _mainController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Image animation controller
    _imageController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Text animation controller
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Button animation controller
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Main fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeInOut),
    );

    // Image slide and scale animations
    _imageSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.elasticOut),
    );

    _imageScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.elasticOut),
    );

    // Text animations (staggered)
    _titleFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
      ),
    );

    _subtitleFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    // Button scale animation
    _buttonScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.elasticOut),
    );
  }

  void _startAnimations() async {
    // Start main fade immediately
    _mainController.forward();

    // Start image animation after a short delay
    await Future.delayed(const Duration(milliseconds: 300));
    _imageController.forward();

    // Start text animations
    await Future.delayed(const Duration(milliseconds: 600));
    _textController.forward();

    // Start button animation last
    await Future.delayed(const Duration(milliseconds: 900));
    _buttonController.forward();
  }

  @override
  void dispose() {
    _mainController.dispose();
    _imageController.dispose();
    _textController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              VerticalSpace(height: 180),
              SlideTransition(
                position: _imageSlideAnimation,
                child: ScaleTransition(
                  scale: _imageScaleAnimation,
                  child: OnBoardingImage(),
                ),
              ),
              VerticalSpace(height: 20),
              OnBoardingTexts(
                titleAnimation: _titleFadeAnimation,
                subtitleAnimation: _subtitleFadeAnimation,
              ),
              Spacer(),
              ScaleTransition(
                scale: _buttonScaleAnimation,
                child: CustomAppButton(
                  buttonText: 'Get Started',
                  onPressed: () {
                    CacheHelper.set(
                        key: CacheKeys.isOnBoardingSeen, value: true);
                    context.goNamed(SignInView.routeName);
                  },
                ),
              ),
              VerticalSpace(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
