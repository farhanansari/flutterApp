import 'package:flutter/material.dart';
import 'package:flutter_widgetbook/models/user.dart';
import 'package:flutter_widgetbook/screens/pages/detail.dart';
import 'package:flutter_widgetbook/screens/profile/profile.dart';
import 'package:flutter_widgetbook/screens/setup/Setup.dart';
import 'package:flutter_widgetbook/screens/pages/navigator.dart';
import 'package:flutter_widgetbook/widgetbook/molecules/AboutMe/AboutMe.dart';
import '../../services/auth.dart';
import '../pages/page2.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  int _pageIndex = 0;
  final List<Widget> _pages = [const Setup(), AboutMe(), Detail(), Page2()];

  @override
  void initState() {
    _getUser();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
/*         appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: HeaderBar(
              onSignOut: _auth.signOut,
            )), */

        body: SafeArea(
          child: IndexedStack(
            index: _pageIndex,
            children: <Widget>[
              NavigatorPage(
                  title: const Text('Home'), widget: _pages[_pageIndex]),
              NavigatorPage(
                  title: const Text('Profile'), widget: _pages[_pageIndex]),
              NavigatorPage(
                  title: const Text('Technology'), widget: _pages[_pageIndex]),
              NavigatorPage(
                  title: const Text('Education'), widget: _pages[_pageIndex]),
            ],
          ),
        ),

/*         body: NavigatorPage(
            title: const Text("From Home Titlee"),
            widget: _pages[_selectedPageIndex]), */
        //body: _pages[_selectedPageIndex],

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            print("Index: $index");
            setState(() {
              _pageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Home")),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "Page1"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Page2")
          ],
          currentIndex: _pageIndex,
        ));
  }

/*   void _selectedTabIndex(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  } */

  _getUser() async {
    print("GETTING USER");
    UserModel result = await _auth.getUser();
    print(result.uid);
    print(result.email);
    print(result.displayName);
    print("------");
  }
}
