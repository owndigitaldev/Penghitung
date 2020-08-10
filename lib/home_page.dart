import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isDarkMode = false;
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text("Total"),
                  Text(_count.toString()),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: RawMaterialButton(
                onPressed: () {
                  setState(() {
                    _count++;
                  });
                },
                elevation: 2.0,
                fillColor: Colors.white,
                child: Icon(
                  Icons.add,
                  size: 35.0,
                ),
                padding: EdgeInsets.all(15.0),
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
