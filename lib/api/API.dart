import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://run.mocky.io/v3/e87e5228-618a-4fc1-a2fd-57e7e4e0d7f4";

class API {
  static Future getProducts() {
    var url = baseUrl;
    return http.get(url);
  }
}
