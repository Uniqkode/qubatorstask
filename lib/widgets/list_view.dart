import 'package:flutter/material.dart';

class ListViews extends StatefulWidget {
  const ListViews({Key? key}) : super(key: key);

  @override
  State<ListViews> createState() => _ListViewsState();
}

class _ListViewsState extends State<ListViews> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: TabBar(
        overlayColor:
            MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.transparent;
          }

          return Colors.transparent;
        }),
        unselectedLabelColor: const Color.fromARGB(255, 26, 5, 99),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(78, 53, 95, 211),
              Color.fromARGB(255, 12, 36, 143)
            ]),
            borderRadius: BorderRadius.circular(50),
            color: const Color.fromARGB(255, 26, 5, 99)),
        padding: const EdgeInsets.all(10),
        isScrollable: true,
        tabs: const [
          Tab(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "All topics",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Tab(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Designs",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Tab(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Typography",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Tab(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Marketing",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          Tab(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Cyber security",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
