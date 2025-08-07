import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key});

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            height: 200.0,
            onPageChanged: (index, reason) {
              selectedIndex = index;
              setState(() {});
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  alignment: Alignment.center,
                  child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: List.generate(5, (int index) {

            return AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 4),
              height: 10,
              width: selectedIndex == index ? 20 : 10,
              duration: Duration(milliseconds: 400),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

                color: selectedIndex == index
                    ? AppColors.themeColor
                    : AppColors.themeColor.withOpacity(0.2),
              ),
            );
          }),
        ),
      ],
    );
  }
}
