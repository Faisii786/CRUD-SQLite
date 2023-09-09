// ignore: file_names
import 'package:database_app/screens/login.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //validation
  final _globalkey = GlobalKey<FormState>();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 853,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.amber,
            Colors.green,
          ]),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: SizedBox(
              width: 360,
              height: 650,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      "SIGNUP",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: _globalkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'First Name cannot be empty';
                                }
                                return null;
                              },
                              controller: _controller1,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.people),
                                  hintText: 'Enter First Name',
                                  labelText: 'First Name'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Last Name cannot be empty';
                                }
                                return null;
                              },
                              controller: _controller2,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.people),
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Last Name',
                                  labelText: 'Last Name'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Country cannot be empty';
                                }
                                return null;
                              },
                              controller: _controller3,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.location_city),
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Country',
                                  labelText: 'Country'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone number cannot be empty';
                                }
                                return null;
                              },
                              controller: _controller4,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.call),
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Number',
                                  labelText: 'Phone Number'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Username cannot be empty';
                                }
                                return null;
                              },
                              controller: _controller5,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.email),
                                  hintText: 'Enter Email',
                                  labelText: 'Email'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                return null;
                              },
                              controller: _controller6,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.password),
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Password',
                                  labelText: 'Password'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_globalkey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                  );
                                }
                              },
                              child: const Text("SIGN_UP",
                                  style: TextStyle(fontSize: 18))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
