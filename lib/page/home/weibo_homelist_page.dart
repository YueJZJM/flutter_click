import 'package:flutter/material.dart';

class WeiBoHomeListPage extends StatefulWidget {
  String mCatId = "";


  WeiBoHomeListPage({Key key, @required this.mCatId}) : super(key: key);


  @override
  _WeiBoHomeListPageState createState() => _WeiBoHomeListPageState();
}

class _WeiBoHomeListPageState extends State<WeiBoHomeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.mCatId),
    );
  }
}
