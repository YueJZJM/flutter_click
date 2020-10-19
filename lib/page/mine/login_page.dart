import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterweibo/constant/constant.dart';
import 'package:flutterweibo/http/dio_manager.dart';
import 'package:flutterweibo/http/service_url.dart';
import 'package:flutterweibo/routers/routers.dart';
import 'package:flutterweibo/utils/toast_util.dart';
import 'package:flutterweibo/utils/user_util.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
String _inputAccount = "";
String _inputPwd = "";

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "帮助",
              style: TextStyle(fontSize: 16.0, color: Color(0xff6B91BB)),
            ),
          )
        ],
        leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              Constant.ASSETS_IMG + 'icon_close.png',
              width: 20.0,
              height: 20.0,
            )),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40),
              ),
              Text(
                "请输入账号密码",
                style: new TextStyle(fontSize: 24.0, color: Colors.black),
              ),
              //TODO AccountEditText
              Container(margin:  const EdgeInsets.only( top: 30.0),
                //TODO AccountEditText
                child: buildUserNameEditText("手机号或邮箱"),),
//            buildEditText("手机号或邮箱"),
              //TODO PwdEditText
              buildPasswordEditText("密码"),
              Padding(padding:  const EdgeInsets.only(top: 60),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text("登 录"),
                      color: Color(0xffFF8200),
                      textColor: Colors.white,
                      disabledTextColor: Colors.white,
                      disabledColor: Color(0xffFFD8AF),
                      onPressed: (_inputAccount.isEmpty || _inputPwd.isEmpty)
                          ? null
                          :(){
                            FormData params =
                            FormData.fromMap( {'username': _inputAccount, 'password': _inputPwd});
                            DioManager.getInstance().post(ServiceUrl.login,params,(data){
                              UserUtil.saveUserInfo(data['data']);
                              ToastUtil.show('登录成功!');
                              Navigator.pop(context);
                              Routes.navigateTo(context, Routes.indexPage);
                            },(error){
                              ToastUtil.show(error);
                            });
                      }
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text("注册"),
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerRight,
                    child: Text("忘记密码"),
                  )),
                ],
              ),
              Padding(padding: const EdgeInsets.only(top: 40),),
              buildOtherLoginWayText(),
              Padding(padding:  const EdgeInsets.only(top: 150),),
              buildOtherLoginWay(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildUserNameEditText(String text) {
    return TextField(
      decoration: InputDecoration(
          labelText: text,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: Colors.orange,
          )
        )
      ),
      onChanged: (v){
        _inputAccount = v;
        setState(() {

        });
      },
    );
  }

  buildPasswordEditText(String text) {
    return TextField(
      decoration: InputDecoration(
          labelText: text,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orange,
              )
          )
      ),
      obscureText:true,
      onChanged: (v){
        _inputPwd = v;
        print(_inputPwd);
        setState(() {

        });
      },
    );
  }


  Widget buildOtherLoginWayText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            height: 1,
            color: Color(0xffEAEAEA),
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text("其他登录方式"),
          )
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 1,
            color: Color(0xffEAEAEA),
          ),
        )
      ],
    );
  }

  Widget buildOtherLoginWay() {
    return Row(
      children: <Widget>[
        Expanded(
          child:Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 10),
            child: Column(
              children: <Widget>[
                Image.asset(
                  Constant.ASSETS_IMG + 'login_weixin.png',
                  width: 40.0,
                  height: 40.0,
                ),
                Text("微信"),
              ],
            ),
          ),
          flex: 1,
        ),
        Expanded(
          flex: 1,
          child:Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 10),
            child: Column(
              children: <Widget>[
                Image.asset(
                  Constant.ASSETS_IMG + 'login_qq.png',
                  width: 40.0,
                  height: 40.0,
                ),
                Text("QQ"),
              ],
            ),
          ),
        ),
        // Expanded(
        //   child:Container(),
        //   flex: 1,
        // )
      ],
    );
  }

}

