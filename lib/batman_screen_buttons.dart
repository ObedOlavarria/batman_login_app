import 'package:batman_login/batman_button.dart';
import 'package:flutter/material.dart';

class BatmanScreenButtons extends AnimatedWidget {
  BatmanScreenButtons(
    Animation animation,
    this.onTap,
  ) : super(listenable: animation);
  final VoidCallback onTap;
  Animation<double> get _animationBatmanButtonIn =>
      listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Opacity(
        opacity: _animationBatmanButtonIn.value,
        child: Transform.translate(
          offset: Offset(0.0, 100 * (1 - _animationBatmanButtonIn.value)),
          child: Column(
            children: [
              const BatmanButton(
                left: false,
                text: 'LOGIN',
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 35),
              ),
              const SizedBox(height: 20),
              BatmanButton(
                text: 'SIGNUP',
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0), fontSize: 35),
                onTap: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
