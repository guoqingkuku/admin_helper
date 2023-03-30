import 'dart:convert';
import 'package:admin_helper/common/responsive.dart';
import 'package:flutter/material.dart';
import 'components/background.dart';
import 'components/welcome_image.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Responsive(
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: WelcomeImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: TextButton(
                          onPressed: () {
                            callApp();
                          },
                          child: const Text(
                            "Welcome to clx",
                            style: TextStyle(
                              fontSize: 40,
                               color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            mobile: const MobileWelcomeScreen(),
          ),
        ),
      ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const WelcomeImage(),
        Row(
          children: [
            const Spacer(),
            Expanded(
                flex: 8,
                child: TextButton(
                  onPressed: () {
                    callApp();
                  },
                  child: const Text(
                    "Welcome to clx",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                )),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}

void callApp() {
  // web 中调用flutter
  var prams = {"name": "flutter", "age": 18};
  var str = json.encode(prams);
  var ob = js.context['testAdd'];
  js.JsObject.fromBrowserObject(ob).callMethod('postMessage', [str]);
}
