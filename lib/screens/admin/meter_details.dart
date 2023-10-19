import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';

class MeterDetails extends StatefulWidget {
  final String meterId,
      client,
      country,
      province,
      district,
      sector,
      cell,
      village;
  const MeterDetails({
    Key? key,
    required this.client,
    required this.meterId,
    required this.country,
    required this.province,
    required this.district,
    required this.sector,
    required this.cell,
    required this.village,
  }) : super(key: key);

  @override
  State<MeterDetails> createState() => _MeterDetailsState();
}

class _MeterDetailsState extends State<MeterDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const Text(
                      "Imyirondoro ya konteri",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Row(
              children: [
                const Text(
                  'Konteri: ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.meterId,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Nyirayo: ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.client,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Igihugu: ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.country,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Intara: ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.province,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Akarere: ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.district,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Umurenge: ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.sector,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Akagari: ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.cell,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Umudugudu: ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.village,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
