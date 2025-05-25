import 'package:chat_bot/core/utils/spacing_widgets.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/row_with_primary_text.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/sign_up_bloc_consumer.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/sign_up_form.dart';
import 'package:chat_bot/features/auth/presentation/views/widgets/sign_up_texts.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/app_logo_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const routeName = '/sign_up_view';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with TickerProviderStateMixin {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController usernameController;
  late TextEditingController fullNameController;

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
  late Animation<double> _linkFadeAnimation;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    usernameController = TextEditingController();
    fullNameController = TextEditingController();
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
      duration: const Duration(milliseconds: 1200),
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

    _linkFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
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
    await Future.delayed(const Duration(milliseconds: 1000));
    _buttonController.forward();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    usernameController.dispose();
    fullNameController.dispose();
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
                VerticalSpace(height: 90),
                // Animated Logo
                ScaleTransition(
                  scale: _logoScaleAnimation,
                  child: RotationTransition(
                    turns: _logoRotationAnimation,
                    child: AppLogoWidget(),
                  ),
                ),
                VerticalSpace(height: 20),
                // Animated Texts
                SignUpTexts(
                  titleAnimation: _titleFadeAnimation,
                  subtitleAnimation: _subtitleFadeAnimation,
                ),
                VerticalSpace(height: 40),
                // Animated Form
                SlideTransition(
                  position: _formSlideAnimation,
                  child: FadeTransition(
                    opacity: _formFadeAnimation,
                    child: SignUpForm(
                      formKey: formKey,
                      fullNameController: fullNameController,
                      usernameController: usernameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                      fieldAnimations: [
                        _formFadeAnimation,
                        _formFadeAnimation,
                        _formFadeAnimation,
                        _formFadeAnimation,
                        _formFadeAnimation,
                      ],
                    ),
                  ),
                ),
                VerticalSpace(height: 30),
                // Animated Sign Up Button
                ScaleTransition(
                  scale: _buttonScaleAnimation,
                  child: SignUpBlocConsumer(
                    formKey: formKey,
                    fullNameController: fullNameController,
                    usernameController: usernameController,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                ),
                VerticalSpace(height: 20),
                // Animated Sign In Link
                FadeTransition(
                  opacity: _linkFadeAnimation,
                  child: RowWithPrimaryText(
                    text: 'Already have an account? ',
                    primaryText: 'Sign In',
                    onTap: () {
                      context.pop();
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
