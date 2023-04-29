import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qubatorstask/helpers/caroussel.dart';
import 'package:qubatorstask/widgets/AppLargeText.dart';
import 'package:qubatorstask/widgets/AppText.dart';
import 'package:qubatorstask/widgets/CircularAvaters.dart';
import 'package:qubatorstask/widgets/list_view.dart';
// import 'package:qubatorstask/widgets/listView.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<bool> showExitPopup() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title:
                const Text('Exit App', style: TextStyle(color: Colors.indigo)),
            content: const Text('Do you want to exit the App?',
                style: TextStyle(color: Colors.black)),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: ElevatedButton.styleFrom(primary: Colors.indigo),
                child: const Text('No', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: const Text('Yes', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ) ??
        false;
  }

  bool isToggled = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.zero,
          child: AppBar(
              elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.dark),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 15, right: 15, bottom: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://picsum.photos/250?image=9'),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                            Expanded(child: Container()),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isToggled = !isToggled;
                                });
                              },
                              child: isToggled
                                  ? const CircularAva(
                                      size: 22.0,
                                      color: Colors.blueAccent,
                                      icon: Icon(
                                        Icons.notifications_active_sharp,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    )
                                  : const CircularAva(
                                      size: 22.0,
                                      color: Colors.blueGrey,
                                      icon: Icon(
                                        Icons.notifications_active_sharp,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const AppText(
                            size: 12,
                            text: 'ACHIEVE MORE',
                            color: Colors.black26),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: const AppLargeText(
                              size: 25.0,
                              text: 'Creating student success with our tech',
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Carousel(),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: const CupertinoSearchTextField(
                              suffixIcon: Icon(Icons.search),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        const ListViews(),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const AppLargeText(
                                size: 20,
                                text: 'Our courses',
                                color: Colors.black),
                            Expanded(child: Container()),
                            const AppText(
                                size: 14, text: 'Show all', color: Colors.black)
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 6,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.amber.withOpacity(0.1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              padding: const EdgeInsets.all(12.0),
                              alignment: Alignment.topLeft,
                              height: 180,
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  CircularAva(
                                      size: 18,
                                      color: Colors.amber,
                                      icon: Icon(
                                        Icons.ads_click_outlined,
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  AppLargeText(
                                      size: 16,
                                      text: 'UX Research',
                                      color: Colors.black),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  AppText(
                                      size: 13,
                                      text: '● 15 Modules',
                                      color: Colors.black),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  AppText(
                                      size: 13,
                                      text: '● 12 Months',
                                      color: Colors.black)
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                                margin: const EdgeInsets.only(right: 6),
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent.withOpacity(0.1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10))),
                                padding: const EdgeInsets.all(12.0),
                                alignment: Alignment.topLeft,
                                height: 180,
                                width: 150,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      CircularAva(
                                          size: 18,
                                          color: Colors.blueAccent,
                                          icon: Icon(
                                            Icons.backpack,
                                            color: Colors.white,
                                          )),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      AppLargeText(
                                          size: 16,
                                          text: ' Motion',
                                          color: Colors.black),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      AppText(
                                          size: 13,
                                          text: '● 8 Modules',
                                          color: Colors.black),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      AppText(
                                          size: 13,
                                          text: '● 9 Months',
                                          color: Colors.black)
                                    ]))
                          ],
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Textfield extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? surfixIcon;
  final bool obscureText;

  const Textfield({
    required this.obscureText,
    required this.hintText,
    this.prefixIcon,
    this.surfixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(
        color: Colors.black26,
      ),
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            borderSide: BorderSide(color: Colors.black26)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: Colors.black26,
        ),
        suffixIcon: Icon(surfixIcon, color: Colors.black26),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
    );
  }
}
