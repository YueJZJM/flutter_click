import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterweibo/constant/constant.dart';
import 'package:flutterweibo/http/dio_manager.dart';
import 'package:flutterweibo/http/service_url.dart';
import 'package:flutterweibo/mode/WeiBoListModel.dart';
import 'package:flutterweibo/mode/WeiBoModel.dart';
import 'package:flutterweibo/utils/user_util.dart';
import 'package:flutterweibo/widget/wei_bo_item_widget.dart';

class WeiBoHomeListPage extends StatefulWidget {

  String mCatId = "";

  WeiBoHomeListPage({Key key, @required this.mCatId}) : super(key: key);

  @override
  _WeiBoHomeListPageState createState() => _WeiBoHomeListPageState();
}

class _WeiBoHomeListPageState extends State<WeiBoHomeListPage> {

  bool isRefreshloading = true;
  bool isloadingMore = false; //是否显示加载中
  bool ishasMore = true; //是否还有更多
  num mCurPage = 1;
  ScrollController _scrollController = new ScrollController();
  List<WeiBoModel> hotContentList = [];

  @override
  Widget build(BuildContext context) {
    return  WeiBoItemWidget(hotContentList[0], false);
  }

  @override
  void initState() {
    super.initState();
    getSubDataRefresh();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }


  Future getSubDataRefresh() async {
    isloadingMore = false;
    ishasMore = true;
    mCurPage = 1;

    FormData formData = FormData.fromMap({
      "catid": widget.mCatId,
      "pageNum": "1",
      "pageSize": Constant.PAGE_SIZE,
      "userId": UserUtil.getUserInfo().id,
    });

    DioManager.getInstance().post(ServiceUrl.getWeiBo, formData, (data) {
      WeiBoListModel category = WeiBoListModel.fromJson(data);
      hotContentList.clear();
      hotContentList.addAll(category.data.list);
      setState(() {
        isRefreshloading = false;
      });
    }, (error) {
      print("接口异常：" + error);
      //  ToastUtil.show(error);
      setState(() {
        isRefreshloading = false;
      });
    });
  }
  Future getSubDataLoadMore(int page) async {
    FormData formData = FormData.fromMap({
      "catid": widget.mCatId,
      "pageNum": page,
      "pageSize": Constant.PAGE_SIZE,
      "userId": UserUtil.getUserInfo().id,
    });
    List<WeiBoModel> mListRecords = new List();
    await DioManager.getInstance().post(ServiceUrl.getWeiBo, formData, (data) {
      WeiBoListModel category = WeiBoListModel.fromJson(data);
      mListRecords = category.data.list;
      setState(() {
        hotContentList.addAll(mListRecords);
        isloadingMore = false;
        ishasMore = mListRecords.length >= Constant.PAGE_SIZE;
      });
    }, (error) {
      setState(() {
        isloadingMore = false;
        ishasMore = false;
      });
    });
  }


}
