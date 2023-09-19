import 'package:flutter/material.dart';
import 'package:rmenu/base/style.dart';
import 'package:rmenu/component/menuitem_card.dart';
import 'package:rmenu/page/menuitem_page.dart';

import '../base/transition.dart';
import '../model/menuitem.dart';

class CategoryPage extends StatefulWidget {
  final String title;
  final List<MenuItem> listMenuItem;

  CategoryPage(this.title, this.listMenuItem) : super();

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(widget.title, style: MyTextStyle.pageTitleStyle(context)),
        backgroundColor: Colors.white,
      ),
      body: Container(
          color: MyColorStyle.background,
          padding: EdgeInsets.symmetric(
              vertical: MySizeStyle.pageVertical(context)),
          child: ListView.builder(
            itemBuilder: (c, i) => MenuItemCard(
                item: widget.listMenuItem[i],
                onTap: () {
                  goToMenuItemPage(widget.listMenuItem[i]);
                }),
            itemCount: widget.listMenuItem.length,
          )),
      //   );
    );
  }

  void goToMenuItemPage(MenuItem item) {
    Navigator.of(context).push(Transition.createPageRoute(MenuItemPage(item)));
  }
}
