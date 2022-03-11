import 'dart:convert';

import 'package:http/http.dart' as http;

class Session {
  Map<String, String> headers = {'content-type': 'application/json'};

  // make singleton
  static final Session _shared = Session._sharedInstance();
  Session._sharedInstance();
  factory Session() => _shared;

  Future<Map> get(String url) async {
    http.Response response = await http.get(
        Uri.parse(
          url,
        ),
        headers: headers);
    _updateCookie(response);
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> post({
    required String url,
    dynamic data,
  }) async {
    http.Response response = await http.post(
      Uri.parse(
        url,
      ),
      body: json.encode(data),
      headers: headers,
    );
    _updateCookie(response);
    if (response.statusCode < 200 || response.statusCode >= 400) {
      return json.decode(response.body);
    }
    return json.decode(response.body);
  }

  Future<Map> put(String url, dynamic data) async {
    http.Response response = await http.put(
      Uri.parse(
        url,
      ),
      body: json.encode(data),
      headers: headers,
    );
    _updateCookie(response);
    return json.decode(response.body);
  }

  void _updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}
