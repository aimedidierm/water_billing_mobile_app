import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';
import 'package:water_billing/services/user.dart';
import 'package:http/http.dart' as http;

class Clients extends StatefulWidget {
  const Clients({super.key});

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  bool _loading = true;
  List<Map<String, dynamic>> _allClients = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String token = await getToken();
    final response = await http.get(Uri.parse(usersURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      final List<Map<String, dynamic>> allClients =
          List<Map<String, dynamic>>.from(decodedResponse['users']);

      setState(() {
        _allClients = allClients;
        _loading = false;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: _loading
            ? Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _allClients.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_allClients[index]["id"]),
                        elevation: 0,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                _allClients[index]['name'].toString(),
                                textAlign: TextAlign.justify,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              contentPadding: const EdgeInsets.all(16),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text('Imeyeli: '),
                                      Text(
                                        _allClients[index]["email"].toString(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Telephoni: '),
                                      Text(_allClients[index]['phone']
                                          .toString()),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
