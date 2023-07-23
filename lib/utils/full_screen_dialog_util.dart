import 'package:flutter/material.dart';

class FullScreenDialog{
  static FullScreenDialog? _instance;

  // 私有的命名函数，声明后，用户无法通过Singleton()创建一个新的对象
  FullScreenDialog._internal();

  static FullScreenDialog getInstance() {
    if (_instance == null) {
      _instance = FullScreenDialog._internal();
    }
    return _instance!;
  }

  void showDialog(BuildContext context,Widget child){
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (ctx,anm1,anm2){
          return child;
        }
    )
    );
  }
}