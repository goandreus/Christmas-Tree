import 'dart:math';

import 'package:flutter/material.dart';

class Light extends StatefulWidget {
  Light({Key key, this.x})
      : period = 500 + (x.abs() * 5000).floor(),
        color = festiveColors[Random().nextInt(4)],
        super(key: key);

  static final festiveColors = [
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  final double x;

  final int period;

  final Color color;

  @override
  _LightState createState() => _LightState();
}

class _LightState extends State<Light> {
  Color _newColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: Align(
        alignment: Alignment(widget.x, 0.0),
        child: AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
            duration: Duration(milliseconds: widget.period),
            tween: ColorTween(begin: widget.color, end: _newColor),
            onEnd: () {
              setState(() {
                _newColor =
                    _newColor == Colors.white ? widget.color : Colors.white;
              });
            },
            builder: (_, color, __) {
              return Container(
                color: color,
              );
            },
          ),
        ),
      ),
    );
  }
}
