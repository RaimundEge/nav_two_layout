import 'package:flutter/material.dart';
import 'package:navapp/build_app_bar.dart';
import 'package:navapp/states/app_state.dart';
import 'package:navapp/states/clients_state.dart';
import 'package:provider/provider.dart';

class ClientsScreen extends StatefulWidget {
  ClientsScreen({@required this.onTapped});
  @override
  _ClientsScreenState createState() => _ClientsScreenState();
  final ValueChanged<String> onTapped;
}

class _ClientsScreenState extends State<ClientsScreen> {
  String user;
  ClientsState state;
  @override
  void initState() {
    super.initState();
    user = context.read<AppState>().user;
    state = context.read<ClientsState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(widget.onTapped),
        body: Center(
          child: FlatButton(
            onPressed: () {
              setState(() {
                state.currentEngagement += '+';
              });
            },
            child: Text('$user has client: ${state.currentEngagement}'),
          ),
        ));
  }
}
