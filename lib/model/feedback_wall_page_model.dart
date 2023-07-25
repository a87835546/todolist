import 'package:flutter/material.dart';
import 'package:todo_list/json/suggestion_bean.dart';
import 'package:todo_list/logic/all_logic.dart';
import 'package:dio/dio.dart';
import 'package:todo_list/widgets/loading_widget.dart';

import '../utils/shared_util.dart';

class FeedbackWallPageModel extends ChangeNotifier{

  FeedbackWallPageLogic? logic;
  BuildContext context;
  CancelToken cancelToken = CancelToken();


  List<SuggestionsListBean> suggestionList = [];
  LoadingFlag loadingFlag = LoadingFlag.loading;

  bool hasCache = false;

  FeedbackWallPageModel({this.logic,required this.context}){
    logic = FeedbackWallPageLogic(this);

  }

  void setContext(BuildContext context) async{
    final account = await SharedUtil.instance.getString(Keys.account);

    this.context = context;
        logic!.getCacheSuggestions();
        logic!.getSuggestions(account??"");
  }

  @override
  void dispose(){
    super.dispose();
    debugPrint("FeedbackWallPageModel销毁了");
  }

  void refresh(){
    notifyListeners();
  }
}