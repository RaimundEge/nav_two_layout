import 'package:flutter/material.dart';
import 'package:navapp/states/app_state.dart';
import 'package:navapp/states/clients_state.dart';
import 'package:provider/provider.dart';
import 'package:navapp/my_router_delegate.dart';
import 'package:navapp/my_route_information_parser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MyRouterDelegate _routerDelegate = MyRouterDelegate();
  MyRouteInformationParser _routeInformationParser = MyRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider<AppState>(
            create: (_) => AppState(),
          ),
          ChangeNotifierProvider<ClientsState>(
            create: (_) => ClientsState(),
          )
          ],
        child: MaterialApp.router(
          title: 'My App',
          routerDelegate: _routerDelegate,
          routeInformationParser: _routeInformationParser,
        ));
  }
}
