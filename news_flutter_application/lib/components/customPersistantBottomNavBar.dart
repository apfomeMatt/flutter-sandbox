import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';

import '../pages/category_list.dart';
import '../pages/my_profile.dart';
import '../pages/news_feed.dart';

PersistentTabController _controller = PersistentTabController(initialIndex: 0);
List<Widget> _buildScreens() {
  return [NewsFeed(category: ''), CategoryList(), MyProfile()];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      title: ("News Feed"),
      activeColorPrimary: CupertinoColors.activeBlue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.list_bullet),
      title: ("Categories"),
      activeColorPrimary: CupertinoColors.activeGreen,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
     PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.person_crop_circle),
      title: ("My Profile"),
      activeColorPrimary: CupertinoColors.activeOrange,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}

@override
Widget customPersistentBottomNavBar(BuildContext context) {
  return PersistentTabView(
    context,
    controller: _controller,
    screens: _buildScreens(),
    items: _navBarsItems(),
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
    itemAnimationProperties: ItemAnimationProperties(
      // Navigation Bar's items animation properties.
      duration: Duration(milliseconds: 200),
      curve: Curves.ease,
    ),
    screenTransitionAnimation: ScreenTransitionAnimation(
      // Screen transition animation on change of selected tab.
      animateTabTransition: true,
      curve: Curves.ease,
      duration: Duration(milliseconds: 200),
    ),
    navBarStyle:
        NavBarStyle.style1, // Choose the nav bar style with this property.
  );
}
