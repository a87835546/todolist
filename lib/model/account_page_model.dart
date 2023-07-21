import 'package:flutter/material.dart';
import 'package:todo_list/config/all_types.dart';
import 'package:todo_list/logic/all_logic.dart';

class AccountPageModel extends ChangeNotifier {
  AccountPageLogic logic;
  BuildContext context;

  String? avatarUrl;
  String? userName;
  String? emailAccount;
  String? backgroundType = AccountBGType.defaultType;
  String? backgroundUrl;

  bool isExisting = false;

  AccountPageModel(this.logic,this.context,this.avatarUrl,this.userName,this.emailAccount,this.backgroundType,this.backgroundUrl,this.isExisting) {
    logic = AccountPageLogic(this);
  }

  void setContext(BuildContext context) {
    if (this.context == null) {
      this.context = context;
      Future.wait([
        logic.getAvatarUrl(),
        logic.getUserName(),
        logic.getEmailAccount(),
        logic.getBackgroundType(),
        logic.getBackgroundUrl(),
      ]).then((v) {
        refresh();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("AccountPageModel销毁了");
  }

  void refresh() {
    notifyListeners();
  }
}
