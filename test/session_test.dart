import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:vonop/core/init/network/network_manager.dart';
import 'package:vonop/models/session/session_credentials.dart';

void main() {
  test("test1", () async {
    const String endPoint = "/session/data/";
    final NetworkManager _networkManager = NetworkManager();

    SessionCredentials credentials = SessionCredentials(
      "public-ZjNzYwNThjZDc2ODM0M2EzYjMwMWZhNTVmYTg0Yjd",
      "session-1MmY5ZWU2NTNmODhiNjc4Y2RhMjU5ZWY0YWQzNzg",
    );

    final String path = endPoint + credentials.publicKey;
    final response = await _networkManager.coreDio.post(
      path,
      data: {
        'session': credentials.sessionKey,
        'register_form': "d92694c6-c399-4fd1-9f65-18f034045464",
      },
    );

    print(response.data);
  });
}
