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
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }

  return apiResponse;
}

Future<ApiResponse> sendingPayment(
  int billingId,
  String phone,
) async {
  String token = await getToken();
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(clientPaymentsURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'billing_id': billingId.toString(),
      'phone': phone,
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = 'Kuyandika byakunze';
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'][0];
        apiResponse.error = errors;
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
    print(e);
    apiResponse.error = serverError;
  }

  return apiResponse;
}

Future<ApiResponse> readingStore(
  int readings,
  String meterId,
) async {
  String token = await getToken();
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(readingsURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'readings': readings.toString(),
      'meter_id': meterId,
    });

    switch (response.statusCode) {
      case 200:
        apiResponse.data = 'Kohereza imibare byakunze';
        break;
      case 422:
        print(response.body);
        final errors = jsonDecode(response.body)['errors'][0];
        apiResponse.error = errors;
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['errors'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }

  return apiResponse;
}
