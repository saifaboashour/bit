import 'package:cardsproject2/module/home/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/app_colors.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.onTap,
    required this.product,
  });

  final Function() onTap;
  final Product product;

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
              '${product.image}',
              fit: BoxFit.cover,
              errorBuilder: (context,_,e) => const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}
