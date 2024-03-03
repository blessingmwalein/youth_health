
import 'dart:convert';

import 'package:youthhealth/models/service_model.dart';
import 'package:youthhealth/repository/service/service_provider.dart';




class ServiceRepository {
  final ServiceProvider serviceProvider;

  ServiceRepository({required this.serviceProvider});

  Future getServices() async {
    var response =
        await serviceProvider.getServices();
    print('response $response');
    return ServiceResponseModel.fromJson(jsonDecode(response));
  }

 
}
