import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterweibo/constant/constant.dart';
import 'package:flutterweibo/routers/application.dart';
import 'package:flutterweibo/routers/routers.dart';
import 'package:flutterweibo/utils/sp_util.dart';
import 'package:flutterweibo/utils/user_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SpUtil.getInstance();

    Future.delayed(new Duration(seconds: 1),(){
       UserUtil.isLogin().then((isLogin){
          if(isLogin) {
            Navigator.pop(context);
            Routes.navigateTo(context, Routes.indexPage, clearStack: true);
          }else {
            Navigator.pop(context);
            Routes.navigateTo(context, Routes.loginPage, clearStack: true);
          }
       });

    });
  }



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
                    width: 200,
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
                    width: 200,
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
