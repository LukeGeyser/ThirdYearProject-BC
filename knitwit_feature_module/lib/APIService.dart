import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:knitwit_feature_module/PatternsModel.dart';

class APIService {
  Future<dynamic> searchProject(String searchQuery) async {
    var bytes = utf8.encode(
        "read-92f68094886a814f12978f1547026470:SbnQIzMLAPWrUemqJIP2o22Xs+QFAtuUnUFBbLSK");
    var base64Str = base64.encode(bytes);
    final response = await http.get(
      'https://api.ravelry.com/patterns/search.json?query=' +
          searchQuery +
          ";page_size=20",
      headers: {HttpHeaders.authorizationHeader: "Basic " + base64Str},
    );
    final responseJson = jsonDecode(response.body);
    return responseJson;
  }
}
