import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/slider_model.dart';

class HomeCarouselSlider extends StatefulWidget {
  const HomeCarouselSlider({super.key, required this.sliders});

  final List<SliderModel> sliders;

  @override
  State<HomeCarouselSlider> createState() => _HomeCarouselSliderState();
}

class _HomeCarouselSliderState extends State<HomeCarouselSlider> {
  final ValueNotifier<int> _currentSlider = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentSlider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sliders.isEmpty) {
      return SizedBox(
        height: 200,
        child: Center(child: Text("Have No Slider")),
      );
    }

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            height: 200.0,
            onPageChanged: (int currentIndex, _) {
              _currentSlider.value = currentIndex;
            },
          ),
          items: widget.sliders.map((i) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(i.photoUrl),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        ValueListenableBuilder<int>(
          valueListenable: _currentSlider,
          builder: (context, currentIndex, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.sliders.length, (int index) {
                return AnimatedContainer(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 10,
                  width: currentIndex == index ? 20 : 10,
                  duration: const Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: currentIndex == index
                        ? AppColors.themeColor
                        : AppColors.themeColor.withOpacity(0.2),
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}

