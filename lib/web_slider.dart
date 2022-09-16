import 'package:flutter/material.dart';

class WebSlider extends StatefulWidget {
  const WebSlider({Key? key}) : super(key: key);

  @override
  State<WebSlider> createState() => _WebSliderState();
}

class _WebSliderState extends State<WebSlider> {
  late PageController _pageController;

  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Row _circleIndecator(BuildContext context, int n, double ht) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Container(
              height: ht * 0.008,
              width: i == n ? ht * 0.015 : ht * 0.01,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: i == n ? Colors.green : Colors.grey,
              ),
            ),
          ),
        SizedBox(height: ht * 0.04)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
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
          //=========================
          //=========================
          //=========================
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              children: [
                Padding(
                  padding: EdgeInsets.all(space),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.green,
                          height: constraints.maxHeight * 0.48,
                          width: constraints.maxWidth * 0.48,
                        ),
                      ),
                      SizedBox(
                        width: space * 2,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.indigoAccent,
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
                          color: Colors.orange,
                          height: constraints.maxHeight * 0.48,
                          width: constraints.maxWidth * 0.48,
                        ),
                      ),
                      SizedBox(
                        width: space * 2,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.pink,
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
                          color: Colors.purple,
                          height: constraints.maxHeight * 0.48,
                          width: constraints.maxWidth * 0.48,
                        ),
                      ),
                      SizedBox(
                        width: space * 2,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.indigo,
                          height: constraints.maxHeight * 0.48,
                          width: constraints.maxWidth * 0.48,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _circleIndecator(context, currentPage, space / 0.01)
        ],
      );
    });
  }
}
