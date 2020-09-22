import 'package:flutter/material.dart';
import 'package:flutterweibo/page/home/weibo_follow_page.dart';
import 'package:flutterweibo/page/home/weibo_hot_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var appBarTitles = ['关注', '热门'];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: appBarTitles.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (
        Container(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).padding.top, 0, 0),
            child: Column(
              children: [
                Stack(
                 children: [
                   Container(
                     alignment: Alignment.center,
                     child: TabBar(
                         isScrollable: true,
                         indicatorColor: Color(0xffFF3700),
                         indicator: UnderlineTabIndicator(
                             borderSide:
                             BorderSide(color: Color(0xffFF3700), width: 2),
                             insets: EdgeInsets.only(bottom: 7)),
                         labelColor: Color(0xff333333),
                         unselectedLabelColor: Color(0xff666666),
                         labelStyle:
                         TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                         unselectedLabelStyle: TextStyle(fontSize: 16.0),
                         indicatorSize: TabBarIndicatorSize.label,
                         controller: _tabController,
                         tabs: appBarTitles.map((e) => Tab(text: e)).toList(),
                     onTap: (int a){
                           print("aaa");
                     },),
                   ),
                   Align(
                     alignment: Alignment.topRight,
                     child: IconButton(icon: Image.asset("assets/images/ic_main_add.png",width: 40.0, height: 40.0),
                         onPressed:(){
                           print('点击');
                         } ),
                   ),
                 ],
               ),
                Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[new WeiBoFollowPage(), new WeiBoHotPage()],
                    ),
                )
              ],
            ),
        )
      ),
    );
  }
}
