import 'package:casino_test/app/constants/assets.dart';
import 'package:casino_test/app/extensions/widget_scale_extension.dart';
import 'package:casino_test/app/navigation/route_factory.dart';
import 'package:casino_test/core/i10n/i10n.dart';
import 'package:flutter/material.dart';

import '../../../app/constants/padding_and_radius.dart';
import '../../../app/theme/text_style/text_style.dart';

class UnknownRouteScreen extends StatelessWidget {
  const UnknownRouteScreen();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            rickLost,
            height: 250.verticalScale,
            width: 250.verticalScale,
          ),
          SizedBox(
            height: paddingXXXL,
          ),
          Text(
            AppLocalization.getLabels.areYouLost,
            style: s12W700Dark.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: paddingXXXL,
          ),
          TextButton(
            onPressed: MyRouteFactory.instance.restartApp,
            child: Text(
              AppLocalization.getLabels.teleportBack,
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
