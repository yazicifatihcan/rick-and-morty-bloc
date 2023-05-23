part of "characters_view.dart";

class SuccesfullWidget extends StatelessWidget {
  final ScrollController scrollController;
  final bool isFetching;
  final List<Result> characters;

  SuccesfullWidget({required this.characters, required this.isFetching, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: paddingS),
            controller: scrollController,
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return CharacterWidget(character: characters[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: paddingM);
            },
          ),
        ),
        CircularProgressIndicator(
          color: Theme.of(MyRouteFactory.context).colorScheme.secondary,
        ).isVisible(isFetching),
        SizedBox(height: paddingXL),
      ],
    );
  }
}
