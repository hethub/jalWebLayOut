// main

import 'package:flutter/material.dart';

import 'mobSider.dart';
import 'my_layoutbuilder.dart';
import 'web_slider.dart';

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
  // late PageController _pageController;
  late TabController _tabController;
  int curr = 0;

  @override
  void initState() {
    super.initState();
    // _pageController = PageController();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // _pageController.dispose();
    super.dispose();
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
  static const List<Widget> mobileScreens = [
    MobSlider(),
    MobSlider(),
    MobSlider(),
    MobSlider(),
    MobSlider(),
  ];
  static const List<Widget> webScreens = [
    WebSlider(),
    WebSlider(),
    WebSlider(),
    WebSlider(),
    WebSlider(),
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
          body: TabBarView(
            controller: _tabController,
            children: webScreens,
          ),
        );
      } else if (constraints.maxHeight < 150) {
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
          children: mobileScreens,
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
