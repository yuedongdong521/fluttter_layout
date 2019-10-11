import 'package:flutter/material.dart';


class costomTextField extends StatefulWidget {
  costomTextField({Key key, this.placeholder = '',
    this.inputAction = TextInputAction.done,
    this.inputKeyBoardType = TextInputType.text,
  }) : super(key : key);

  final String placeholder;
  final TextInputAction inputAction;
  final TextInputType inputKeyBoardType;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _costomTextFieldState();
  }
}


class _costomTextFieldState extends State<costomTextField> {

  UnderlineInputBorder _textFieldUnderlineBorder() {
    return  UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1,
      )
    );
  }

  void _textFieldOnTap() {

    print('textField on tap');
  }

  void _textFieldOnChanged(String valueStr) {
    print('textField on changed : value = ' + valueStr);
  }

  void _textFieldReturnkey(String str) {
    print('textField on submitted (键盘return键) : str = ' + str);
  }

  void _textFieldEditComplete() {
    print('textField edit complete');
  }

  TextField _createTextField() {
    return new TextField(

      textInputAction: widget.inputAction,
      keyboardType: widget.inputKeyBoardType,
      controller: TextEditingController(),

      onTap: _textFieldOnTap,
      onChanged: _textFieldOnChanged,
      onSubmitted: _textFieldReturnkey,
      onEditingComplete: _textFieldEditComplete,



      decoration: InputDecoration(
        hasFloatingPlaceholder: false,
        labelText: widget.placeholder,
        labelStyle: new TextStyle(color: Colors.grey),
        border: _textFieldUnderlineBorder(),
        disabledBorder: _textFieldUnderlineBorder(),
        enabledBorder: _textFieldUnderlineBorder(),
        focusedBorder: _textFieldUnderlineBorder(),
        contentPadding: new EdgeInsets.fromLTRB(0, 0, 0, 10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: new EdgeInsets.all(0),
      padding: new EdgeInsets.all(0),
      child: _createTextField(),
    );
  }
}