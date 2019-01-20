import 'package:flutter/material.dart';
import 'package:sets_frontend_flutter/theme.dart';

//STANDARD APPBAR
class Header extends AppBar {
  Header({this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return new AppBar(
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

//SYMPTOMS LIST WRAPPER
class SymptomsList extends StatelessWidget{
  SymptomsList({this.margin, this.border, this.color, this.borderColor, this.item, this.flex});
  final double margin;
  final double border;
  final int color;
  final int borderColor;
  final StatelessWidget item;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(color),
          border: Border.all(
            color: Color(borderColor),
            width: 2.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(border)),
        ),
        child: Scrollbar(
          child: item,
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
      child: new ListView(
        children: <Widget>[
          Row(
            children: widgets,
          ),
        ]
      ),
      flex: flex,
    );
  }
}

//USER DESCRIPTION FIELD
class QuestionInput extends StatelessWidget {
  QuestionInput({this.margin, this.color, this.borderColor, this.border,
  this.flex, this.hint, this.controller});
  final double margin;
  final int color;
  final int borderColor;
  final double border;
  final int flex;
  final String hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child:new Container(
        constraints: BoxConstraints.expand(),
        margin: EdgeInsets.all(margin),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(color),
          border: Border.all(
            color: Color(borderColor),
            width: 2.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(border)),
        ),
        child: TextField(
          style: appTheme.textTheme.caption,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(color),
            border: InputBorder.none,
            hintText: hint,
          ),
          controller: controller,
          maxLines: null,
        ),
      ),
      flex: flex,
    );
  }
}

//SINGLE ROW FORM ENTRY
class FormRow extends StatelessWidget {
  FormRow({this.label, this.hint, this.controller, this.mask});
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool mask;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          label,
          textAlign: TextAlign.left,
          style: appTheme.textTheme.caption,
        ),
        Flexible(
          child: new TextField(
            textAlign: TextAlign.left,
            style: appTheme.textTheme.caption,
            decoration: InputDecoration(
              hintText: hint,
            ),
            controller: controller,
            obscureText: mask,
          ),
        ),
      ],
    );
  }
}

//ERROR MESSAGE
class ErrorMessage extends StatelessWidget {
  ErrorMessage({this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 15.0),
      child: Text(
        message,
        textAlign: TextAlign.left,
        overflow: TextOverflow.clip,
        style: appTheme.textTheme.display1,
      ),
    );
  }
}

//FULL Form
class FullForm extends StatelessWidget{
  FullForm({this.rows, this.flex});
  final List<StatelessWidget> rows;
  final int flex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(left:15.0, right:15.0),
        children: rows,
      ),
      flex: flex,
    );
  }
}