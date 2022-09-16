import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LowerIndecator extends StatelessWidget {
  final int myNum;
  final double size;
  final bool isWeb;
  const LowerIndecator(
      {Key? key, required this.myNum, required this.size, required this.isWeb})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (size > 600 || !isWeb) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 8; i++)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                height: size * 0.008,
                width: i == myNum ? size * 0.015 : size * 0.01,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: i == myNum ? Colors.green : Colors.grey,
                ),
              ),
            ),
          SizedBox(height: size * 0.04)
        ],
      );
    }
    return Text('data');
  }
}
