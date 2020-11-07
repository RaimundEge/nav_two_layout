import 'package:flutter/material.dart';
import 'package:navapp/my_route_path.dart';
import 'package:navapp/screens/all.dart';
import 'package:navapp/screens/clients.dart';

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  // Book _currentTabViewRoute;
  bool show404 = false;
  String _currentRoute;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  MyRoutePath get currentConfiguration {
    if (show404) {
      return MyRoutePath.unknown();
    }

    return _currentRoute == null
        ? MyRoutePath.home()
        : MyRoutePath.details(_currentRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('HomePage'),
          child: TodayScreen(onTapped: _handleTapped),
        ),
        if (show404)
          MaterialPage(
              key: ValueKey('UnknownPage'),
              child: UnknownScreen(onTapped: _handleTapped))
        else if (_currentRoute != null)
          _getCurrentPage(_currentRoute)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _currentRoute to null
        _currentRoute = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  MaterialPage _getCurrentPage(String current) {
    switch (current) {
      case MyRoutePath.todayPage:
        return MaterialPage(
            key: ValueKey('TodayPage'),
            child: TodayScreen(onTapped: _handleTapped));
        break;
      case MyRoutePath.inboxPage:
        return MaterialPage(
            key: ValueKey('InboxPage'),
            child: InboxScreen(onTapped: _handleTapped));
        break;
      case MyRoutePath.clientsPage:
        return MaterialPage(
            key: ValueKey('ClientsPage'),
            child: ClientsScreen(onTapped: _handleTapped));
        break;
      case MyRoutePath.profilePage:
        return MaterialPage(
            key: ValueKey('ProfilePage'),
            child: ProfileScreen(onTapped: _handleTapped));
        break;

      default:
        return MaterialPage(
            key: ValueKey('UnknownPage'),
            child: UnknownScreen(onTapped: _handleTapped));
        break;
    }
  }

  @override
  Future<void> setNewRoutePath(MyRoutePath path) async {
    if (path.isUnknown) {
      _currentRoute = null;
      show404 = true;
      return;
    }
    if (path.isDetailsPage) {
      if (!MyRoutePath.all.contains(path.id)) {
        show404 = true;
        return;
      }
      _currentRoute = path.id;
    } else {
      _currentRoute = null;
    }
    show404 = false;
  }

  void _handleTapped(String page) {
    _currentRoute = page;
    notifyListeners();
  }
}
