import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class IHttpClient {
  final String baseUrl;

  IHttpClient(this.baseUrl);

  Future<http.Response?> get(
    String method, {
    required Map<String, String>? headerParam,
    Map<String, dynamic> bodyParam = const {},
    String? baseUrl,
  }) async {
    final uri = Uri.https(baseUrl ?? this.baseUrl, method, bodyParam);
    final response = await http.get(uri, headers: headerParam);
    return response;
  }

  Future<http.Response?> post(
    String method, {
    required Map<String, dynamic> bodyParam,
    required Map<String, String>? headerParam,
    String? baseUrl,
  }) async {
    final encodedBody = json.encode(bodyParam);
    final uri = Uri.https(baseUrl ?? this.baseUrl, method);
    final response = await http.post(
      uri,
      headers: headerParam,
      body: encodedBody,
      encoding: Encoding.getByName("application/json"),
    );
    return response;
  }

  Future<http.Response?> delete(
    String method, {
    required Map<String, String>? headerParam,
    Map<String, dynamic> bodyParam = const {},
    String? baseUrl,
  }) async {
    final encodedBody = json.encode(bodyParam);
    final uri = Uri.https(baseUrl ?? this.baseUrl, method);
    final response = await http.delete(
      uri,
      headers: headerParam,
      body: encodedBody,
      encoding: Encoding.getByName("application/json"),
    );
    return response;
  }

  Future<http.Response?> put(
    String method, {
    required Map<String, String>? headerParam,
    Map<String, dynamic> bodyParam = const {},
    String? baseUrl,
  }) async {
    final encodedBody = json.encode(bodyParam);
    final uri = Uri.https(baseUrl ?? this.baseUrl, method);
    final response = await http.put(
      uri,
      headers: headerParam,
      body: encodedBody,
      encoding: Encoding.getByName("application/json"),
    );
    return response;
  }

  Future<http.Response?> update(
    String method, {
    required Map<String, dynamic> bodyParam,
    required Map<String, String>? headerParam,
    String? baseUrl,
  }) async {
    final encodedBody = json.encode(bodyParam);
    final uri = Uri.https(baseUrl ?? this.baseUrl, method);
    final response = await http.post(
      uri,
      headers: headerParam,
      body: encodedBody,
      encoding: Encoding.getByName("application/json"),
    );
    return response;
  }
}
