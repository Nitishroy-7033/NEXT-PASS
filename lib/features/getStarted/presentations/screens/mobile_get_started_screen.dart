
import '../../../../core/constants/app_linker.dart';


class MobileGetStartedScreen extends StatelessWidget {
final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
     body: Stack(
          children: [
                 PageView(
                  controller: _controller,
                  children: [
                    MobileWelcomeScreen1(),
                    MobileWelcomeScreen2(),
                  ],
                  scrollDirection: Axis.horizontal,
                ),
          ],
     )
    );
  }
}
