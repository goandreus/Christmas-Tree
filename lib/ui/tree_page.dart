import 'dart:math';

import 'package:flutter/material.dart';

class TreePage extends StatelessWidget {
  const TreePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _offsets = _generateOffsets(100, 0.05).toList(growable: false);
    return Material(
      color: Colors.black,
      child: Container(
        constraints: BoxConstraints(maxWidth: 700, minWidth: 700),
        padding:  EdgeInsets.symmetric(vertical: 40, horizontal:8),
        child: ListView(
          children: [
            Center(
              child: Icon(
                Icons.star,
                color: Colors.white,
              ),
            ),
            SizedBox(
                height: 8,
            ),
            for (final x in _offsets) Light( x: x,),
            Center(
              child: Text('Merry Christmas')
            )
          ],
        ),
      ),
    );
  }
  static Iterable<double> _generateOffsets(int count, double acceleration)sync*{
    double x = 0;
    yield x; 
    double ax = acceleration;
    for (int i = 0; i < count; i++) {
      x += ax;
      ax *= 1.5;

      final maxLateral = min(1, 1 / count);
      if(x.abs() > maxLateral){
        x = maxLateral * x.sign;
        ax = x >= 0 ? - acceleration : acceleration;
      }
      yield x;
    }
  }
}

class Light extends StatefulWidget {
  Light({Key key, this.x}) :
    period = 500 + (x.abs() * 5000).floor(),
    color = festiveColors[Random().nextInt(4)],
    super(key: key);

  static final festiveColors = [Colors.red, Colors.green, Colors.yellow, Colors.orange];

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
            onEnd: (){
              setState(() {
                _newColor = _newColor == Colors.white ? widget.color : Colors.white;
              });
            },
            builder: (_, color, __){
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