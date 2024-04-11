// ignore: duplicate_ignore
// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, duplicate_ignore, unused_field

import 'package:batman_login/batan_screen_title.dart';
import 'package:batman_login/batman_screen_buttons.dart';
import 'package:batman_login/batman_screen_signup.dart';
import 'package:flutter/material.dart';

const _batmanVerticalMovment = 60;
void main() {
  runApp(MainBatmanSignUpApp());
}

// ignore: use_key_in_widget_constructors
class MainBatmanSignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BatmanSignUp(),
      theme: ThemeData.light().copyWith(
        textTheme: const TextTheme(
          // ignore: deprecated_member_use
          headline1: TextStyle(
            fontFamily: 'Arial',
            fontSize: 48,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}

class BatmanSignUp extends StatefulWidget {
  @override
  _BatmanSignUpState createState() => _BatmanSignUpState();
}

class _BatmanSignUpState extends State<BatmanSignUp>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationLogoIn;
  late Animation<double> _animationLogoMovementUp;
  late Animation<double> _animationBatmanIn;
  late Animation<double> _animationBatmanButtonIn;

  late AnimationController _animationControllerSignUp;
  late Animation<double> _animationBatmanLogoOut;
  late Animation<double> _animationBatmanUp;
  late Animation<double> _animationBatmanCity;
  late Animation<double> _animationBatmanSignupIn;

  void _setupFirstAimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animationLogoIn = Tween(
      begin: 40.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.25),
      ),
    );

    _animationLogoMovementUp = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.35, 0.60),
    );

    _animationBatmanIn = Tween(
      begin: 5.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.7, 1.0),
      ),
    );

    _animationBatmanButtonIn = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.7, 1.0),
    );
    
    _animationController.forward();
  }

  void _setupSecondAnimations() {
    _animationControllerSignUp = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );
    _animationBatmanLogoOut = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.0, 0.20),
    );
    _animationBatmanUp = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.35, 0.50),
    );
    _animationBatmanCity = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.60, 0.75),
    );
    _animationBatmanSignupIn = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.7, 1.0),
    );
  }

  void _onSignUp() {
    _animationControllerSignUp.forward(from: 0.0);
  }

  @override
  void initState() {
    _setupFirstAimations();
    _setupSecondAnimations();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerSignUp
        .dispose(); // Aquí se debe llamar a dispose() para AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);//cometar
        _animationControllerSignUp.reset();
      },
      child: AnimatedBuilder(
        animation: Listenable.merge(
            [_animationController, _animationControllerSignUp]),
        builder: (context, _) {
          return Scaffold(
            backgroundColor: const Color(0xFF100F0B),
            body: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/batman_sign_up/batman_background.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Transform.translate(
                    offset: Offset(
                        0.0,
                        _batmanVerticalMovment * _animationBatmanLogoOut.value +
                            -_animationBatmanUp.value * _batmanVerticalMovment),
                    child: Transform.scale(
                      scale: _animationBatmanIn.value,
                      child: Image.asset(
                        'assets/batman_sign_up/batman_alone.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 4.5,
                  left: 25,
                  right: 25,
                  child: ClipPath(
                    clipper: _CityClipper(_animationBatmanCity.value),
                    child: Image.asset(
                      'assets/batman_sign_up/city.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2.0,
                  left: 0,
                  right: 0,
                  child: BatmanScreenSignupIn(_animationBatmanSignupIn),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2.0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: Offset(0.0, 60 * _animationBatmanLogoOut.value),
                        child: Opacity(
                          opacity: (1 - _animationBatmanLogoOut.value),
                          child: BatmanScreenTitles(_animationLogoMovementUp),
                        ),
                      ),
                      const SizedBox(height: 35),
                      Opacity(
                        opacity: (1 - _animationBatmanLogoOut.value),
                        child: BatmanScreenButtons(
                            _animationBatmanButtonIn, _onSignUp),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2.2 -
                      65 * _animationLogoMovementUp.value,
                  left: 0,
                  right: 0,
                  child: Opacity(
                    opacity: (1 - _animationBatmanLogoOut.value),
                    child: Transform.scale(
                      scale: _animationLogoIn.value,
                      child: Image.asset(
                        'assets/batman_sign_up/batman_logo.png',
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CityClipper extends CustomClipper<Path> {
  final double progress;

  _CityClipper(this.progress);
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, size.height * (1 - progress));
    path.lineTo(0.0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
