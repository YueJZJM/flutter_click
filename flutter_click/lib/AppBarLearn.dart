import 'package:flutter/material.dart';

class AppBarLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: 3,
        child: new Scaffold(
          // AppBar  Material 应用栏，有工具栏和其他的Widget构成 应用栏通常用于Scaffold.appBar属性，
          // 该属性将应用栏放置在屏幕顶部的固定高度小部件中。对于可滚动的应用栏，
          // 请参阅SliverAppBar，它将一个AppBar嵌入到一个条子中，以便在CustomScrollView中使用。
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              // leading: ,

              // 现在标题前面的Widget，一般为一个图标按钮，也可以是任意Widget
              // leading: Builder(
              //   builder: (BuildContext context) {
              //     return IconButton(
              //       icon: const Icon(Icons.menu),
              //       // 如果有抽屉的话的就打开
              //       onPressed: () {
              //         Scaffold.of(context).openDrawer();
              //       },
              //       // 显示描述信息
              //       tooltip:
              //       MaterialLocalizations.of(context).openAppDrawerTooltip,
              //     );
              //   },
              // ),
              // // 配合leading使用，取决于automaticallyImplyLeading == true && leading ==null ，此时会自动做出一些哈事情。
              // automaticallyImplyLeading: true,
              // // appBar的主要部件，类型为Widget，那么尝试做成输入框？
              // title: TextField(
              //   // 光标颜色
              //     cursorColor: Colors.blueGrey),
              // // title之后显示的部件，其实这样看来，Appbar可以看成一个Row (children: <Widget>[])布局
              // actions: <Widget>[
              //   Container(
              //     padding: EdgeInsets.only(right: 16),
              //     child: Icon(Icons.search),
              //   ),
              // ],
              // // 也是一个Widgets,不过好像有一些定义的Widgets 实在不知道怎么用，应为感觉大量重复，
              // flexibleSpace: FlexibleSpaceBar(title: Text('')),
              // 这个小部件出现在应用程序栏的底部。 通常是一个TarBar，即一个标签栏
              bottom: new TabBar(tabs: <Widget>[
                new Tab(icon: Icon(Icons.cloud_done)),
                new Tab(icon: Icon(Icons.cloud_download)),
                new Tab(icon: Icon(Icons.cloud_upload)),
              ]),
              // // 控制下方阴影栏的坐标
              // elevation: 4.0,
              // // 背景颜色
              // backgroundColor: Colors.blueAccent,
              // // 应用栏材质的亮度。
              // brightness: Brightness.light,
              // // icon主题设置
              // iconTheme: IconThemeData(),
              // // 文本主题设置
              // textTheme: TextTheme(),
              // // appbar是否显示在任务栏顶部
              // primary: true,
              // // title是否居中 实测没变化
              // centerTitle: true,
              // // 横轴上围绕title内容的间距  0.0即占据所有有用空间
              // titleSpacing: 0.0,
              // // 应用程序栏的工具栏部分是多么不透明。值1.0是完全不透明的，值0.0是完全透明的。
              // toolbarOpacity: 1,
              // // appabr底部透明度，设置方式同toolbarOpacity
              // bottomOpacity: 1,
            ),
          ),
          body: new TabBarView(children: <Widget>[
            new Icon(Icons.cloud_done, size: 100),
            new Icon(Icons.cloud_download, size: 100),
            new Icon(Icons.cloud_upload, size: 100),
          ]),
          // 定义一个空抽屉
          // drawer: Drawer(),
        ));
  }
}

