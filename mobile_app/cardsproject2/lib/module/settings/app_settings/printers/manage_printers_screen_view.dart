import 'package:flutter/material.dart';

import '../../../../util/images_path.dart';
import '../../../../view/custom_header.dart';

class ManagePrintersScreen extends StatelessWidget {
  const ManagePrintersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomHeader(
              lable: 'Manage Printers',
              icon: ImagePath.printer,
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
