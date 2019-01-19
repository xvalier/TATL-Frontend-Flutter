import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sets_frontend_flutter/grpcClient.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sets_frontend_flutter/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//STANDARD APPBAR
class Header extends PreferredSize {
  Header({this.title, this.height});
  final String title;
  final double height;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: new Text(
        title,
        style: appTheme.textTheme.title,
      ),
    );
  }
}

//STANDARD TEXTBOX
class TextDisplay extends StatelessWidget {
  TextDisplay({this.message, this.margin, this.color, this.border, this.flex});
  final String message;
  final double margin;
  final int color;
  final double border;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:new Container(
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.all(margin),
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(color),
          border: Border.all(
            color: Color(color),
            width: 0.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(border)),
        ),
        child: new Text(
          message,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
          style: appTheme.textTheme.headline,
        ),
      ),
      flex: flex,
    );
  }
}

//STANDARD BUTTON
class CustomButton extends StatelessWidget {
  CustomButton({this.function, this.color, this.tag, this.icon, this.text, this.flex});
  final VoidCallback function;
  final int color;
  final String tag;
  final IconData icon;
  final String text;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: new Column(
        children: <Widget>[
          new FloatingActionButton(
            onPressed: function,
            backgroundColor: Color(color),
            heroTag: tag,
            child: new Icon( icon ),
          ),
          new Text(
            text,
            style: appTheme.textTheme.display3,
          ),
        ],
      ),
      flex: flex,
    );
  }
}

//STANDARD BUTTON ROW
class ButtonRow extends StatelessWidget {
  ButtonRow({this.widgets, this.flex});
  final List<Widget> widgets;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:new Row(
        children: widgets,
      ),
      flex: flex,
    );
  }
}