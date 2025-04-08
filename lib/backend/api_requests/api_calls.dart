import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchProfilesCall {
  static Future<ApiCallResponse> call({
    String? searchString = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Search Profiles',
      apiUrl:
          'https://pesdxqklxducunknyblf.supabase.co/rest/v1/profiles?or=(and(full_name.ilike.%${searchString}%,active.eq.true,status.eq.unemployed,role_id.eq.2))',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBlc2R4cWtseGR1Y3Vua255YmxmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM3OTk2MTksImV4cCI6MjA1OTM3NTYxOX0.LjGvUkzREkSwmfOp1wDUGU7yUmKy0h1BTjyRtSh-YfI',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InBlc2R4cWtseGR1Y3Vua255YmxmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDM3OTk2MTksImV4cCI6MjA1OTM3NTYxOX0.LjGvUkzREkSwmfOp1wDUGU7yUmKy0h1BTjyRtSh-YfI',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
