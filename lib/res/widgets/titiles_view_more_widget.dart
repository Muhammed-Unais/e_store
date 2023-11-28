import 'package:e_store/res/widgets/appbar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class TitilsAndViewmore extends StatelessWidget {
  const TitilsAndViewmore({super.key,});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text(
            "Latest Products",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          AppbarIcons(
            function: (){},
            icons: IconlyBold.arrowRight2,
          ),
        ],
      ),
    );
  }
}
