
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

String BASE_URL = "https://quizapi.io/api/v1/";

Future<Response> apiCall(String endPoint,
    {HttpMethod method = HttpMethod.GET, Map? request}) async {
  print('Request: $request');

  Response apiResponse;
  Uri url = getBaseUrl(endPoint);
  var headers = addHeaderTokens();
  if (method == HttpMethod.GET) {
    apiResponse = await get(url, headers: headers);
  } else {
    apiResponse = await post(url, body: jsonEncode(request), headers: headers);
  }
  print('Response ($method): ${apiResponse.statusCode} ${apiResponse.body}');
  return apiResponse;
}

Map<String, String> addHeaderTokens() {
  Map<String, String> header = {
    HttpHeaders.cacheControlHeader: 'no-cache',
    HttpHeaders.acceptHeader: 'application/json; charset=utf-8',
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    'Access-Control-Allow-Headers': '*',
    'Access-Control-Allow-Origin': '*',
  };
  return header;
}

Uri getBaseUrl(String endPoint) {
  Uri url = Uri.parse(endPoint);
  if (!endPoint.startsWith('http')) url = Uri.parse('$BASE_URL$endPoint');
  return url;
}

Future handleResponse(Response response) async {
  return jsonDecode(response.body);
}

enum HttpMethod { GET, POST, DELETE, PUT }
