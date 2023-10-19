import 'package:flutter/material.dart';
import 'package:water_billing/constants.dart';
import 'package:water_billing/models/api_response.dart';
import 'package:water_billing/screens/auth/login.dart';
import 'package:water_billing/services/user.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _loading = false;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void registerUser() async {
    ApiResponse response =
        await register(name.text, email.text, password.text, phone.text);
    if (response.error == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kwiyandikisha byagenze neza'),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${response.error}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 160,
                  ),
                  Text(
                    "Iyandikishe",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
              Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: name,
                        validator: (val) =>
                            val!.isEmpty ? 'Amazina arakenewe' : null,
                        decoration: const InputDecoration(
                          hintText: 'Injiza amazina',
                          labelText: 'Amazina',
                        ),
                      ),
                      TextFormField(
                        validator: (val) {
                          RegExp regex = RegExp(r'\w+@\w+\.\w+');
                          if (val!.isEmpty) {
                            return 'Imeili irakenewe';
                          } else if (!regex.hasMatch(val)) {
                            return 'INjiza imeili ibaho';
                          } else {
                            return null;
                          }
                        },
                        controller: email,
                        decoration: const InputDecoration(
                          hintText: 'Injiza Imaili',
                          labelText: 'Imeili',
                        ),
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Telefoni irakenewe';
                          } else {
                            return null;
                          }
                        },
                        controller: phone,
                        decoration: const InputDecoration(
                          hintText: 'Injiza Telefoni',
                          labelText: 'Telefoni',
                        ),
                      ),
                      TextFormField(
                        controller: password,
                        obscureText: true,
                        validator: (val) =>
                            val!.isEmpty ? 'IJambobanga rirakenewe' : null,
                        decoration: const InputDecoration(
                          hintText: 'Injiza ijambobanga',
                          labelText: 'Ijambobanga',
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Ugomba kwemeza ijambobanga';
                          } else if (val != password.text) {
                            return 'Amajambobanga ntahura';
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: 'Injiza ijambobanga',
                          labelText: 'Emeza ijambobanga',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            registerUser();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => primaryColor,
                          ),
                          padding: MaterialStateProperty.resolveWith(
                            (states) =>
                                const EdgeInsets.symmetric(vertical: 20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: (_loading)
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Iyandikishe',
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Usanzwe wanditse? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: Text(
                      " Kwinjira",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: primaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ],
      ),
    );
  }
}
