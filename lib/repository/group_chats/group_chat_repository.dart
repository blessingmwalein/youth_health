import 'dart:convert';
import 'dart:io';

import 'package:youthhealth/models/group_chat_message_model.dart';
import 'package:youthhealth/models/info_model.dart';
import 'package:youthhealth/models/topic_model.dart';
import 'package:youthhealth/models/user_group_chat_model.dart';
import 'package:youthhealth/repository/group_chats/group_chat_provider.dart';
import 'package:youthhealth/repository/info/info_provider.dart';
import 'package:youthhealth/repository/topic/topic_provider.dart';

class GroupChatRepository {
  final GroupChatProvider groupChatProvider;

  GroupChatRepository({required this.groupChatProvider});

  Future getUserGroupChats() async {
    var response = await groupChatProvider.getUserGroupChats();
    return UserGroupChatResponseModel.fromJson(jsonDecode(response));
  }

  Future getUserNotGroupChats() async {
    var response = await groupChatProvider.getUserNotGroupChats();
    return UserGroupChatResponseModel.fromJson(jsonDecode(response));
  }

  Future getGroupChatMessages(int groupChatId) async {
    var response = await groupChatProvider.getGroupChatMessages(groupChatId);
    return GroupChatMessageResponseModel.fromJson(jsonDecode(response));
  }

  Future sendGroupChatMessage({
    required String message,
    required int groupChatId,
    File? file,
  }) async {
    var response = await groupChatProvider.sendGroupChatMessage(
      message: message,
      groupChatId: groupChatId,
      file: file,
    );
    return SendGroupChatMessageResponseModel.fromJson(jsonDecode(response));
  }

  Future joinGroupChat(int groupChatId) async {
    var response = await groupChatProvider.joinGroup(groupChatId);
    return JoinGroupChatResponseModel.fromJson(jsonDecode(response));
  }
}
