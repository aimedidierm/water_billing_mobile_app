import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';

class AddMeter extends StatefulWidget {
  const AddMeter({super.key});

  @override
  State<AddMeter> createState() => _AddMeterState();
}

class _AddMeterState extends State<AddMeter> {
  bool _loading = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController client = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController sector = TextEditingController();
  TextEditingController cell = TextEditingController();
  TextEditingController village = TextEditingController();
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
                      "Kwandika konteri",
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
        children: [
          const SizedBox(
            height: 40,
          ),
          Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  TextFormField(
                    controller: client,
                    validator: (val) => val!.isEmpty ? 'Umukiriya' : null,
                    decoration: const InputDecoration(
                      hintText: 'Injiza amazina yumukiriya',
                      labelText: 'Umukiriya',
                    ),
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Igihugu Kirakenewe';
                      } else {
                        return null;
                      }
                    },
                    controller: country,
                    decoration: const InputDecoration(
                      hintText: 'Injiza Igihugu',
                      labelText: 'Igihugu',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Igihugu Kirakenewe';
                      } else {
                        return null;
                      }
                    },
                    controller: province,
                    decoration: const InputDecoration(
                      hintText: 'Injiza Intara',
                      labelText: 'Intara',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Intara Irakenewe';
                      } else {
                        return null;
                      }
                    },
                    controller: district,
                    decoration: const InputDecoration(
                      hintText: 'Injiza Akarere',
                      labelText: 'Akarere',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Akarere Karakenewe';
                      } else {
                        return null;
                      }
                    },
                    controller: sector,
                    decoration: const InputDecoration(
                      hintText: 'Injiza Umurenge',
                      labelText: 'Umurenge',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Umurenge Urakenewe';
                      } else {
                        return null;
                      }
                    },
                    controller: cell,
                    decoration: const InputDecoration(
                      hintText: 'Injiza Akagari',
                      labelText: 'Akagari',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Akagari Karakenewe';
                      } else {
                        return null;
                      }
                    },
                    controller: village,
                    decoration: const InputDecoration(
                      hintText: 'Injiza Umudugudu',
                      labelText: 'Umudugudu',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        // registerMeter();
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
                              'Yemeze',
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
}
