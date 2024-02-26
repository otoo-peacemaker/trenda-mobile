import 'package:flutter/material.dart';
// import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:trenda/components/build_widget_components.dart';
import 'package:trenda/core/app_export.dart';

import '../onboarding_one_screen/provider/onboarding_one_provider.dart';

/*class OnboardingScreenSlider extends StatelessWidget {
  const OnboardingScreenSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fullscreen Slider Demo')),
      body: Center(
        child: Builder(
          builder: (context) {
            final height = MediaQuery.of(context).size.height;
            return FlutterCarousel(
              options: CarouselOptions(
                height: height,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: true,
                enableInfiniteScroll: true,
                showIndicator: true,
                autoPlayInterval: const Duration(seconds: 2),
                slideIndicator: CircularWaveSlideIndicator(),
              ),
              items: [],
            );
          },
        ),
      ),
    );
  }
}*/

class ManuallyControlledSlider extends StatefulWidget {
  const ManuallyControlledSlider({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => OnboardingOneProvider(),
        child: const ManuallyControlledSlider());
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final CarouselController _controller = CarouselController();
  /*final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];*/
  final List<Widget> img = [
    Image.asset('assets/images/img_onboarding_1_.png'),
    Image.asset('assets/images/img_onboarding_1_.png'),
    Image.asset('assets/images/img_onboarding_1_.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Manually controlled slider')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              items: [
                Image.asset(ImageConstant.imgOnboarding1),
                Image.asset(ImageConstant.imgOnboarding1),
                /*   Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.imgOnboarding1),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text('header'),
                      buildWidgetSpace(height: 10.h),
                      Text('desc'),
                    ],
                  ),
                ),*/
                /*     buildOnBoardingScreen(
                    imgPath: 'assets/images/img_onboarding_1.png',
                    header: '',
                    desc: ''),
                buildOnBoardingScreen(
                    imgPath: 'assets/images/img_onboarding_1.png',
                    header: '',
                    desc: ''),
                buildOnBoardingScreen(
                    imgPath: 'assets/images/img_onboarding_1.png',
                    header: '',
                    desc: ''),*/
              ],
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: height,
              ),
              carouselController: _controller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => _controller.previousPage(),
                    child: const Text('←previous'),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => _controller.nextPage(),
                    child: const Text('Next→'),
                  ),
                ),
                ...Iterable<int>.generate(img.length).map(
                  (int pageIndex) => Flexible(
                    child: ElevatedButton(
                      onPressed: () => _controller.animateToPage(pageIndex),
                      child: Text("$pageIndex"),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Container(
  // child: Center(
  // child: Image.network(
  // item,
  // fit: BoxFit.cover,
  // height: height,
  // ))
  // )
}

Widget buildOnBoardingScreen(
    {required String imgPath, required String header, required String desc}) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover)),
    child: Column(
      children: [
        Text(header),
        buildWidgetSpace(height: 10.h),
        Text(desc),
      ],
    ),
  );
}
