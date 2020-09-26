import 'package:flutter/material.dart';

import 'weibo_homelist_page.dart';

class WeiBoHotPage extends StatefulWidget {
  @override
  _WeiBoHotPageState createState() => _WeiBoHotPageState();
}

class _WeiBoHotPageState extends State<WeiBoHotPage> {
  final List<String> _tabValues = ['推荐', '附近', '榜单', '明星', '搞笑', '社会', '测试'];
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 7, vsync: ScrollableState());
      // ..addListener(() {
      //   print(_controller.index);
      // });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Stack(
            children: [
              Container(
                color: Color(0xffffffff),
                alignment: Alignment.center,
                child:  TabBar(
                  isScrollable: true,
                  indicatorColor: Color(0xffffffff),
                  labelColor: Color(0xffFF3700),
                  unselectedLabelColor: Color(0xff666666),
                  labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  unselectedLabelStyle: TextStyle(fontSize: 16.0),
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _controller,
                  tabs: _tabValues.map((e) => Tab(text: e)).toList(),
                ),
              ),
            ],
          ),
          Container(
            height: 0.5,
            color: Color(0xffBECBC2),
          ),
          Expanded(
              child:TabBarView(
                controller: _controller,
                  children:  <Widget>[
                    Center(
                      child: Text("暂无数据1"),
                    ),
                    Center(
                      child: Text("暂无数据2"),
                    ),
                    Center(
                      child: Text("暂无数据3"),
                    ),
                    Center(
                      child: Text("暂无数据4"),
                    ),
                    Center(
                      child: Text("暂无数据5"),
                    ),
                    Center(
                      child: Text("暂无数据6"),

                    ),
                    Center(
                      child: MaterialButton(
                        onPressed: (){
                          print("7777");
                        },
                          child: Text("暂无数据7")),
                    ),
                    //  new WeiBoHomeListPager(),
                  ],
              ) )
        ],
      );
  }
}
