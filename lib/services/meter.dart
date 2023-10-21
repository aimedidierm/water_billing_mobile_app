import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:water_billing/constants.dart';
import 'package:water_billing/models/api_response.dart';
import 'package:water_billing/services/user.dart';

Future<ApiResponse> store(
  String client,
  String country,
  String province,
  String district,
  String sector,
  String cell,
  String village,
) async {
  String token = await getToken();
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(metersURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'client': client,
      'country': country,
      'province': province,
      'district': district,
      'sector': sector,
      'cell': cell,
      'village': village
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = 'Kuyandika byakunze';
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.element(0)][0];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        print(response.body);
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }

  return apiResponse;
}
