import 'package:cardsproject2/module/home/model/category.dart';
import 'package:cardsproject2/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.onTap,
    required this.category,
  });

  final Function() onTap;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Get.width * 0.01),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.ligthGrey,
            borderRadius: BorderRadius.circular(Get.width * 0.02),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Get.width * 0.02),
            child: Image.network(
              '${category.image}',
              fit: BoxFit.cover,

              errorBuilder: (context,_,e) => const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}
