part of "../characters_view.dart";

class _GeneralTextFieldForCharacterInfo extends StatelessWidget {
  const _GeneralTextFieldForCharacterInfo({
    Key? key,
    this.content,
    this.textStyle,
    this.placeHolder,
  }) : super(key: key);
  final String? content;
  final String? placeHolder;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      content ?? placeHolder ?? '',
      style: textStyle ?? s12W500Dark,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}