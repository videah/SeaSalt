import 'package:flutter/material.dart';
import 'package:seasalt/widgets/desktop_title_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WindowAppBar(
        child: AppBar(
          title: Text("About SeaSalt"),
          backwardsCompatibility: true,
        ),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}