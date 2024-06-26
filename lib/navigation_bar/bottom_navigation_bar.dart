import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/navigation_bar/cart_page.dart';
import 'package:flutter_application_1/navigation_bar/menue_page.dart';
import 'package:flutter_application_1/navigation_bar/pick_up_page.dart';
import 'package:flutter_application_1/navigation_bar/settings.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       
        body: BottomNavBar());
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> buildScreens() {
      return [
        
        const HomePage(),
        const CartPage(),
        const PickUpPage(),
        const SettingPage(),

        // HomeScreen(),
        // SecondScreen(),
        // ThirdScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: const Color.fromARGB(255, 84, 237, 89),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.shopping_basket),
          title: ("Cart"),
          activeColorPrimary: const Color.fromARGB(255, 84, 237, 89),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),

        PersistentBottomNavBarItem(
          icon: const Icon(Icons.man),
          title: ("Pick-up"),
          activeColorPrimary: const Color.fromARGB(255, 84, 237, 89),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: ("Settings"),
          activeColorPrimary:  const Color.fromARGB(255, 84, 237, 89),
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        
      ];
    }

    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: controller,
      screens: buildScreens(),
      items: navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle
          .style1, // Choose the nav bar style with this property. ----------------------------------------------------------------
      //there are many style given in the documentation https://pub.dev/packages/persistent_bottom_nav_bar change the .style1 according to your needs
      //for example style15, style16 etc.
    );
  }
}