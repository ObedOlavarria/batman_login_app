import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

const _imageColor = Color(0xFFC8B853);

class BatmanButton extends StatelessWidget {
  const BatmanButton({
    Key? key,
    this.onTap,
    this.text,
    this.left = true,
    required TextStyle style,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String? text;
  final bool? left;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 240, 240, 10),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          child: SizedBox(
            height: 55,
            child: Stack(
              children: [
                if (left ??
                    true) // Corregido: Usar left ?? true para manejar el valor null
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(10.0) //..setEntry(3, 2,
                        //0.001) // Corregido: Usar setEntry para evitar el efecto acumulativo
                        ..rotateZ(vector.radians(35))
                        ..translate(-25.0),
                      child: Image.asset(
                        'assets/batman_sign_up/batman_logo.png', // Corregido: Corregir la ruta de la imagen
                        height: 40,
                        color: _imageColor,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                Center(
                  child: Text(
                    text ?? '',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                if (!(left ??
                    true)) // Corregido: Usar !(left ?? true) para manejar el valor null
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(
                            10.0) // Corregido: Usar setEntry para evitar el efecto acumulativo
                        ..rotateZ(vector.radians(-35)),
                      child: Image.asset(
                        'assets/batman_sign_up/batman_logo.png', // Corregido: Corregir la ruta de la imagen
                        height: 40,
                        color: _imageColor,
                        fit: BoxFit.contain,
                      ),
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
