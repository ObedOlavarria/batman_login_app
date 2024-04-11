import 'package:batman_login/batman_button.dart';
import 'package:flutter/material.dart';

class BatmanScreenSignupIn extends AnimatedWidget {
  const BatmanScreenSignupIn(
    Animation animation,
  ) : super(listenable: animation);

  Animation<double> get _animationBatmanSignupIn =>
      listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Opacity(
        opacity: _animationBatmanSignupIn.value,
        child: Transform.translate(
          offset: Offset(0.0, 100 * (1 - _animationBatmanSignupIn.value)),
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'GET ACCESS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                _BatmanInput(label: 'FULL NAME'),
                _BatmanInput(label: 'EMAIL ID'),
                _BatmanInput(label: 'PASSWORD', password: true),
                SizedBox(height: 20),
                BatmanButton(
                  text: 'SIGNUP',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 35),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BatmanInput extends StatelessWidget {
  const _BatmanInput({
    Key? key,
    this.label,
    this.password = false,
  }) : super(key: key);

  final String? label;
  final bool password;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.5,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 204, 204, 204),
          ),
          enabledBorder: border,
          border: border,
          suffixIcon: password
              ? Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: UnconstrainedBox(
                    child: Image.asset(
                      'assets/batman_sign_up/batman_logo.png',
                      height: 15,
                    ),
                  ))
              : null,
        ),
      ),
    );
  }
}
