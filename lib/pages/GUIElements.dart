import 'package:flutter/material.dart';
import 'package:sets_frontend_flutter/theme.dart';

//STANDARD APPBAR
class Header extends AppBar {
  Header({this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: new Text(
        message,
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

//NEXTPAGE DISPLAY BOX
class NextPageDisplay extends StatelessWidget {
  NextPageDisplay({this.message, this.pad, this.color, this.borderColor, this.border, this.flex});
  final String message;
  final double pad;
  final int borderColor;
  final int color;
  final double border;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:new Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.only(top:pad-2.0,left:pad, right:pad),
        margin: EdgeInsets.only(top:pad+4.0,left:pad, right:pad, bottom: pad-2.0),
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(color),
          border: Border.all(
            color: Color(borderColor),
            width: 2.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(border)),
        ),
        child: new Scrollbar(
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return new Text(
                message,
                textAlign: TextAlign.left,
                overflow: TextOverflow.clip,
                style: appTheme.textTheme.caption,
              );
            },
          ),
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