import 'package:flutter/material.dart';

//Endpoints
const baseURL = 'https://waterbilling.itaratec.com/api';
// const baseURL = 'http://192.168.43.83:8000/api';
const loginURL = '$baseURL/login';
const registerURL = '$baseURL/register';
const profileURL = '$baseURL/profile';
const adminPaymentsURL = '$baseURL/admin/billing';
const clientPaymentsURL = '$baseURL/client/billing';
const usersURL = '$baseURL/admin/users';
const metersURL = '$baseURL/admin/meters';
const readingsURL = '$baseURL/client/readings';

// Application colors

//Errors
const serverError = 'Hari ikibazo muri sisiteme';
const unauthorized = 'Ntago ubyemerewe';
const somethingWentWrong = 'Hari ibidakunze';

Color primaryColor = const Color(0xFF012267);
MaterialColor themColor = const MaterialColor(0xFF1C658C, {
  50: Color(0xFFE6F1F8),
  100: Color(0xFFB3D9EE),
  200: Color(0xFF80C1E4),
  300: Color(0xFF4DAADB),
  400: Color(0xFF2692D1),
  500: Color(0xFF1C658C),
  600: Color(0xFF1E5582),
  700: Color(0xFF204676),
  800: Color(0xFF223C6B),
  900: Color(0xFF243261),
});
