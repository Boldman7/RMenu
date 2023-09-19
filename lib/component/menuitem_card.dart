import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rmenu/base/clickable_item.dart';
import 'package:rmenu/base/style.dart';
import 'package:rmenu/model/menuitem.dart';

class MenuItemCard extends StatefulWidget {
  final MenuItem item;
  final onTap;

  const MenuItemCard({
    Key? key,
    required this.item,
    this.onTap,
  }) : super(key: key);

  @override
  _MenuItemCardState createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard>
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
            alignment: Alignment.center,
            padding: EdgeInsets.all(MySizeStyle.design(10, context)),
            margin: EdgeInsets.symmetric(
                vertical: MySizeStyle.design(5, context),
                horizontal: MySizeStyle.design(15, context)),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                height: MySizeStyle.design(60, context),
                width: MySizeStyle.design(60, context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/burger.jpg"))),
              ),
              SizedBox(width: MySizeStyle.design(20, context)),
              Expanded(
                  child: Text(
                widget.item.name,
                style: MyTextStyle.textStyle(context),
              )),
              SizedBox(width: MySizeStyle.design(20, context)),
              Text(
                "\$${widget.item.price.toStringAsFixed(2)}",
                style: MyTextStyle.textStyle(context,
                    size: MySizeStyle.design(22, context), color: MyColorStyle.normalGreyColor),
              ),
              SizedBox(width: MySizeStyle.design(10, context)),
            ])));
  }
}
