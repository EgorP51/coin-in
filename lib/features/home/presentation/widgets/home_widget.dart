import 'package:coin_in/core/ui/widgets/custom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/widgets/app_scaffold.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
