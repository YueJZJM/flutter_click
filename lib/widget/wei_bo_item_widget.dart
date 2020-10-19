import 'package:flutter/material.dart';
import 'package:flutterweibo/constant/constant.dart';
import 'package:flutterweibo/mode/WeiBoModel.dart';

class WeiBoItemWidget extends StatelessWidget {
  WeiBoModel mModel;
  bool isDetail; //是否是详情界面

  WeiBoItemWidget(WeiBoModel data, bool isDetail) {
    this.mModel = data;
    this.isDetail = isDetail;
  }

  @override
  Widget build(BuildContext context) {
    return _wholeItemWidget(context, mModel, isDetail);
  }
}

Widget _wholeItemWidget(BuildContext context, WeiBoModel weiboItem, bool isDetail) {
  return Container(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _authorRow(context, weiboItem),
        // textContent(weiboItem.content, context, isDetail),
        // mVedioLayout(context, weiboItem.vediourl),
        // _NineGrid(context, weiboItem.picurl),
        // _RetWeetLayout(context, weiboItem, isDetail),
      ],
    ),
  );
}

Widget _RetWeetLayout(BuildContext context, weiboItem, bool isDetail) {
}

Widget _NineGrid(BuildContext context, picurl) {
}

//发布者昵称头像布局
Widget _authorRow(BuildContext context, weiboItem) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 2.0),
    child: Row(
      children: [
        InkWell(
          onTap: () {
            //TODO
            print("点击 item1");
          },
          child: Container(
            margin: EdgeInsets.only(right: 5),
            child:
            weiboItem.userInfo.isvertify == 0 ?
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: NetworkImage(weiboItem.userInfo.headurl),
                      fit: BoxFit.cover),
                    ),
                )
                :Stack(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        image: DecorationImage(
                            image: NetworkImage(weiboItem.userInfo.headurl),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        child: Image.asset(
                          (weiboItem.userInfo.isvertify == 1)
                              ? Constant.ASSETS_IMG + 'home_vertify.webp'
                              : Constant.ASSETS_IMG + 'home_vertify2.webp',
                          width: 15.0,
                          height: 15.0,
                        ),
                      ),
                    ),
                  ],
            )
          ),
        )
      ],
    ),
  );
}

Widget textContent(content, BuildContext context, bool isDetail) {

}

Widget mVedioLayout(BuildContext context, vediourl) {
}


