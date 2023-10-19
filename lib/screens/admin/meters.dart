import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';
import 'package:http/http.dart' as http;
import 'package:water_billing/constants.dart';
import 'package:water_billing/screens/admin/meter_details.dart';
import 'package:water_billing/services/user.dart';

class Meters extends StatefulWidget {
  const Meters({super.key});

  @override
  State<Meters> createState() => _MetersState();
}

class _MetersState extends State<Meters> {
  bool _loading = true;
  List<Map<String, dynamic>> _allMeters = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String token = await getToken();
    final response = await http.get(Uri.parse(metersURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      final List<Map<String, dynamic>> allMeters =
          List<Map<String, dynamic>>.from(decodedResponse);

      setState(() {
        _allMeters = allMeters;
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
                      itemCount: _allMeters.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_allMeters[index]["id"]),
                        elevation: 0,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Column(
                          children: [
                            ListTile(
                              title: Row(
                                children: [
                                  const Text(
                                    "ID: ",
                                    textAlign: TextAlign.justify,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    _allMeters[index]['meterId'].toString(),
                                    textAlign: TextAlign.justify,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              contentPadding: const EdgeInsets.all(16),
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return MeterDetails(
                                      meterId: _allMeters[index]["meterId"],
                                      client: _allMeters[index]["client"],
                                      country: _allMeters[index]["country"],
                                      province: _allMeters[index]["province"],
                                      district: _allMeters[index]["district"],
                                      sector: _allMeters[index]["sector"],
                                      cell: _allMeters[index]["cell"],
                                      village: _allMeters[index]["village"],
                                    );
                                  }),
                                );
                              },
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text('Umukiriya: '),
                                      Text(
                                        _allMeters[index]["client"].toString(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Aho abarizwa: '),
                                      Text(
                                        _allMeters[index]['province']
                                            .toString(),
                                      ),
                                      const Text(
                                        ',',
                                      ),
                                      Text(
                                        _allMeters[index]['country'].toString(),
                                      ),
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
