import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutterweibo/routers/route_handlers.dart';

class Routes {
  // 路由管理
  static Router router;
  static String indexPage = '/indexpage';
  static String loginPage = '/loginpage';
  static String settingPage = '/settingpage';
  static String feedbackPage = '/feedbackpage';
  static String changeNickNamePage = '/changeNickNamePage';
  static String changeDescPage = '/changeDescPage';
  static String personMyFollowPage = '/personMyFollowPage';
  static String personFanPage = '/personFanPage';
  static String chatPage = '/chatPage';
  static String weiboPublishPage = '/weiboPublishPage';
  static String weiboPublishAtUsrPage = '/weiboPublishAtUsrPage';
  static String weiboPublishTopicPage = '/weiboPublishTopicPage';
  static String weiboCommentDetailPage = '/weiboCommentDetailPage';
  static String topicDetailPage = '/topicDetailPage';
  static String hotSearchPage = '/hotSearchPage';
  static String msgZanPage = '/msgZanPage';
  static String msgCommentPage = '/msgCommentPage';
  static String personinfoPage = '/personinfoPage';
  static String videoDetailPage = '/videoDetailPage';


  static void configureRoutes(Router router) {
    // List widgetDemosList = new WidgetDemoList().getDemos();
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print('route not found!');
        });

    router.define(indexPage, handler: indexPageHandler);

    router.define(loginPage, handler: loginPageHandler);
  }


    // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配(https://www.jianshu.com/p/e575787d173c)
  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
        bool clearStack = false,
        TransitionType transition = TransitionType.fadeIn}) {
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是navigateTo传递的参数：$query');

    path = path + query;
    return router.navigateTo(context, path,
        clearStack: clearStack, transition: transition);
  }


}

