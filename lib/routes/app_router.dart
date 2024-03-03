import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:youthhealth/models/service_model.dart';
import 'package:youthhealth/models/tollfree_model.dart';
import 'package:youthhealth/models/topic_model.dart';
import 'package:youthhealth/models/user_group_chat_model.dart';
import 'package:youthhealth/ui/group_chats.dart';
import 'package:youthhealth/ui/home_page.dart';
import 'package:youthhealth/ui/infor_page.dart';
import 'package:youthhealth/ui/not_group_page.dart';
import 'package:youthhealth/ui/profile_page.dart';
import 'package:youthhealth/ui/service_single_page.dart';
import 'package:youthhealth/ui/services_page.dart';
import 'package:youthhealth/ui/signin_page.dart';
import 'package:youthhealth/ui/signup_page.dart';
import 'package:youthhealth/ui/single_group_chat.dart';
import 'package:youthhealth/ui/sti_single_page.dart';
import 'package:youthhealth/ui/symptom_search.dart';
import 'package:youthhealth/ui/toll_free_page.dart';
import 'package:youthhealth/ui/toll_free_single.dart';
import 'package:youthhealth/ui/topic_single_page.dart';
import 'package:youthhealth/ui/topics_page.dart';
import 'package:youthhealth/ui/welcome_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: WelcomeRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ServiceRoute.page),
        AutoRoute(page: TollFreeRoute.page),
        AutoRoute(page: ServiceSingleRoute.page),
        AutoRoute(page: TollFreeSingleRoute.page),
        AutoRoute(page: SympTomSearchRoute.page),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: GroupChatRoute.page),
        AutoRoute(page: NotGroupRoute.page),
        AutoRoute(page: SingleChatRoute.page),
        AutoRoute(page: TopicSingleRoute.page),
        AutoRoute(page: StiSingleRoute.page),
        AutoRoute(page: TopicsRoute.page),
        AutoRoute(page: InforRoute.page),
      ];
}
