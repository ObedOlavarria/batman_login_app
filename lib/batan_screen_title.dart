import 'package:flutter/material.dart';

class BatmanScreenTitles extends AnimatedWidget {
  BatmanScreenTitles(Animation<double> animation)
      : super(listenable: animation);

  Animation<double> get _animationLogoMovementUp =>
      listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animationLogoMovementUp.value,
      child: const Column(
        children: [
          Text(
            'WELCOME TO',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'GOTHAM CITY',
            style: TextStyle(
                color: Color.fromARGB(255, 247, 243, 3), fontSize: 40),
          ),
        ],
      ),
    );
  }
}
