import 'package:ahaar_project/common/color_extension.dart';
import 'package:ahaar_project/common_widget/round_button.dart';
import 'package:ahaar_project/view/main_tabview/main_tabview.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int seldtedPage = 0;
  PageController controller = PageController();

  List pageArray = [
    {
      "title": "Welcome to AHAAR",
      "subtitle":
          "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
      "image": "assets/image/on_boarding_1.png",
    },
    {
      "title": "Fast Deliverys",
      "subtitle": "Get your food delivered at your doorstep in no time.",
      "image": "assets/image/on_boarding_2.png",
    },
    {
      "title": "Live Tracking",
      "subtitle":
          "Real time tracking of your food on the app\nonce you placed the order",
      "image": "assets/image/on_boarding_3.png",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      setState(() {
        seldtedPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArray.length,
            itemBuilder: (context, index) {
              var pObj = pageArray[index] as Map? ?? {};
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: media.width,
                    height: media.width,
                    alignment: Alignment.center,
                    child: Image.asset(
                      pObj["image"].toString(),
                      width: media.width * 0.65,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: media.width * 0.2),
                  Text(
                    pObj["title"].toString(),
                    style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: media.width * 0.05),
                  Text(
                    pObj["subtitle"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: media.width * 0.3),
                ],
              );
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: media.height * 0.6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    pageArray.map((e) {
                      var index = pageArray.indexOf(e);
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          color:
                              index == seldtedPage
                                  ? TColor.primary
                                  : TColor.placeholder,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }).toList(),
              ),
              SizedBox(height: media.height * 0.2),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: RoundButton(
                  title: "Next",
                  onPressed: () {
                    if (seldtedPage >= 2) {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context)
                          => const MainTabview(),
                        ),
                        );
                    } else {
                      setState(() {
                        seldtedPage = seldtedPage + 1;
                        controller.animateToPage(
                          seldtedPage,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.bounceInOut,
                        );
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: media.width * 0.2),
            ],
          ),
        ],
      ),
    );
  }
}
