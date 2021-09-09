import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

class WindowAppBar extends StatelessWidget with PreferredSizeWidget {
  final PreferredSizeWidget child;

  const WindowAppBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isWindows) {
      return Column(
        children: [
          WindowTitleBar(),
          child,
        ],
      );
    } else {
      return child;
    }
  }

  Size getAppBarSize() {
    if (Platform.isWindows) {
      return Size.fromHeight(
        appWindow.titleBarHeight + child.preferredSize.height,
      );
    }
    return child.preferredSize;
  }

  @override
  Size get preferredSize => getAppBarSize();
}

class WindowTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Hero(
        tag: "title-bar",
        child: WindowTitleBarBox(
          child: Material(
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("SeaSalt"),
                      ),
                      MoveWindow(),
                    ],
                  ),
                ),
                WindowButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brightness = ThemeData.estimateBrightnessForColor(
      Theme.of(context).primaryColor,
    );

    final secondaryBrightness = ThemeData.estimateBrightnessForColor(
      Theme.of(context).cardColor,
    );
    final color = brightness == Brightness.dark ? Colors.white : Colors.black;
    final secondaryColor = secondaryBrightness == Brightness.dark ? Colors.white : Colors.black;
    final buttonColors = WindowButtonColors(
      mouseOver: Theme.of(context).cardColor,
      iconNormal: color,
      iconMouseOver: secondaryColor,
    );

    final closeButtonColors = WindowButtonColors(
        mouseOver: const Color(0xFFD32F2F),
        mouseDown: const Color(0xFFB71C1C),
        iconNormal: color,
        iconMouseOver: Colors.white,
    );
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
