import 'package:admin_helper/common/responsive.dart';
import 'package:admin_helper/welcome/components/background.dart';
import 'package:flutter/material.dart';

class AppToJs extends StatelessWidget {
  const AppToJs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(children: [Text('Desktop')]),
            mobile: MobileAppToJsScreen(),
          ),
        ),
      ),
    );
  }
}

class MobileAppToJsScreen extends StatelessWidget {
  const MobileAppToJsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(onPressed: () {
          
        }, child: const Text('Button 1')),
      ],
    );
  }
}
