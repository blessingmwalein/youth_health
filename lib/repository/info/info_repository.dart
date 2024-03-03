import 'dart:convert';

import 'package:youthhealth/models/info_model.dart';
import 'package:youthhealth/models/topic_model.dart';
import 'package:youthhealth/repository/info/info_provider.dart';
import 'package:youthhealth/repository/topic/topic_provider.dart';

class InfoRepository {
  final InfoProvider infoProvider;

  InfoRepository({required this.infoProvider});

  Future getInfos() async {
    var response = await infoProvider.getInfos();
    print('response $response');
    return InfoResponseModel.fromJson(jsonDecode(response));
  }
}
