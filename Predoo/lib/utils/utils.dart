import 'dart:async';

import 'package:flutter/material.dart';
import 'package:predoo/utils/color.dart';

class ImageSlider extends StatefulWidget {
  final List<String> images;

  const ImageSlider({Key? key, required this.images}) : super(key: key);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        initialPage: _currentPage,
      viewportFraction: 0.9
    );
    _startTimer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < widget.images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
        _pageController.jumpToPage(0); // Smooth transition to the first page
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                  child: Image.network(widget.images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < widget.images.length; i++)
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 8),
                width: _currentPage == i ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == i ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class BackgroundContainer extends StatelessWidget {
  final Widget child;

  const BackgroundContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0), // Top right corner radius
          bottomRight: Radius.circular(20.0), // Bottom right corner radius
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: MyColor.primaryColor,
          borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15)),
        ),
        child: child,
      ),
    );
  }
}
