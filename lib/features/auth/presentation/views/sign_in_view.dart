import 'package:chat_bot/core/utils/app_images.dart';
import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:chat_bot/features/auth/presentation/views/sign_up_view.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/custom_social_media_button.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/or_widget.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/row_with_primary_text.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/sign_in_bloc_consumer.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/sign_in_form.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/sign_in_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_logo_widget.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});
  static const routeName = '/sign_in_view';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> with TickerProviderStateMixin {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  // Animation controllers
  late AnimationController _mainController;
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _formController;
  late AnimationController _buttonController;

  // Animations
  late Animation<double> _fadeAnimation;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _logoRotationAnimation;
  late Animation<double> _titleFadeAnimation;
  late Animation<double> _subtitleFadeAnimation;
  late Animation<Offset> _formSlideAnimation;
  late Animation<double> _formFadeAnimation;
  late Animation<double> _buttonScaleAnimation;
  late Animation<double> _socialButtonFadeAnimation;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    // Main fade controller
    _mainController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Logo animation controller
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Text animation controller
    _textController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Form animation controller
    _formController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Button animation controller
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Initialize animations
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeInOut),
    );

    _logoScaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _logoRotationAnimation = Tween<double>(
      begin: -0.1,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));

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

    _formSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _formController, curve: Curves.easeOut));

    _formFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _formController, curve: Curves.easeOut));

    _buttonScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _buttonController, curve: Curves.elasticOut),
    );

    _socialButtonFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _buttonController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  void _startAnimations() async {
    // Start main fade immediately
    _mainController.forward();

    // Start logo animation
    await Future.delayed(const Duration(milliseconds: 200));
    _logoController.forward();

    // Start text animations
    await Future.delayed(const Duration(milliseconds: 400));
    _textController.forward();

    // Start form animations
    await Future.delayed(const Duration(milliseconds: 600));
    _formController.forward();

    // Start button animations
    await Future.delayed(const Duration(milliseconds: 800));
    _buttonController.forward();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    formKey.currentState?.dispose();
    _mainController.dispose();
    _logoController.dispose();
    _textController.dispose();
    _formController.dispose();
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const VerticalSpace(height: 90),
                // Animated Logo
                ScaleTransition(
                  scale: _logoScaleAnimation,
                  child: RotationTransition(
                    turns: _logoRotationAnimation,
                    child: const AppLogoWidget(),
                  ),
                ),
                const VerticalSpace(height: 20),
                // Animated Texts
                SignInTexts(
                  titleAnimation: _titleFadeAnimation,
                  subtitleAnimation: _subtitleFadeAnimation,
                ),
                const VerticalSpace(height: 40),
                // Animated Form
                SlideTransition(
                  position: _formSlideAnimation,
                  child: FadeTransition(
                    opacity: _formFadeAnimation,
                    child: SignInForm(
                      formKey: formKey,
                      emailController: emailController,
                      passwordController: passwordController,
                      fieldAnimations: [_formFadeAnimation, _formFadeAnimation],
                    ),
                  ),
                ),
                const VerticalSpace(height: 30),
                // Animated Sign In Button
                ScaleTransition(
                  scale: _buttonScaleAnimation,
                  child: SignInBlocConsumer(
                    formKey: formKey,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                ),
                const VerticalSpace(height: 20),
                // Animated OR Widget
                FadeTransition(
                  opacity: _socialButtonFadeAnimation,
                  child: const OrWidget(),
                ),
                const VerticalSpace(height: 20),
                // Animated Google Button
                FadeTransition(
                  opacity: _socialButtonFadeAnimation,
                  child: ScaleTransition(
                    scale: _buttonScaleAnimation,
                    child: CustomSocialMediaButton(
                      onTap: () {},
                      buttonText: 'Sign in with Google',
                      icon: SvgPicture.asset(
                        Assets.imagesGoogle,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                const VerticalSpace(height: 20),
                // Animated Sign Up Link
                FadeTransition(
                  opacity: _socialButtonFadeAnimation,
                  child: RowWithPrimaryText(
                    text: 'Don\'t have an account? ',
                    primaryText: 'Sign Up',
                    onTap: () {
                      context.pushNamed(SignUpView.routeName);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
