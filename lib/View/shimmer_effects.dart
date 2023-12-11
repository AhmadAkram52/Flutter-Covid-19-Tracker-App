import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListShimmer extends StatelessWidget {
  const CountriesListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade700,
      highlightColor: Colors.grey.shade100,
      child: ListTile(
        leading: Container(
          height: 50,
          color: Colors.white,
          width: 50,
        ),
        title: Container(
          height: 10,
          width: 10,
          color: Colors.white,
        ),
        subtitle: Container(
          height: 8,
          width: 10,
          color: Colors.white,
        ),
      ),
    );
  }
}
