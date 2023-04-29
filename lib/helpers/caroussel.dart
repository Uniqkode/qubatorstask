import 'package:flutter/material.dart';
import 'package:qubatorstask/widgets/AppText.dart';
import 'package:qubatorstask/widgets/CircularAvaters.dart';

import '../widgets/AppLargeText.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  PageController? _pageController;

  final List items = [
    Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircularAva(
              color: Colors.red,
              icon: Icon(
                Icons.message,
                size: 14,
                color: Colors.white,
              )),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppLargeText(
                size: 14,
                text: 'On-site and remote support',
                color: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.zero,
                  padding: const EdgeInsetsDirectional.all(0.0),
                  width: 234,
                  child: const AppText(
                      size: 14,
                      text:
                          'we provide on-boarding trainings to get you started and render continued support when you need us',
                      color: Colors.black54)),
            ],
          )
        ],
      ),
      // color: Colors.amberAccent,
    ),
    Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircularAva(
              color: Colors.blueGrey,
              icon: Icon(
                Icons.electric_scooter,
                size: 14,
                color: Colors.white,
              )),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppLargeText(
                size: 14,
                text: 'Moving your carrer simultaneouly',
                color: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.zero,
                  padding: const EdgeInsetsDirectional.all(0.0),
                  width: 234,
                  child: const AppText(
                      size: 14,
                      text:
                          'we provide on-boarding trainings to get you started and render continued support when you need us',
                      color: Colors.black54)),
            ],
          )
        ],
      ),
      // color: Colors.amberAccent,
    ),
    Container(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircularAva(
              color: Colors.purpleAccent,
              icon: Icon(
                Icons.roller_skating_sharp,
                size: 14,
                color: Colors.white,
              )),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppLargeText(
                size: 14,
                text: 'Personal growth makes a better you',
                color: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.zero,
                  padding: const EdgeInsetsDirectional.all(0.0),
                  width: 234,
                  child: const AppText(
                      size: 14,
                      text:
                          'we provide on-boarding trainings to get you started and render continued support when you need us',
                      color: Colors.black54)),
            ],
          )
        ],
      ),
      // color: Colors.amberAccent,
    ),
  ];

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 128,
          child: PageView.builder(
              itemCount: items.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(items, pagePosition, active);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(items.length, activePage))
      ],
    );
  }
}

AnimatedContainer slider(item, pagePosition, active) {
  double margin = active ? 8 : 16;

  return AnimatedContainer(
    padding: EdgeInsets.zero,
    duration: const Duration(milliseconds: 500),
    curve: Curves.slowMiddle,
    margin: EdgeInsets.all(margin),
    child: item[pagePosition],
  );
}

// textAnimation(PageController animation, items, pagePosition) {
//   return AnimatedBuilder(
//     animation: animation,
//     builder: (context, widget) {
//       print(pagePosition);

//       return SizedBox(
//         width: 200,
//         height: 200,
//         child: widget,
//       );
//     },
//     child:
//         Container(margin: const EdgeInsets.all(8), child: items[pagePosition]),
//   );
// }

List<Widget> indicators(itemLength, currentIndex) {
  return List.generate(itemLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.black12,
          shape: BoxShape.circle),
    );
  });
}
