import 'package:example/unify_load_status_view.dart';
import 'package:flutter/material.dart';
import 'package:load_status_view/load_status_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'LoadStatusView Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LoadStatus loadStatus = LoadStatus.loading;
  String errorTip = '';
  String emptyTip = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                ///default
                Expanded(
                    child: LoadStatusView(
                  status: loadStatus,
                  iconColor: Colors.blueGrey,
                  emptyTip: emptyTip,
                  errorCall: _retry,
                  child: const Center(
                    child: Text('normal data'),
                  ),
                  unauthorizedCall: _login,
                )),
                Divider(),

                ///custom property.
                Expanded(
                    child: LoadStatusView(
                  status: loadStatus,
                  loadingTip: 'loading loading',
                  iconColor: Colors.green,
                  emptyIcon: Icon(
                    Icons.no_cell_outlined,
                    size: 44,
                    color: Colors.green,
                  ),
                  emptyButton: ElevatedButton(
                    onPressed: _loadData,
                    child: Text("request again"),
                  ),
                  showEmptyButton: true,
                  errorIcon: const Icon(
                    Icons.error_outline_outlined,
                    size: 44,
                    color: Colors.green,
                  ),
                  emptyTip: emptyTip,
                  emptyButtonText: "look others",
                  errorTip: errorTip,
                  errorCall: _retry,
                  unauthorizedTip: 'Unauthorized',
                  showUnauthorizedButton: true,
                  unauthorizedCall: _login,
                  child: Center(
                    child: FlutterLogo(
                      size: 44,
                    ),
                  ),
                )),
                Divider(),

                ///unify for the whole project.
                Expanded(
                    child: UnifyLoadStatusView(
                  status: loadStatus,
                  child: Center(
                    child: FlutterLogo(
                        size: 88, style: FlutterLogoStyle.horizontal),
                  ),
                  emptyCall: _loadData,
                  errorTip: 'unify $errorTip',
                  errorCall: _retry,
                  unauthorizedCall: _login,
                ))
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  child: Text("loading"),
                  onPressed: () {
                    _loadData();
                  },
                ),
                Spacer(),
                ElevatedButton(
                  child: Text("success"),
                  onPressed: () {
                    _setStatus(LoadStatus.success);
                  },
                ),
                Spacer(),
                ElevatedButton(
                  child: Text("empty"),
                  onPressed: () {
                    _setStatus(LoadStatus.empty);
                  },
                ),
                Spacer(),
                ElevatedButton(
                  child: Text("error"),
                  onPressed: () {
                    _setStatus(LoadStatus.error);
                  },
                ),
                Spacer(),
                ElevatedButton(
                  child: Text("unauth"),
                  onPressed: () {
                    _setStatus(LoadStatus.unauthorized);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  _loadData() {
    _setStatus(LoadStatus.loading);
    Future.delayed(Duration(seconds: 2), () {
      _setStatus(LoadStatus.success);
    });
  }

  _retry() {
    _loadData();
  }

  _login() {
    //do login
    _loadData();
  }

  _setStatus(LoadStatus status) {
    setState(() {
      loadStatus = status;
      if (status == LoadStatus.error) {
        errorTip = "something is wrong.";
      } else if (status == LoadStatus.empty) {
        emptyTip = "nothing now.";
      }
    });
  }
}
