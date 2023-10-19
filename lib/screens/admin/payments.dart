import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';
import 'package:http/http.dart' as http;
import 'package:water_billing/services/user.dart';
import 'package:intl/intl.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  bool _loading = true;
  List<Map<String, dynamic>> _allPayments = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String token = await getToken();
    final response = await http.get(Uri.parse(adminPaymentsURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final decodedResponse = json.decode(response.body);
      final List<Map<String, dynamic>> allPayments =
          List<Map<String, dynamic>>.from(decodedResponse);

      setState(() {
        _allPayments = allPayments;
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
                      itemCount: _allPayments.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_allPayments[index]["id"]),
                        elevation: 0,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Column(
                          children: [
                            ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    _allPayments[index]['amount'].toString(),
                                    textAlign: TextAlign.justify,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const Text(' Rwf')
                                ],
                              ),
                              contentPadding: const EdgeInsets.all(16),
                              subtitle: Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text('Konteri: '),
                                      Text(
                                        _allPayments[index]["meter"]["meterId"]
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
                                          DateTime.parse(_allPayments[index]
                                              ['created_at'] as String),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 20,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      color: (_allPayments[index]['status'] ==
                                              'pending')
                                          ? Colors.red
                                          : Colors.green,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _allPayments[index]['status'],
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
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
