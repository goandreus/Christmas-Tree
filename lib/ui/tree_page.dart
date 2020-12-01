import 'package:flutter/material.dart';

class TreePage extends StatelessWidget {
  const TreePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _offsets = List.generate(10, (i) => i);
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
            for (final x in _offsets) Light(),
            Center(
              child: Text('Merry Christmas')
            )
          ],
        ),
      ),
    );
  }
}

class Light extends StatefulWidget {
  Light({Key key}) : super(key: key);

  @override
  _LightState createState() => _LightState();
}

class _LightState extends State<Light> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        height: 10,
        child: Align(
          alignment: Alignment.center,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}