import 'package:flutter/material.dart';

class ClickableItem extends StatefulWidget {
  final onTap;
  final child;

  const ClickableItem({
    Key? key,
    @required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  _ClickableItemState createState() => _ClickableItemState();
}

class _ClickableItemState extends State<ClickableItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  bool mounted = true;

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 1000),
      lowerBound: 0.0,
      upperBound: 0.02,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    mounted = false;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double scale = 1 - _controller.value;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onDoubleTap: () {},
      child: Transform.scale(
        scale: scale,
        child: widget.child,
      ),
    );
  }

  void onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void onTapCancel() async {
    _controller.reverse();
  }

  void onTapUp(TapUpDetails details) async {
    _controller.reverse();

    if (widget.onTap != null) {
      await Future.delayed(const Duration(milliseconds: 200));
      widget.onTap();
    }
  }
}
