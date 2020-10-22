import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_pdf/Constant.dart';
import 'package:to_pdf/DataGenerator.dart';
import 'package:to_pdf/main.dart';
import 'Models.dart';

class T10Dashboard extends StatefulWidget {
  static String tag = '/T10Dashboard';

  @override
  T10DashboardState createState() => T10DashboardState();
}

class T10DashboardState extends State<T10Dashboard> {
  var currentIndexPage = 0;
  List<Data> mDashboardList;

  @override
  void initState() {
    super.initState();
    mDashboardList = getData();
  }

  Function(BuildContext, String) placeholderWidgetFn() =>
      (_, s) => placeholderWidget();

  Widget placeholderWidget() =>
      Image.asset('images/LikeButton/image/grey.jpg', fit: BoxFit.cover);
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);
    var width = MediaQuery.of(context).size.width - 50;
    final Size cardSize = Size(width, width / 1.8);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            left: spacing_standard_new, right: spacing_standard_new),
        color: appStore.scaffoldBackground,
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: mDashboardList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(spacing_middle)),
                  child: CachedNetworkImage(
                    placeholder: placeholderWidgetFn(),
                    imageUrl: mDashboardList[index].img,
                    fit: BoxFit.cover,
                    height: width * 0.5,
                    width: width,
                  ),
                ),
                Text(
                  mDashboardList[index].title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(mDashboardList[index].url,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        )),
                  ],
                )
              ],
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
        ),
      ),
    );
  }
}
