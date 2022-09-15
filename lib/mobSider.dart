import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({
    Key? key,
  }) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  late PageController _pageController;

  int curr = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  Row _circleIndecator(BuildContext context, int n, double ht) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 8; i++)
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
      double ht = constraints.maxHeight;
      return Column(
        children: [
          Container(
            height: ht * 0.35,
            color: Colors.green,
            child: const Center(
              child: Text('Home'),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  curr = value;
                });
              },
              children: [
                Container(
                  // height: 300,
                  color: Colors.red,
                  margin: const EdgeInsets.all(10),
                  child: const Center(
                    child: Text('HOME1'),
                  ),
                ),
                Container(
                  // height: 300,
                  color: Colors.red,
                  margin: const EdgeInsets.all(10),
                  child: const Center(
                    child: Text('HOME2'),
                  ),
                ),
                Container(
                  // height: 300,
                  color: Colors.red,
                  margin: const EdgeInsets.all(10),
                  child: const Center(
                    child: Text('HOME3'),
                  ),
                ),
                Container(
                  // height: 300,
                  color: Colors.red,
                  margin: const EdgeInsets.all(10),
                  child: const Center(
                    child: Text('HOME4'),
                  ),
                ),
                Container(
                  // height: 30,
                  color: Colors.purple,
                  margin: const EdgeInsets.only(top: 10, left: 10),
                  child: const Center(
                    child: Text('HOME5'),
                  ),
                ),
                Container(
                  // height: 30,
                  color: Colors.purple,
                  margin: const EdgeInsets.only(top: 10, left: 10),
                  child: const Center(
                    child: Text('HOME6'),
                  ),
                ),
                Container(
                  // height: 30,
                  color: Colors.purple,
                  margin: const EdgeInsets.only(top: 10, left: 10),
                  child: const Center(
                    child: Text('HOME7'),
                  ),
                ),
                Container(
                  // height: 30,
                  color: Colors.purple,
                  margin: const EdgeInsets.only(top: 10, left: 10),
                  child: const Center(
                    child: Text('HOME8'),
                  ),
                ),
              ],
            ),
          ),
          _circleIndecator(context, curr, ht)
        ],
      );
    });
  }
}
