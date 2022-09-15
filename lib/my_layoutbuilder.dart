import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double space = (constraints.maxHeight * 0.01);
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(space),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      height: constraints.maxHeight * 0.48,
                      width: constraints.maxWidth * 0.48,
                    ),
                  ),
                  SizedBox(
                    width: space * 2,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      height: constraints.maxHeight * 0.48,
                      width: constraints.maxWidth * 0.48,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(space),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      height: constraints.maxHeight * 0.48,
                      width: constraints.maxWidth * 0.48,
                    ),
                  ),
                  SizedBox(
                    width: space * 2,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      height: constraints.maxHeight * 0.48,
                      width: constraints.maxWidth * 0.48,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
