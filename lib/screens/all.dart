import 'package:flutter/material.dart';
import 'package:navapp/build_app_bar.dart';

class TodayScreen extends StatelessWidget {
  final ValueChanged<String> onTapped;
  TodayScreen({@required this.onTapped});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(onTapped),
      body: Center(
        child: Text('Today'),
      ),
    );
  }
}

class InboxScreen extends StatelessWidget {
  final ValueChanged<String> onTapped;
  InboxScreen({@required this.onTapped});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(onTapped),
      body: Center(
        child: Text('Inbox'),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final ValueChanged<String> onTapped;
  ProfileScreen({@required this.onTapped});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(onTapped),
      body: Center(
        child: Text('Profile'),
      ),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  final ValueChanged<String> onTapped;
  UnknownScreen({@required this.onTapped});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(onTapped),
      body: Center(
        child: Text('page not found'),
      ),
    );
  }
}
