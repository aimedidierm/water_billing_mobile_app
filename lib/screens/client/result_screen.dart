import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';
import 'package:water_billing/models/api_response.dart';
import 'package:water_billing/screens/client/home.dart';
import 'package:water_billing/services/meter.dart';

class ResultScreen extends StatefulWidget {
  final int text;

  ResultScreen({super.key, required this.text});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _loading = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController meterId = TextEditingController();
  void sendReadings() async {
    ApiResponse response = await readingStore(widget.text, meterId.text);
    if (response.error == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kwishyura byasabwe'),
        ),
      );
      // Navigator.of(context).pushAndRemoveUntil(
      //   MaterialPageRoute(
      //     builder: (context) => const Home(),
      //   ),
      //   (route) => false,
      // );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.error}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                        "Emeza kwishyura",
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
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          children: [
            Row(
              children: [
                const Text(
                  'Imibare ya Konteri: ',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  widget.text.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
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
                      controller: meterId,
                      validator: (val) =>
                          val!.isEmpty ? 'Nimero ya konteri irakenewe' : null,
                      decoration: InputDecoration(
                        labelText: 'Injiza nimero ya konteri',
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
                          setState(() {
                            _loading = true;
                          });
                          sendReadings();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => primaryColor,
                        ),
                        padding: MaterialStateProperty.resolveWith(
                          (states) => const EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: (_loading)
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                'Emeza kwishyura',
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
          ],
        ),
      );
}
