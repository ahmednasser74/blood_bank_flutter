import 'package:http/http.dart' as http;
import 'dart:convert';

class DropDownData {
  List bloodTypeList = List();
  List cityList = List();
  List regionList = List();

  String bloodTypeUrl = 'http://ipda3-tech.com/blood-bank/api/v1/blood-types';
  String cityUrl = 'http://ipda3-tech.com/blood-bank/api/v1/governorates';
  String regionUrl =
      'http://ipda3-tech.com/blood-bank/api/v1/cities?governorate';

  Future<String> bloodTypeData() async {
    http.Response response = await http.get(bloodTypeUrl);
    var responseBody = jsonDecode(response.body);
    bloodTypeList = responseBody['data'];
  }

  Future<String> cityData() async {
    http.Response response = await http.get(cityUrl);
    var responseBody = jsonDecode(response.body);
    cityList = responseBody['data'];
  }

  Future<String> regionData() async {
    http.Response response = await http.get(regionUrl);
    var responseBody = jsonDecode(response.body);
    regionList = responseBody['data'];
  }
}
