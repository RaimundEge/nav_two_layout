import 'package:flutter/material.dart';
import 'package:navapp/my_route_path.dart';

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath> {
  @override
  Future<MyRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return MyRoutePath.home();
    }

    // Handle '/tabitem'
    if (uri.pathSegments.length > 0) {
      // Handle today as home page
      if (uri.pathSegments[0] == 'today') return MyRoutePath.home();
      if (MyRoutePath.all.contains(uri.pathSegments[0]))
        return MyRoutePath.details(uri.pathSegments[0]);
      else
        return MyRoutePath.unknown();
    }

    // Handle unknown routes
    return MyRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(MyRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isDetailsPage) {
      return RouteInformation(location: '/${path.id}');
    }
    return null;
  }
}
