import 'package:e_store/features/cart/view/cart_screen_view.dart';
import 'package:e_store/res/widgets/appbar_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Home",
      ),
      leading: AppbarIcons(
        function: () {
          // Navigator.push(
          //   context,
          //   PageTransition(
          //     type: PageTransitionType.fade,
          //     child: const CatagoryScreen(),
          //   ),
          // );
        },
        icons: IconlyBold.home,
      ),
      actions: [
        AppbarIcons(
          function: () {
            Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child:  CartScreen(),
            ),
          );
          },
          icons: Icons.shopping_cart,
        ),
      ],
    );
  }
}