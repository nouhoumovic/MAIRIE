import 'package:bhs/models/responses/response_generic.dart';
import 'package:bhs/models/role_model.dart';

import 'package:bhs/providers/auth_providers.dart';
import 'package:bhs/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RoleApiProvider with ChangeNotifier {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  AuthProvider authProvider;
  void update(AuthProvider newauthProvider) async {
    authProvider = newauthProvider;
  }

  Future<ListRoles> getRoleData() async {
    ResponseGeneric response =
        await ApiService.getAction("role/list", authProvider.token);

    if (response != null) {
      return ListRoles.fromJson(response.data);
    } else {
      throw Exception('error status code');
    }
  }
}
