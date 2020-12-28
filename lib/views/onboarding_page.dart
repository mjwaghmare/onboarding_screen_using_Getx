import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:onboarding_screen/anim/fade_animation.dart';
import 'package:onboarding_screen/controllers/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  final _controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onBoardingPages.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeAnimation(
                        0.5,
                        Image.asset(
                            _controller.onBoardingPages[index].imageAsset),
                      ),
                      const SizedBox(height: 30),
                      FadeAnimation(
                        0.7,
                        Text(
                          _controller.onBoardingPages[index].title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeAnimation(
                        0.9,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Text(
                            _controller.onBoardingPages[index].description,
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Row(
                children: List.generate(
                  _controller.onBoardingPages.length,
                  (index) => Obx(() {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: _controller.selectedPageIndex.value == index
                            ? Colors.red
                            : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
              ),
            ),
            Positioned(
                right: 20,
                bottom: 20,
                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: _controller.nextPage,
                  child: Obx(() {
                    child:
                    return Text(_controller.isLastPage ? 'Start' : 'Next');
                  }),
                ))
          ],
        ),
      ),
    );
  }
}
