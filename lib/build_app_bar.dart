import 'package:flutter/material.dart';
import 'package:navapp/my_route_path.dart';

AppBar buildAppBar(tap) {
  return AppBar(
    title: Text('Tandem'),
    actions: [
      FlatButton(
          child: Text('Today'), onPressed: () => tap(MyRoutePath.todayPage)),
      FlatButton(
          child: Text('Inbox'), onPressed: () => tap(MyRoutePath.inboxPage)),
      FlatButton(
          child: Text('Clients'),
          onPressed: () => tap(MyRoutePath.clientsPage)),
      FlatButton(
          child: Text('Profile'),
          onPressed: () => tap(MyRoutePath.profilePage)),
    ],
  );
}
