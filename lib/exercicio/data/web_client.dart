import 'package:exercicio_8/exercicio/data/interceptors/interceptor_app.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/http.dart';

const String baseUrl = 'https://jsonplaceholder.typicode.com';

const headerAPI = <String, String>{
  'Content-type': 'application/json',
};

final http.Client client = InterceptedClient.build(
    interceptors: [], requestTimeout: const Duration(seconds: 5));

//AppInterceptor()