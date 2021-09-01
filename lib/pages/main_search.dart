import 'package:flutter/material.dart';

class MainSearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SeaSalt"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            tooltip: "Settings",
            onPressed: () {
              Navigator.of(context).pushNamed("/settings");
            },
          )
        ],
      ),
    );
  }
}