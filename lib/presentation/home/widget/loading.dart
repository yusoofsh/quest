import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

/// Display shimmer effect.
class LoadingWidget extends StatelessWidget {
  const LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemBuilder: (_, __) {
        return Card(
          child: ListTile(
            title: buildShimmer(
              height: 20.0,
              width: MediaQuery.of(context).size.width / 4,
            ),
            subtitle: buildShimmer(
              height: 16.0,
              width: MediaQuery.of(context).size.width / 3,
              padding: const EdgeInsets.only(top: 4.0),
              interval: const Duration(milliseconds: 200),
            ),
          ),
        );
      },
    );
  }

  Widget buildShimmer({
    double height,
    double width,
    EdgeInsets padding,
    Duration interval,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: padding ?? EdgeInsets.zero,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Shimmer(
              interval: interval ?? Duration.zero,
              duration: const Duration(seconds: 4),
              child: SizedBox(
                height: height,
                width: width,
              ),
            ),
          ),
        ),
        const SizedBox(),
      ],
    );
  }
}
