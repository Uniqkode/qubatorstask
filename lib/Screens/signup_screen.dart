import 'package:flutter/material.dart';
import 'package:qubatorstask/Screens/home_screen.dart';
import 'package:qubatorstask/widgets/auth_widgets.dart';

import 'login_screen.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isTrue = true;
  bool isTruth = true;
  bool isProcessing = false;
  late String password;
  late String cpassword;
  late String email;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void signup() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      null;
      //  _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blueGrey.shade100,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: MediaQuery.of(context).size.height * .70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white54,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Sign up',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.indigo,
                          fontWeight: FontWeight.w600,
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 50, 10, 10),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white10,
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              email = (value);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your email';
                              } else if (value.isValidEmail() == false) {
                                return 'invalid email';
                              } else if (value.isValidEmail() == true) {
                                return null;
                              } else {
                                return null;
                              }
                            },
                            decoration: textFormDecor.copyWith(
                                hintText: ' example@email.com',
                                labelText: 'Email',
                                prefixIcon: const Icon(
                                  Icons.alternate_email,
                                  color: Colors.black26,
                                )),
                            obscureText: false,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white10,
                        ),
                        child: TextFormField(
                            onChanged: (value) {
                              password = (value);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter password';
                              } else {
                                return null;
                              }
                            },
                            obscureText: isTruth,
                            style: const TextStyle(
                              color: Colors.black26,
                            ),
                            decoration: textFormDecor.copyWith(
                              hintText: ' Enter password',
                              labelText: 'Password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black26,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isTruth = !isTruth;
                                    });
                                  },
                                  icon: isTruth
                                      ? const Icon(
                                          Icons.visibility,
                                          color: Colors.black26,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: Colors.black26,
                                        )),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white10,
                        ),
                        child: TextFormField(
                            onChanged: (value) {
                              cpassword = (value);
                            },
                            validator: (value) {
                              if (value!.isEmpty || value != password) {
                                return 'password does not match';
                              }
                              return null;
                            },
                            obscureText: isTrue,
                            style: const TextStyle(
                              color: Colors.black26,
                            ),
                            decoration: textFormDecor.copyWith(
                              hintText: 'Enter password',
                              labelText: 'Confirm Password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black26,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isTrue = !isTrue;
                                    });
                                  },
                                  icon: isTrue
                                      ? const Icon(
                                          Icons.visibility,
                                          color: Colors.black26,
                                        )
                                      : const Icon(
                                          Icons.visibility_off,
                                          color: Colors.black26,
                                        )),
                            )),
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      padding: const EdgeInsets.only(bottom: 4),
                      width: MediaQuery.of(context).size.width * .4,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.indigo.shade300),
                      child: MaterialButton(
                        onPressed: () {
                          isProcessing = true;

                          setState(() {
                            isProcessing = true;
                          });
                          signup();
                          isProcessing = false;
                        },
                        child: isProcessing == true
                            ? const Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.black26),
                                ),
                              )
                            : const Text(
                                'Sign up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'already have an account ?',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signin()));
                            },
                            child: const Text(
                              'sign in',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.indigo),
                            ))
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
