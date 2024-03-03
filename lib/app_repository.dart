import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:youthhealth/repository/auth/authentication_provider.dart';
import 'package:youthhealth/repository/auth/authentication_repository.dart';
import 'package:youthhealth/repository/group_chats/group_chat_provider.dart';
import 'package:youthhealth/repository/group_chats/group_chat_repository.dart';
import 'package:youthhealth/repository/health/health_repository.dart';
import 'package:youthhealth/repository/info/info_provider.dart';
import 'package:youthhealth/repository/info/info_repository.dart';
import 'package:youthhealth/repository/service/service_provider.dart';
import 'package:youthhealth/repository/service/service_repository.dart';
import 'package:youthhealth/repository/tollfree/tollfree_provider.dart';
import 'package:youthhealth/repository/tollfree/toolfree_repository.dart';
import 'package:youthhealth/repository/topic/topic_provider.dart';
import 'package:youthhealth/repository/topic/topic_repository.dart';

class AppRepositories extends StatelessWidget {
  final Widget appBlocs;
  final FlutterSecureStorage storage;

  const AppRepositories(
      {super.key, required this.appBlocs, required this.storage});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => HealthRepository(),
        ),
        RepositoryProvider(
          create: (context) => AuthenticationRepository(
              authenticationProvider: AuthenticationProvider(storage: storage)),
        ),
        RepositoryProvider(
          create: (context) =>
              TopicRepository(topicProvider: TopicProvider(storage: storage)),
        ),
        RepositoryProvider(
          create: (context) =>
              InfoRepository(infoProvider: InfoProvider(storage: storage)),
        ),
        RepositoryProvider(
          create: (context) => ServiceRepository(
              serviceProvider: ServiceProvider(storage: storage)),
        ),
        RepositoryProvider(
          create: (context) => TollFreeRepository(
              tollFreeProvider: TollFreeProvider(storage: storage)),
        ),
        RepositoryProvider(
          create: (context) => GroupChatRepository(
              groupChatProvider: GroupChatProvider(storage: storage)),
        ),
      ],
      child: appBlocs,
    );
  }
}
