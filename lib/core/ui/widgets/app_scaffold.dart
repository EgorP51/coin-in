import 'package:flutter/material.dart';

import '../style.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.body,
    this.appBar,
    this.bottomNavigationBar,
  });

  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (Theme.of(context).brightness == Brightness.light)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kLightPeach, kWhite],
              ),
            ),
          )
        else
          Container(),
        SafeArea(
          bottom: false,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: body,
            appBar: appBar,
            bottomNavigationBar: bottomNavigationBar,
          ),
        ),
      ],
    );
  }
}
