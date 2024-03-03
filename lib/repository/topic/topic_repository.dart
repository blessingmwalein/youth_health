
import 'dart:convert';

import 'package:youthhealth/models/topic_model.dart';
import 'package:youthhealth/repository/topic/topic_provider.dart';


class TopicRepository {
  final TopicProvider topicProvider;

  TopicRepository({required this.topicProvider});

  Future getTopics() async {
    var response =
        await topicProvider.getTopics();
    print('response $response');
    return TopicResponseModel.fromJson(jsonDecode(response));
  }

 
}
