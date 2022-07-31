import 'package:dexplatassesment/configs/app_dimensions.dart';
import 'package:dexplatassesment/screens/favourite_pokemons/favourites.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: AppDimensions.normalize(30),
      child: Stack(
        children: [
          CustomPaint(
            size: Size(
              size.width,
              AppDimensions.normalize(30),
            ),
            painter: MyCustomPaint(),
          ),
          Center(
            heightFactor: 0.8,
            child: InkWell(
              hoverColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const FavouritesScreen()),
                  ),
                );
              },
              child: Container(
                height: AppDimensions.normalize(20),
                width: AppDimensions.normalize(20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite,
                  size: AppDimensions.normalize(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * .25, 0, size.width * .40, 0);
    path.quadraticBezierTo(size.width * .40, 0, size.width * .40, 15);
    path.arcToPoint(Offset(size.width * .60, 0),
        radius: const Radius.circular(5.0), clockwise: false);
    path.quadraticBezierTo(size.width * .60, 0, size.width * .65, 0);
    path.quadraticBezierTo(size.width * .80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
