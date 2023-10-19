import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  bool _loading = false;
  List<Map<String, dynamic>> _allPackages = [
    {
      "amount": 2000,
      "meter_id": "1234",
      "status": "pending",
      "time": "2023-10-10"
    },
    {
      "amount": 1500,
      "meter_id": "5678",
      "status": "completed",
      "time": "2023-10-12"
    },
    {
      "amount": 1800,
      "meter_id": "3456",
      "status": "cancelled",
      "time": "2023-10-14"
    },
    {
      "amount": 2100,
      "meter_id": "2345",
      "status": "completed",
      "time": "2023-10-13"
    },
    {
      "amount": 2500,
      "meter_id": "7890",
      "status": "pending",
      "time": "2023-10-11"
    },
    {
      "amount": 1700,
      "meter_id": "4567",
      "status": "completed",
      "time": "2023-10-17"
    },
    {
      "amount": 1900,
      "meter_id": "6543",
      "status": "pending",
      "time": "2023-10-19"
    },
    {
      "amount": 2300,
      "meter_id": "5432",
      "status": "cancelled",
      "time": "2023-10-20"
    },
    {
      "amount": 1600,
      "meter_id": "8765",
      "status": "completed",
      "time": "2023-10-16"
    },
    {
      "amount": 2000,
      "meter_id": "4321",
      "status": "pending",
      "time": "2023-10-18"
    }
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
                                    _allPackages[index]['amount'].toString(),
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
                                        _allPackages[index]["meter_id"]
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text('Tariki: '),
                                      Text(_allPackages[index]['time']
                                          .toString()),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // approveTool(
                                      //     _allPackages[index]['id'].toString());
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: const Text(
                                          'Pending',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
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
