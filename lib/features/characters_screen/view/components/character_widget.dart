part of '../characters_view.dart';

class CharacterWidget extends StatelessWidget {
  final Result character;
  CharacterWidget({required this.character});
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radiusXXL),
        color: Theme.of(MyRouteFactory.context).cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(paddingM),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(radiusXXL),
              child: Image.network(
                  character.image ?? '',
                  width: 75.horizontalScale,
                  height: 75.horizontalScale,
                  errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.image,
                        size: 75.horizontalScale,
                      ),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      width: 75.horizontalScale,
                      height: 75.horizontalScale,
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }),
            ),
            SizedBox(width: paddingM),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _GeneralTextFieldForCharacterInfo(
                    content: character.name,
                    textStyle: s20W700Dark,
                  ),
                  _GeneralTextFieldForCharacterInfo(
                    content: character.status,
                    textStyle: s20W700Dark.copyWith(color: character.status?.colorBasedOnStatus()),
                  ),
                  _GeneralTextFieldForCharacterInfo(
                    content: character.location?.name,
                    placeHolder: AppLocalization.getLabels.unknown,
                  ),
                ],
              ),
            ),
            SizedBox(width: paddingM),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _GeneralTextFieldForCharacterInfo(
                    content: character.created?.formatCreatedTime(),
                  ),
                  _GeneralTextFieldForCharacterInfo(
                    content: character.species,
                  ),
                  _GeneralTextFieldForCharacterInfo(
                    content: character.gender,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
