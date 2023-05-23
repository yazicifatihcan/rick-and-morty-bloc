part of '../splash_view.dart'; 

class _LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            rickSplashGif,
            height: 250.verticalScale,
            width: 250.verticalScale,
          ),
          SizedBox(
            height: paddingXXXL,
          ),
          Transform.scale(scale: 3, child: CircularProgressIndicator.adaptive()),
        ],
      ),
    );
  }
}