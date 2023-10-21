import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';
import 'package:water_billing/models/api_response.dart';
import 'package:water_billing/services/user.dart';
import 'package:http/http.dart' as http;

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<Map<String, dynamic>> _userDetails = [];
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  Future<void> fetchData() async {
    String token = await getToken();
    final response = await http.get(Uri.parse(profileURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      final List<Map<String, dynamic>> userDetails = [decodedResponse['user']];

      setState(() {
        _userDetails = userDetails;
      });

      if (_userDetails.isNotEmpty) {
        name.text = _userDetails[0]['name'];
        email.text = _userDetails[0]['email'];
        phone.text = _userDetails[0]['phone'];
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  void updateUser() async {
    ApiResponse response = await updateDetails(
      name.text,
      email.text,
      phone.text,
      password.text,
    );
    if (response.error == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Imyirondoro yavuguruwe!'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.error}'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Text(
                        "Vugurura imyirondoro",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                  Form(
                    key: formkey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: name,
                            validator: (val) =>
                                val!.isEmpty ? 'Amazina arakenewe' : null,
                            decoration: InputDecoration(
                              labelText: 'Injiza amazina',
                              contentPadding: const EdgeInsets.all(8.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: email,
                            validator: (val) {
                              RegExp regex = RegExp(r'\w+@\w+\.\w+');
                              if (val!.isEmpty) {
                                return 'Imeili irakenewe';
                              } else if (!regex.hasMatch(val)) {
                                return 'Imeili igomba kugira @';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Shyiramo Imeili',
                              contentPadding: const EdgeInsets.all(8.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: phone,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Telephone irakenewe';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Shyiramo Telephone',
                              contentPadding: const EdgeInsets.all(8.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: password,
                            obscureText: true,
                            validator: (val) =>
                                val!.isEmpty ? 'Ijambobanga rirakenewe' : null,
                            decoration: InputDecoration(
                              labelText: 'Shyiramo ijambobanga',
                              contentPadding: const EdgeInsets.all(8.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            obscureText: true,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Ugomba kwemeza ijambobanga';
                              } else if (val != password.text) {
                                return 'Amajambobanga ntahura';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Emeza ijambobanga',
                              contentPadding: const EdgeInsets.all(8.0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                updateUser();
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                (states) => primaryColor,
                              ),
                              padding: MaterialStateProperty.resolveWith(
                                (states) =>
                                    const EdgeInsets.symmetric(vertical: 10),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                'Vugurura',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
