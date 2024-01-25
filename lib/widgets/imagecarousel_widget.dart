import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> images;
  const ImageCarousel({super.key, required this.images});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  PageController pagecont = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          ExpandablePageView(
            controller: pagecont,
            onPageChanged: (v) {},
            children: [
              ...widget.images.map(
                (e) => Image.asset(e, fit: BoxFit.fitWidth,),
              ),
            ],
          ),
          Positioned.fill(
            bottom: 5,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(6),
                child: SmoothPageIndicator(
                  controller: pagecont,
                  count: widget.images.length,
                  effect: const WormEffect(
                    dotWidth: 6,
                    dotHeight: 6,
                    spacing: 6,
                    activeDotColor: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
