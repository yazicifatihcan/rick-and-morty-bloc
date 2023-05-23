import 'package:casino_test/app/extensions/widget_scale_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/i10n/i10n.dart';
import '../../constants/assets.dart';
import '../../constants/padding_and_radius.dart';
import '../../theme/text_style/text_style.dart';

class GeneralErrorScreen extends StatelessWidget {
  const GeneralErrorScreen({
    Key? key, this.message, this.imagePath, this.btnText, required this.onTapBtn,
  }) : super(key: key);
  final String? message;
  final String? imagePath;
  final String? btnText;
  final VoidCallback onTapBtn;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath ?? rickDeadImage,
            height: 250.verticalScale,
            width: 250.verticalScale,
          ),
          SizedBox(
            height: paddingXXXL,
          ),
          Text(
            message ?? AppLocalization.getLabels.defaultErrorMessage,
            style: s12W700Dark.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: paddingXXXL,
          ),
          TextButton(
            onPressed: onTapBtn,
            child: Text(
              btnText ?? AppLocalization.getLabels.tryAgain,
              style: s26W700Dark.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
