import 'package:flutter/material.dart';
import 'package:rmenu/base/clickable_item.dart';
import 'package:rmenu/base/style.dart';

import '../base/transition.dart';
import '../model/menuitem.dart';

class MenuItemPage extends StatefulWidget {
  final MenuItem menuItem;

  MenuItemPage(this.menuItem) : super();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MenuItemPageState createState() => _MenuItemPageState();
}

class _MenuItemPageState extends State<MenuItemPage> {
  bool isLoading = false;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(final AppLifecycleState state) {}

  buildHeader() {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.only(
                top: MySizeStyle.design(40, context),
                left: MySizeStyle.design(20, context),
                right: MySizeStyle.design(20, context)),
            child: SizedBox(
                width: MySizeStyle.design(50, context),
                height: MySizeStyle.design(50, context),
                child: ClickableItem(
                  child: const Icon(Icons.arrow_back_ios),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Stack(children: [
      Scaffold(
          backgroundColor: MyColorStyle.background,
          body: Stack(
            children: [
              SingleChildScrollView(
                  child: Column(children: [
                Image.asset(
                  "assets/images/burger.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MySizeStyle.design(400, context),
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MySizeStyle.pageHorizontal(context)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MySizeStyle.design(30, context),
                          ),
                          Text(widget.menuItem.name,
                              style: MyTextStyle.h2Style(context)),
                          SizedBox(
                            height: MySizeStyle.design(30, context),
                          ),
                          Text("\$${widget.menuItem.price.toStringAsFixed(2)}",
                              style: MyTextStyle.textStyle(context,
                                  size: MySizeStyle.design(28, context),
                                  color: MyColorStyle.darkGreyColor)),
                          SizedBox(
                            height: MySizeStyle.design(30, context),
                          ),
                          Text(widget.menuItem.modifiers,
                              style: MyTextStyle.textStyle(context,
                                  size: MySizeStyle.design(24, context),
                                  color: MyColorStyle.darkGreyColor))
                        ]))
              ])),
              buildHeader(),
              //   );
            ],
          ) // },
          ),
    ]);
  }
}
