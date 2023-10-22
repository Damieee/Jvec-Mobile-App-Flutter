import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:jvec_app/core/extentions.dart';
import 'package:jvec_app/presentation/utils/strings.dart';

import '../../../core/app_routes.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

List<Widget> _pages = <Widget>[
  PageViewItems(
    'assets/images/food1.png',
    title: 'Pay anything',
    desc: 'Support any kind of payment',
  ),
  PageViewItems(
    'assets/images/food2.png',
    title: 'Pay fast',
    desc: 'Scan Qr Code and Pay',
  ),
  PageViewItems(
    'assets/images/food3.png',
    title: 'Feel the freedom',
    desc: 'Move your money freely',
  ),
];

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  PageController? _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  bool get isLastPage => _pages.length == currentIndex + 1;

  Future<void> showBottomSheet() async {
    await Future.delayed(Duration(milliseconds: 300));
    final bool? pressButton = await showModalBottomSheet(
      barrierColor: Colors.transparent,
      context: context,
      builder: (context) => OnBoardingSheet(),
    );

    if (pressButton == true) {
      Get.offNamed(Routes.login);
    }
  }

  void navigateToPage(int index) {
    _pageController!.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void onChangedFunction(int index) {
    setState(() => currentIndex = index);
    if (isLastPage) showBottomSheet();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              !isLastPage
                  ? Align(
                      alignment: Alignment.centerRight,
                      //  child:
                      // TextButton(
                      //   style: TextButton.styleFrom(primary: Colors.black),
                      //   child: Text('Skip'),
                      //   onPressed: () {
                      //     navigateToPage(_pages.length - 1);
                      //   },
                      // ),
                    )
                  : //adjust this height
                  SizedBox(height: 43),
              Expanded(
                child: PageView(
                  onPageChanged: onChangedFunction,
                  controller: _pageController,
                  children: _pages,
                ),
              ),
              Center(
                child: SmoothPageIndicator(
                  controller: _pageController!, // PageController
                  count: 3,
                  effect: WormEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 8,
                    dotHeight: 8,
                    strokeWidth: 1.5,
                    type: WormType.thin,
                    dotColor: AppColors.outline,
                    activeDotColor: AppColors.primary,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.black),
                    child: Text('Skip'),
                    onPressed: () {
                      navigateToPage(_pages.length - 1);
                    },
                  ),
                  // SmoothPageIndicator(
                  //   controller: _pageController!, // PageController
                  //   count: 3,
                  //   effect: WormEffect(
                  //     spacing: 8.0,
                  //     radius: 4.0,
                  //     dotWidth: 8,
                  //     dotHeight: 8,
                  //     strokeWidth: 1.5,
                  //     type: WormType.thin,
                  //     dotColor: AppColors.outline,
                  //     activeDotColor: AppColors.primary,
                  //   ),
                  // ),
                  !isLastPage
                      ? ElevatedButton(
                          onPressed: () {
                            navigateToPage(currentIndex + 1);
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(114, 32),
                          ),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            showBottomSheet();
                          },
                          child: Icon(CupertinoIcons.arrow_right),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(114, 32),
                          ),
                        ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoardingSheet extends StatelessWidget {
  const OnBoardingSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(16, 0),
            blurRadius: 50,
            color: AppColors.outline,
          )
        ],
      ),
      child: ListView(
        shrinkWrap: true, // use it
        physics: BouncingScrollPhysics(),
        children: [
          Center(
            child: Container(
              height: 6,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Color(0xFFBDBDBD),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Get Started'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ).center,
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class PageViewItems extends StatelessWidget {
  const PageViewItems(
    this.assetPath, {
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  final String assetPath;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          kUrl,
          height: 250,
          width: 250,
          fit: BoxFit.contain,
        ),
        spacer(h: 32),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Get.textTheme.titleLarge!.copyWith(fontSize: 22),
        ),
        spacer(h: 8),
        Text(
          desc,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
