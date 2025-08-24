import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay_ecommerce/app/app_colors.dart';
import 'package:crafty_bay_ecommerce/app/asset_path.dart';
import 'package:flutter/material.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key, required this.image});

  final List<String> image;

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> _currentSlider = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 240,
            viewportFraction: 1,
            onPageChanged: (int currentIndex, _) {
              _currentSlider.value = currentIndex;
            },
          ),
          items: widget.image.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(image))),
                  
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _currentSlider,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < widget.image.length; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == i ? AppColors.themeColor : Colors.white,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
