import 'package:flutter/material.dart';
import 'package:qubatorstask/Screens/home_screen.dart';
import 'package:qubatorstask/Screens/signup_screen.dart';
import 'package:qubatorstask/widgets/auth_widgets.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String password;
  late String email;
  bool isTrue = true;
  bool isProcessing = false;

  void login() {
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
                    const Text('Sign in',
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
                          keyboardType: TextInputType.emailAddress,
                          decoration: textFormDecor.copyWith(
                            labelText: 'Email',
                            hintText: 'name@email.com',
                          ),
                        ),
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
                            password = (value);
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter Password';
                            } else {
                              return null;
                            }
                          },
                          obscureText: isTrue,
                          decoration: textFormDecor.copyWith(
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
                                    ),
                            ),
                            labelText: 'Password',
                            hintText: 'enter password',
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'forgot password ?',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.indigo),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
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
                          login();
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
                                'Sign in',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account ?',
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signup()));
                            },
                            child: const Text(
                              'sign up',
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
