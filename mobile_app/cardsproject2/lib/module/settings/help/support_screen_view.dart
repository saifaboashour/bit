import 'package:flutter/material.dart';

import '../../../util/images_path.dart';
import '../../../view/custom_header.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              lable: 'Support',
              icon: ImagePath.support,
              action: () {},
              actionIcon: null,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
