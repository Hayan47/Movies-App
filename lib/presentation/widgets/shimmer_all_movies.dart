import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AllMoviesLoading extends StatelessWidget {
  const AllMoviesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF303030),
      highlightColor: const Color(0xFF404040),
      period: const Duration(seconds: 6),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          width: 200,
          height: 200,
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(4),
          child: GridTile(
            footer: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              alignment: Alignment.bottomCenter,
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
