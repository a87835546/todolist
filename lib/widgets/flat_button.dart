import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list/utils/full_screen_dialog_util.dart';
import 'package:todo_list/utils/icon_list_util.dart';
import 'package:todo_list/widgets/bottom_show_widget.dart';
import 'package:todo_list/config/floating_border.dart';

class FlatButton extends StatefulWidget {

  final Color color;
  final Color highlightColor;
  final Color splashColor;
  final Brightness primaryColorLight;

  const FlatButton(Key? key,{
    required this.color,required this.splashColor,
    required this.primaryColorLight,required this.highlightColor}) : super(key: key);

  @override
  _FlatButtonState createState() => _FlatButtonState();
}

class _FlatButtonState extends State<FlatButton> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        // highlightColor: widget.color,
        // colorBrightness: Brightness.dark,
        // splashColor: Colors.grey,
      ),
      child: Container(),
    );
  }
}
