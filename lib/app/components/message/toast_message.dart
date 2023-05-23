import 'package:casino_test/app/extensions/widget_scale_extension.dart';
import 'package:casino_test/app/navigation/route_factory.dart';
import 'package:flutter/material.dart';
import '../../../core/i10n/i10n.dart';
import '../../constants/padding_and_radius.dart';
import '../../theme/text_style/text_style.dart';

void showToastMessage({
  int? duration,
  String? message,
  required bool isError,
}) {
  ScaffoldMessenger.of(MyRouteFactory.context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      content: _ToastWidget(
          textMessage: message ?? AppLocalization.getLabels.defaultErrorMessage,
          backgroundColor: isError ? Theme.of(MyRouteFactory.context).colorScheme.error : Theme.of(MyRouteFactory.context).colorScheme.secondary,
          primaryColor: Theme.of(MyRouteFactory.context).colorScheme.primary)));
}

class _ToastWidget extends StatelessWidget {
  final String textMessage;
  final Color backgroundColor;
  final Color primaryColor;

  const _ToastWidget({
    Key? key,
    required this.textMessage,
    required this.backgroundColor,
    required this.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: primaryColor,
          width: 1.horizontalScale,
        ),
        borderRadius: BorderRadius.circular(radiusXS),
      ),
      child: Padding(
        padding: EdgeInsets.all(paddingXXS.horizontalScale),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40.verticalScale,
              width: 4.horizontalScale,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(radiusXXXXXS),
              ),
            ),
            const SizedBox(width: paddingM),
            Flexible(
              child: Text(
                textMessage,
                maxLines: 2,
                style: s16W400Dark.copyWith(color: Theme.of(MyRouteFactory.context).colorScheme.secondaryContainer),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
