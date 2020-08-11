import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkMode;

  int _count;
  GlobalKey<ScaffoldState> _scaffoldKey;

  void _addCount({Function function}) {
    setState(() {
      _count++;
    });

    if (_count % 100 == 0) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Cieee... Suwung yaa...."),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
            label: "Tutup",
            onPressed: () {
              _scaffoldKey.currentState.hideCurrentSnackBar();
            }),
      ));
    }

    if (function != null) {
      function.call();
    }
  }

  @override
  void initState() {
    super.initState();
    _isDarkMode = false;
    _count = 0;
    _scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.white,
      appBar: AppBar(
        backgroundColor: _isDarkMode ? Colors.black : Colors.white,
        title: Text(
          "Penghitung",
          style: TextStyle(color: _isDarkMode ? Colors.white : Colors.black),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Dark Mode",
                style:
                    TextStyle(color: _isDarkMode ? Colors.white : Colors.black),
              ),
              Switch(
                value: _isDarkMode,
                onChanged: (newVal) {
                  setState(() {
                    _isDarkMode = newVal;
                  });
                },
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                      fontSize: 32.0,
                    ),
                  ),
                  Text(
                    _count.toString(),
                    style: TextStyle(
                      color: _isDarkMode ? Colors.white : Colors.black,
                      fontSize: 64.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: RawMaterialButton(
                onPressed: () => _addCount(),
                onLongPress: () => _addCount(function: () {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text("Jangan Ngecheat Anjing"),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                        label: "Tutup",
                        onPressed: () {
                          _scaffoldKey.currentState.hideCurrentSnackBar();
                        }),
                  ));
                }),
                elevation: 2.0,
                fillColor: _isDarkMode ? Colors.black : Colors.white,
                child: Icon(
                  Icons.add,
                  size: 86.0,
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
                padding: EdgeInsets.all(64.0),
                shape: CircleBorder(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.red,
                child: Text("Reset"),
                onPressed: () {
                  setState(() {
                    _count = 0;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
