import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterweibo/constant/constant.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment:  Alignment.center,
          child:  Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Spacer(
                flex: 1,
              ),
              Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.center,
                    width: 100,
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage(
                          Constant.ASSETS_IMG + "welcome_android_slogan.png"),
                    )),
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 1,
                child: Container(
                    width: 100,
                    alignment: Alignment.center,
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage(

                          Constant.ASSETS_IMG + 'welcome_android_logo.png'),
                    )),
              )
            ],
          ),
        ));
  }
}
