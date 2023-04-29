import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qubatorstask/Screens/signup_screen.dart';
import 'package:qubatorstask/widgets/AppLargeText.dart';
import 'package:qubatorstask/widgets/AppText.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.zero,
          child: AppBar(
              elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.dark),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const AppLargeText(
                      size: 30, text: 'KOYA.', color: Colors.black),
                  const SizedBox(height: 50),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const AppLargeText(
                          size: 40,
                          text: 'Choose Your Future Career',
                          color: Colors.black)),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/img3.png',
                          fit: BoxFit.fill,
                          height: 55,
                          width: 55,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .6,
                          child: const AppText(
                              size: 16,
                              text:
                                  'Big data helps earn degree faster and smoother',
                              color: Colors.black26),
                        )
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/Img1.svg",
                    fit: BoxFit.cover,
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 60.0,
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: MaterialButton(
                          onPressed: () {
                            var route = MaterialPageRoute(
                                builder: (context) => const Signup());
                            Navigator.pushReplacement(context, route);
                          },
                          // color: Colors.red,
                          child: Container(
                              alignment: Alignment.center,
                              child: const AppText(
                                  size: 15,
                                  text: 'Get started',
                                  color: Colors.white))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
