import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';
import 'package:http/http.dart' as http;
import 'package:water_billing/services/user.dart';
import 'package:intl/intl.dart';

class Measurements extends StatefulWidget {
  const Measurements({super.key});

  @override
  State<Measurements> createState() => _MeasurementsState();
}

class _MeasurementsState extends State<Measurements> {
  bool _loading = true;
  List<Map<String, dynamic>> _allReadings = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String token = await getToken();
    final response = await http.get(Uri.parse(readingsURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      final List<Map<String, dynamic>> allReadings =
          List<Map<String, dynamic>>.from(decodedResponse['readings']);

      setState(() {
        _allReadings = allReadings;
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
                      itemCount: _allReadings.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_allReadings[index]["id"]),
                        elevation: 0,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Column(
                          children: [
                            ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    _allReadings[index]['meter']['meterId']
                                        .toString(),
                                    textAlign: TextAlign.justify,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              contentPadding: const EdgeInsets.all(16),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text('Umukiriya: '),
                                      Text(
                                        _allReadings[index]["meter"]["client"]
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Imibare: '),
                                      Text(
                                        _allReadings[index]["readings"]
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Tariki: '),
                                      Text(
                                        DateFormat('yyyy-MM-dd HH:mm:ss')
                                            .format(
                                          DateTime.parse(_allReadings[index]
                                              ['created_at'] as String),
                                        ),
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
