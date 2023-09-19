import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rmenu/base/style.dart';
import 'package:rmenu/component/category_card.dart';
import 'package:rmenu/global/constants.dart';
import 'package:rmenu/model/menuitem.dart';
import 'package:rmenu/page/category_page.dart';

import 'base/transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BackGestureWidthTheme(
        backGestureWidth: BackGestureWidth.fraction(1 / 3),
        child: MaterialApp(
          title: 'Ourself Restaurant Menu',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  // for Android - default page transition
                  TargetPlatform.android:
                      CupertinoPageTransitionsBuilderCustomBackGestureWidth(),

                  // for iOS - one which considers ancestor BackGestureWidthTheme
                  TargetPlatform.iOS:
                      CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
                },
              ),
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              cupertinoOverrideTheme: const CupertinoThemeData(
                  textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle:
                    TextStyle(color: Colors.black, fontSize: 17),
                pickerTextStyle: TextStyle(color: Colors.black, fontSize: 12),
              ))),
          home: const MyHomePage(title: 'Ourself Restaurant Menu'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _clickCart() {}

  void goToCategoryPage(int index) {
    // Filter menu items by category
    List<MenuItem> listMenuItem = [];
    if (g_listMenuItem.isNotEmpty) {
      for (var i = 0; i < g_listMenuItem.length; i++) {
        MenuItem item = g_listMenuItem[i];
        if (item.categoryId == index + 1) {
          listMenuItem.add(item);
        }
      }
    }

    if (listMenuItem.isNotEmpty) {
      Navigator.of(context).push(Transition.createPageRoute(
          CategoryPage(g_listCategory[index], listMenuItem)));
    } else {
      // No menu item
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 1),
        content: Text("No menu item"),
      ));
    }
  }

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
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: true,
        title: Text(widget.title, style: MyTextStyle.pageTitleStyle(context)),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(MySizeStyle.design(7, context)),
        height: double.infinity,
        color: MyColorStyle.lighterGreyColor,
        child: GridView.builder(
            primary: false,
            padding: EdgeInsets.only(
                top: MySizeStyle.design(0, context),
                bottom: MySizeStyle.design(20, context)),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: g_listCategory.length,
            itemBuilder: (c, i) {
              return CategoryCard(
                  item: g_listCategory[i],
                  onTap: () {
                    goToCategoryPage(i);
                  });
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clickCart,
        tooltip: 'Cart',
        child: const Icon(Icons.shopping_cart),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
