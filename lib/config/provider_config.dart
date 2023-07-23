

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/json/task_bean.dart';
import 'package:todo_list/json/task_icon_bean.dart';
import 'package:todo_list/logic/reset_password_page_logic.dart';
import 'package:todo_list/model/all_model.dart';
import 'package:todo_list/pages/all_page.dart';

class ProviderConfig {
  static ProviderConfig? _singleton;

  // 私有的命名函数，声明后，用户无法通过Singleton()创建一个新的对象
  ProviderConfig._internal();

  static ProviderConfig getInstance() {
    if (_singleton == null) {
      _singleton = ProviderConfig._internal();
    }
    return _singleton!;

    // 上述判断空的在初始化的代码，可以简化成
    // return _instance ??= Singleton._internal();
  }


  ///全局provider
  ChangeNotifierProvider<GlobalModel> getGlobal(Widget child) {
    return ChangeNotifierProvider<GlobalModel>(
      create: (context) => GlobalModel( context: context,mainPageModel: MainPageModel(null,context: context)),
      child: child,
    );
  }

  ///主页provider
  ChangeNotifierProvider<MainPageModel> getMainPage() {
    return ChangeNotifierProvider<MainPageModel>(
      create: (context) => MainPageModel(null,context: context),
      child: MainPage(),
    );
  }

  ///任务详情页provider
  ChangeNotifierProvider<TaskDetailPageModel> getTaskDetailPage(
    int index,
    TaskBean taskBean, {
     DoneTaskPageModel? doneTaskPageModel,
     SearchPageModel? searchPageModel,
  }) {
    return ChangeNotifierProvider<TaskDetailPageModel>(
      create: (context) => TaskDetailPageModel(
        context: context,
        taskBean:taskBean,
        doneTaskPageModel: doneTaskPageModel,
        searchPageModel: searchPageModel,
        heroTag: index,
      ),
      child: TaskDetailPage(),
    );
  }

  ///任务编辑页provider
  ChangeNotifierProvider<EditTaskPageModel> getEditTaskPage(
      TaskIconBean taskIcon,
      {TaskDetailPageModel? taskDetailPageModel,
       TaskBean? taskBean}) {
    return ChangeNotifierProvider<EditTaskPageModel>(
      create: (context) => EditTaskPageModel(context: context),
      child: EditTaskPage(
        taskIcon,
        taskDetailPageModel: taskDetailPageModel,
      ),
    );
  }

  ///图标设置页provider
  ChangeNotifierProvider<IconSettingPageModel> getIconSettingPage() {
    return ChangeNotifierProvider<IconSettingPageModel>(
      create: (context) => IconSettingPageModel(context: context),
      child: IconSettingPage(),
    );
  }

  ///主题设置页provider
  ChangeNotifierProvider<ThemePageModel> getThemePage() {
    return ChangeNotifierProvider<ThemePageModel>(
      create: (context) => ThemePageModel(context: context),
      child: ThemePage(),
    );
  }

  ///头像裁剪页provider
  ChangeNotifierProvider<AvatarPageModel> getAvatarPage(
      {required MainPageModel mainPageModel}) {
    return ChangeNotifierProvider<AvatarPageModel>(
      create: (context) => AvatarPageModel(context: context),
      child: AvatarPage(
        null,
        mainPageModel: mainPageModel,
      ),
    );
  }

  ///完成列表页provider
  ChangeNotifierProvider<DoneTaskPageModel> getDoneTaskPage() {
    return ChangeNotifierProvider<DoneTaskPageModel>(
      create: (context) => DoneTaskPageModel(context: context),
      child: DoneTaskPage(),
    );
  }

  ///搜索任务页provider
  ChangeNotifierProvider<SearchPageModel> getSearchPage() {
    return ChangeNotifierProvider<SearchPageModel>(
      create: (context) => SearchPageModel(null,context: context),
      child: SearchPage(),
    );
  }

  ///意见反馈页provider
  ChangeNotifierProvider<FeedbackPageModel> getFeedbackPage(
      FeedbackWallPageModel feedbackWallPageModel) {
    return ChangeNotifierProvider<FeedbackPageModel>(
      create: (context) => FeedbackPageModel(context: context),
      child: FeedbackPage(feedbackWallPageModel),
    );
  }

  ///意见反馈墙页provider
  ChangeNotifierProvider<FeedbackWallPageModel> getFeedbackWallPage() {
    return ChangeNotifierProvider<FeedbackWallPageModel>(
      create: (context) => FeedbackWallPageModel(context: context),
      child: FeedbackWallPage(),
    );
  }

  ///登录页provider
  ChangeNotifierProvider<LoginPageModel> getLoginPage({bool isFirst = false}) {
    return ChangeNotifierProvider<LoginPageModel>(
      create: (context) => LoginPageModel(isFirst: isFirst, context: context),
      child: LoginPage(),
    );
  }

  ///注册页provider
  ChangeNotifierProvider<RegisterPageModel> getRegisterPage() {
    return ChangeNotifierProvider<RegisterPageModel>(
      create: (context) => RegisterPageModel(context: context),
      child: RegisterPage(),
    );
  }

  ///重设密码页provider,可以设重设密码，也可以设是记密码
  ChangeNotifierProvider<ResetPasswordPageModel> getResetPasswordPage(
      {bool isReset = true}) {
    return ChangeNotifierProvider<ResetPasswordPageModel>(
      create: (context) => ResetPasswordPageModel(context: context,isReset: isReset),
      child: ResetPasswordPage(),
    );
  }

  ///网络图片页provider，用于设置账号页面的背景，或者侧滑栏的头部,或者主页背景
  ChangeNotifierProvider<NetPicturesPageModel> getNetPicturesPage(
      {required String useType,
      required AccountPageModel accountPageModel,
      required TaskBean taskBean}) {
    return ChangeNotifierProvider<NetPicturesPageModel>(
      create: (context) => NetPicturesPageModel(
        context:context,
        useType: useType,
        accountPageModel: accountPageModel,
        taskBean: taskBean,
      ),
      child: NetPicturesPage(),
    );
  }

  ///账号页面的provider
  ChangeNotifierProvider<AccountPageModel> getAccountPage() {
    return ChangeNotifierProvider<AccountPageModel>(
      create: (context) => AccountPageModel(context: context, isExisting: false ),
      child: AccountPage(),
    );
  }
}
