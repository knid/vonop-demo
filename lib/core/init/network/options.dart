import 'package:dio/dio.dart';
import 'dart:io';

BaseOptions get baseNetworkManagerOptions => BaseOptions(
      baseUrl: 'http://192.168.1.100:9000',
      headers: {HttpHeaders.authorizationHeader: 'Token 245206fab7ba4ebf5d7c99d08bc417f7ac5635a2'},
    );
