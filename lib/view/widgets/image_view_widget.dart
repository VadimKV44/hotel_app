import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/view/consts/colors.dart';

class ImageViewWidget extends StatefulWidget {
  const ImageViewWidget({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  State<ImageViewWidget> createState() => _ImageViewWidgetState();
}

class _ImageViewWidgetState extends State<ImageViewWidget> {
  int imagePage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 257,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: widget.itemCount,
            onPageChanged: (page) {
              setState(() {
                imagePage = page;
              });
            },
            itemBuilder: widget.itemBuilder,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 8.0),
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              decoration: BoxDecoration(
                color: MainColors.kWhiteColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: DotsIndicator(
                dotsCount: widget.itemCount,
                position: double.parse(imagePage.toString()),
                decorator: DotsDecorator(
                  activeColor: MainColors.kBlackColor,
                  colors: returnColors(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Color> returnColors() {
    List<Color> colors = [];
    for (int i = widget.itemCount; i > 0; i--) {
      colors.add(MainColors.kBlackColor.withOpacity((i / (widget.itemCount + 1)) * 0.6));
    }
    return colors;
  }
}
