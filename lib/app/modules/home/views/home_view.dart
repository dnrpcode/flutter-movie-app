import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:movie_app/app/helpers/size_config.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import '../../../widgets/searchbar.dart';
import '../../../widgets/app_bar.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarHome(),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(top: 20),
                  child: Text('Hello, Dani',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.start),
                ),
                Text('Let’s relax and enjoy your favorite movie',
                    style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.8,
                      child: SearchBar(
                        textController: HomeController().inputCon,
                        hintText: 'Search movie',
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(44, 44),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      child: const Icon(
                        PhosphorIcons.sliders_horizontal,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Text('Categories',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Text('Most Popular Movie',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      controller.movie.length,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 17),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(11.0),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/onboarding_one.png',
                                image: controller.movie.reversed.toList()[index]
                                    ["Poster"],
                                height: 243.0,
                                width: 168.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Text('You May Like',
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      controller.movie.length,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 17),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(11.0),
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/onboarding_one.png',
                                image: controller.movie[index]["Poster"],
                                height: 176.0,
                                width: 312.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
