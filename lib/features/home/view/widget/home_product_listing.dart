import 'package:e_store/res/widgets/product_card.dart';
import 'package:flutter/material.dart';

class HomeProductsListing extends StatelessWidget {
  const HomeProductsListing({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 4)),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
              strokeWidth: 2,
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "${snapshot.error}",
              style: const TextStyle(color: Colors.black),
            ),
          );
        } else if (snapshot.data == null) {
          return Center(
            child: Text("${snapshot.error}"),
          );
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data!.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 1 / 1.4,
          ),
          itemBuilder: (context, index) {
            return SizedBox(
              width: size.width * 0.4,
              child:
                 ProductCard(
                  feedAction: () {
                    // Navigator.push(
                    //   context,
                    //   PageTransition(
                    //     type: PageTransitionType.fade,
                    //     child: ProductDeatilsScreen(
                    //     productmodel: snapshot.data![index],
                    //     ),
                    //   ),
                    // );
                  },
                ),
              
            );
          },
        );
      },
    );
  }
}