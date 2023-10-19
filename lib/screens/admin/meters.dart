import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';

class Meters extends StatefulWidget {
  const Meters({super.key});

  @override
  State<Meters> createState() => _MetersState();
}

class _MetersState extends State<Meters> {
  bool _loading = false;
  List<Map<String, dynamic>> _allPackages = [
    {"meter_id": "10293", "client": "Alice Smith", "address": "Nairobi, Kenya"},
    {
      "meter_id": "56789",
      "client": "Bob Johnson",
      "address": "Kampala, Uganda"
    },
    {"meter_id": "98765", "client": "Emily Brown", "address": "Lusaka, Zambia"},
    {"meter_id": "12345", "client": "David Wilson", "address": "Accra, Ghana"},
    {"meter_id": "54321", "client": "Sarah Davis", "address": "Dakar, Senegal"},
    {
      "meter_id": "87654",
      "client": "Michael Clark",
      "address": "Addis Ababa, Ethiopia"
    },
    {
      "meter_id": "34567",
      "client": "Olivia Turner",
      "address": "Lagos, Nigeria"
    },
    {
      "meter_id": "45678",
      "client": "William Harris",
      "address": "Cairo, Egypt"
    },
    {
      "meter_id": "23456",
      "client": "Sophia White",
      "address": "Casablanca, Morocco"
    },
    {"meter_id": "78901", "client": "James Lee", "address": "Tunis, Tunisia"}
  ];
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
                      itemCount: _allPackages.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_allPackages[index]["id"]),
                        elevation: 0,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Column(
                          children: [
                            ListTile(
                              title: Row(
                                children: [
                                  Text(
                                    "ID: ",
                                    textAlign: TextAlign.justify,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    _allPackages[index]['meter_id'].toString(),
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
                                        _allPackages[index]["client"]
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Aho abarizwa: '),
                                      Text(_allPackages[index]['address']
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
