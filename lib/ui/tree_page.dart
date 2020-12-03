import 'dart:math';

import 'package:TreeChristmas/widgets/light.dart';
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
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 8),
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
            for (final x in _offsets)
              Light(
                x: x,
              ),
            Center(child: Text('Merry Christmas'))
          ],
        ),
      ),
    );
  }

  static Iterable<double> _generateOffsets(
      int count, double acceleration) sync* {
    double x = 0;
    yield x;

    double ax = acceleration;
    for (int i = 0; i < count; i++) {
      x += ax;
      ax *= 1.5;

      final maxLateral = min(1, i / count);
      if (x.abs() > maxLateral) {
        x = maxLateral * x.sign;
        ax = x >= 0 ? -acceleration : acceleration;
      }
      yield x;
    }
  }
}

