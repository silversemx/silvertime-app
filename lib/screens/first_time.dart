import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/resources/service/service.dart';
import 'package:silvertime/style/container.dart';
import 'package:silvertime/widgets/resources/services/status_box.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FirstTimeScreen extends StatefulWidget {
  const FirstTimeScreen({super.key});
  static const String routeName = "/first-time";

  @override
  State<FirstTimeScreen> createState() => _FirstTimeScreenState();
}

class _FirstTimeScreenState extends State<FirstTimeScreen> {
  final PageController _pageController = PageController();
  bool _showDoneButton = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage ("assets/tutorial/interruptions.png"), context);
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _page1 () {
    return Container (
      padding: const EdgeInsets.symmetric(
        horizontal: 32
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text (
            S.of (context).welcomeTo,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: Theme.of(context).primaryColor
            ),
            textAlign: TextAlign.center,
          ),
          Text (
            "silvertime",
            style: Theme.of(context).textTheme.merge (
              GoogleFonts.ralewayTextTheme()
            ).displayLarge!.copyWith(
              color: UIColors.primary
            ),
          ),
          const SizedBox(height: 48),
          RichText (
            text: TextSpan (
              text: S.of(context).the,
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                const TextSpan (text: " "),
                TextSpan (
                  text: S.of(context).tool,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).primaryColor
                  ),
                ),
                const TextSpan (text: " "),
                TextSpan (
                  text: S.of(context).welcomeText1,
                  style: Theme.of(context).textTheme.bodyLarge
                ),
                const TextSpan (text: " "),
                TextSpan (
                  text: S.of(context).system,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).primaryColorDark
                  )
                )
              ]
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
  
  Widget _page2 () {
    return SingleChildScrollView(
      child: Container (
        padding: const EdgeInsets.symmetric(
          horizontal: 32
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text (
              S.of(context).checkServiceStatus,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            StatusBoxWidget(
              service: Service.empty(
                name: "Vaccines web service"
              ),
              dummy: true,
            ),
            const SizedBox(height: 32),
            Text (
              S.of(context).knowOverviewText,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Image.asset (
              "assets/tutorial/interruptions.png",
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 32),
          ]
        )
      ),
    );
  }

  Widget _page3 () {
     return Container (
      padding: const EdgeInsets.symmetric(
        horizontal: 32
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text (
            S.of(context).receiveNotifications,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          Text (
            "🔔",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 150
            ),
            textAlign: TextAlign.center,
          )
        ]
      )
    );
  }

  Widget _page4 () {
    return Container (
      padding: const EdgeInsets.symmetric(
        horizontal: 32
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text (
            S.of (context).generateReports,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack (
          children: [
            Positioned.fill (
              child: PageView (
                onPageChanged: (int page) {
                  setState(() {
                    _showDoneButton = page == 3;
                  });
                },
                controller: _pageController,
                children: [
                  _page1(),
                  _page2(),
                  _page3(),
                  _page4(),
                ],
              ),
            ),
            Positioned (
              bottom: 16,
              left: 0,
              right: 0,
              child: Center (
                child: Container (
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: containerDecoration,
                  child: SmoothPageIndicator (
                    controller: _pageController,
                    count: 4,
                    axisDirection: Axis.horizontal,
                    effect: WormEffect (
                      activeDotColor: Theme.of(context).primaryColor,
                      dotColor: Theme.of(context).primaryColorLight
                    ),
                  ),
                ),
              ),
            ),
            Positioned (
              bottom: 0,
              right: 16,
              child: AnimatedOpacity(
                opacity: _showDoneButton ? 1 : 0,
                duration: const Duration(
                  milliseconds: 200
                ),
                child: TextButton (
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.zero
                    )
                  ),
                  child: Text (
                    S.of(context).status_done,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Theme.of(context).primaryColor
                    ),
                  ),
                  onPressed: () {
                    locator<SharedPreferences> ().setBool("first_time", false);
                    Navigator.of(context).pushReplacementNamed(
                      "/home"
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}