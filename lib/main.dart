// main
import 'dart:html';

import 'package:flutter/material.dart';

import 'mobSider.dart';
import 'my_layoutbuilder.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPageView(),
    );
  }
}

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> with TickerProviderStateMixin {
  late PageController _pageController;
  late TabController _tabController;
  int curr = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Row _circleIndecator(BuildContext context, int i) {
    if (i == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 10,
            width: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.green,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            height: 10,
            width: 12,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 50)
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 10,
          width: 12,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          height: 10,
          width: 20,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 50)
      ],
    );
  }

//=================================================================================================
//=================================================================================================
//=================================================================================================
  Widget pageView(BuildContext context) {
    return PageView(
      onPageChanged: (value) {
        // print(_pageController.initialPage);
        setState(() {
          curr = value;
        });
      },
      controller: _pageController,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: MyPage()),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(child: MyPage()),
          ],
        ),
      ],
    );
  }

  // This is use for bottom navigation bar
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

// int _change=1;
// static const List<Widget> screens
  static List<Widget> screens = [
    const MySlider(),
    ListView.builder(
      controller: ScrollController(),
      itemCount: 8,
      itemBuilder: (context, index) => Container(
          height: 300,
          color: Colors.green,
          margin: const EdgeInsets.only(top: 10),
          child: const Center(child: Text('7 Day'))),
    ),
    ListView.builder(
      controller: ScrollController(),
      itemCount: 8,
      itemBuilder: (context, index) => Container(
          height: 300,
          color: Colors.green,
          margin: const EdgeInsets.only(top: 10),
          child: const Center(child: Text('30 Days'))),
    ),
    ListView.builder(
      controller: ScrollController(),
      itemCount: 8,
      itemBuilder: (context, index) => Container(
          height: 300,
          color: Colors.green,
          margin: const EdgeInsets.only(top: 10),
          child: const Center(child: Text('1 Year'))),
    ),
    ListView.builder(
      controller: ScrollController(),
      itemCount: 8,
      itemBuilder: (context, index) => Container(
          height: 300,
          color: Colors.green,
          margin: const EdgeInsets.only(top: 10),
          child: const Center(child: Text('5 year'))),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600 && constraints.maxHeight > 200) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('WebTestApp'),
            bottom: TabBar(
              controller: _tabController,
              tabs: const <Widget>[
                Tab(
                  icon: Icon(Icons.home),
                  child: Text('Home'),
                ),
                Tab(
                  icon: Icon(Icons.calendar_view_week),
                  child: Text('7 Days'),
                ),
                Tab(
                  icon: Icon(Icons.calendar_month),
                  child: Text('30 Day'),
                ),
                Tab(
                  icon: Icon(Icons.work_history),
                  child: Text('1 Year'),
                ),
                Tab(
                  icon: Icon(Icons.history),
                  child: Text('5 Year'),
                ),
              ],
            ),
          ),
          bottomNavigationBar: _circleIndecator(context, curr),
          body: TabBarView(
            controller: _tabController,
            children: <Widget>[
              pageView(context),
              pageView(context),
              pageView(context),
              pageView(context),
              pageView(context),
            ],
          ),
        );
      } else if (constraints.maxHeight < 100) {
        return const SizedBox(
          height: 0,
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text('Mobile'),
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_week),
              label: '7 Day',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: '30 Days',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work_history),
              label: '1 Year',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: '5 Year',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      );
    });
  }
}

class Pages extends StatelessWidget {
  final String title;
  const Pages({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
