import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rmenu/base/clickable_item.dart';
import 'package:rmenu/base/style.dart';

class CategoryCard extends StatefulWidget {
  final String item;
  final onTap;

  const CategoryCard({
    Key? key,
    required this.item,
    this.onTap,
  }) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard>
    with SingleTickerProviderStateMixin {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClickableItem(
        onTap: widget.onTap,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                    Radius.circular(MySizeStyle.design(7, context)))),
            height: MySizeStyle.design(50, context),
            alignment: Alignment.center,
            margin: EdgeInsets.all(MySizeStyle.design(10, context)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                      Random().nextDouble() > 0.4
                          ? Icons.emoji_food_beverage_outlined
                          : Icons.fastfood_outlined,
                      size: MySizeStyle.design(60, context)),
                  SizedBox(height: MySizeStyle.design(20, context)),
                  Text(
                    textAlign: TextAlign.center,
                    widget.item,
                    style: MyTextStyle.h4Style(context),
                  )
                ])));
  }
}
