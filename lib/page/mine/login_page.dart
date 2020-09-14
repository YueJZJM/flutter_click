import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweibo/constant/constant.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          Padding(padding: const EdgeInsets.all(12.0),
            child: Text("帮助",
              style: TextStyle(fontSize: 16.0, color: Color(0xff6B91BB)),),
          )

        ],
        leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              Constant.ASSETS_IMG + 'icon_close.png',
              width: 20.0,
              height: 20.0,
            )),
      ),
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(top: 40),),
            Text("请输入账号密码",style: TextStyle(fontSize: 20),),
            buildEditText("手机号或邮箱"),
            buildEditText("密码"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child:
                  RaisedButton(child: Text("登录"),
                    color: Color(0xffFF8200),
                    textColor: Colors.white,
                    disabledTextColor: Colors.white,
                    disabledColor: Color(0xffFFD8AF),
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEditText(String text) {
    return TextField(decoration: InputDecoration(
        labelText: text
    ),);
  }
}
