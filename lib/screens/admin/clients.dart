import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';

class Clients extends StatefulWidget {
  const Clients({super.key});

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  bool _loading = false;
  List<Map<String, dynamic>> _allPackages = [
    {
      "name": "Alice Smith",
      "email": "alice@example.com",
      "phone": "0712345678"
    },
    {"name": "Bob Johnson", "email": "bob@example.com", "phone": "0798765432"},
    {
      "name": "Emily Brown",
      "email": "emily@example.com",
      "phone": "0723456789"
    },
    {
      "name": "David Wilson",
      "email": "david@example.com",
      "phone": "0754321098"
    },
    {
      "name": "Sarah Davis",
      "email": "sarah@example.com",
      "phone": "0732109876"
    },
    {
      "name": "Michael Clark",
      "email": "michael@example.com",
      "phone": "0787654321"
    },
    {
      "name": "Olivia Turner",
      "email": "olivia@example.com",
      "phone": "0765432109"
    },
    {
      "name": "William Harris",
      "email": "william@example.com",
      "phone": "0743210987"
    },
    {
      "name": "Sophia White",
      "email": "sophia@example.com",
      "phone": "0776543210"
    },
    {"name": "James Lee", "email": "james@example.com", "phone": "0709876543"}
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
                              title: Text(
                                _allPackages[index]['name'].toString(),
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
                                        _allPackages[index]["email"].toString(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Telephoni: '),
                                      Text(_allPackages[index]['phone']
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
