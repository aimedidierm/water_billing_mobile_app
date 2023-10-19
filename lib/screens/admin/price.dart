import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';

class Price extends StatefulWidget {
  const Price({super.key});

  @override
  State<Price> createState() => _PriceState();
}

class _PriceState extends State<Price> {
  bool _loading = false;
  List<Map<String, dynamic>> _allPackages = [
    {"price": 1500, "volume": "0-5"},
    {"price": 2200, "volume": "5-10"},
    {"price": 1800, "volume": "10-15"},
    {"price": 2100, "volume": "15-20"},
    {"price": 2500, "volume": ">20"},
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
                                      _allPackages[index]['price'].toString(),
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
                                        const Text('Amazi: '),
                                        Text(
                                          _allPackages[index]["volume"]
                                              .toString(),
                                        ),
                                        Text(
                                          ' m3',
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
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
