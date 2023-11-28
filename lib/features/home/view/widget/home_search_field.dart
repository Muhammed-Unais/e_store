import 'package:e_store/res/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SearchTextfield extends StatelessWidget {
  const SearchTextfield({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: "Search",
        filled: true,
        fillColor: AppColors.lightCardColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).cardColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          borderSide: BorderSide(
            color: Theme.of(
              context,
            ).colorScheme.secondary,
          ),
        ),
        suffixIcon: Icon(
          IconlyLight.search,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}