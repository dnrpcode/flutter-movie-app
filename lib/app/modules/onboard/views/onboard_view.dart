import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:movie_app/app/routes/app_pages.dart';
import '../../../helpers/size_config.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: demoData.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingContent(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
                image: demoData[index].image,
                title: demoData[index].title,
                description: demoData[index].description,
              );
            },
          ),
          Positioned(
            bottom: SizeConfig.screenHeight * 0.05,
            width: SizeConfig.screenWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // const DotIndicatior(),
                  ...List.generate(
                      demoData.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: DotIndicatior(isActive: index == _pageIndex),
                          )),
                  const Spacer(),
                  SizedBox(
                    height: 52,
                    width: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pageIndex < demoData.length - 1) {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                        } else {
                          Get.toNamed(Routes.HOME);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Theme.of(context).primaryColor),
                      child: const Icon(
                        PhosphorIcons.caret_right_bold,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DotIndicatior extends StatelessWidget {
  const DotIndicatior({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 18 : 8,
      width: 6,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(isActive ? 1 : 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demoData = [
  Onboard(
    image: 'assets/images/onboarding_one.png',
    title: 'Find your favorite movies in our application',
    description:
        'Many choices of movies from various genres that you can watch easily in our application.',
  ),
  Onboard(
    image: 'assets/images/onboarding_one.png',
    title: 'Find your favohofsoiahdof dshaoifho application',
    description: 'dfdsfhoih sdfoih lication.',
  ),
  Onboard(
    image: 'assets/images/onboarding_one.png',
    title: 'Find yourioho cation',
    description: 'Many dfysai ily in our application.',
  )
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.title,
    required this.description,
  });

  final double width, height;
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(image, fit: BoxFit.cover),
        Positioned(
          width: width - 40,
          bottom: height * 0.15,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineMedium
                    // ?.copyWith(backgroundColor: Colors.amber),
                    ),
                const SizedBox(height: 8),
                Text(description,
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        )
      ],
    );
  }
}
