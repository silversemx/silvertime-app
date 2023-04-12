import 'dart:async';

import 'package:silvertime/include.dart';
import 'package:silvertime/screens/resources/services.dart';
import 'package:silvertime/style/container.dart';
import 'package:silvertime/widgets/common/bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamController<int> currentPageStream = StreamController.broadcast();
  StreamController<int> pagesStream = StreamController.broadcast();
  int _currentPage = 0;

  set currentPage (int newPage) {
    setState(() {
      _currentPage = newPage;
    });
    currentPageStream.add (_currentPage);
  }

  @override
  void dispose() {
    currentPageStream.close();
    pagesStream.close();
    super.dispose();
  }

  Widget _pageIndicator () {
    return StreamBuilder(
      stream: pagesStream.stream,
      builder: (context, snapshot) {
        return Center (
          child: Container (
            decoration: containerDecoration.copyWith(
              boxShadow: [
                BoxShadow (
                  color: Theme.of(context).shadowColor,
                  blurRadius: 5,
                  spreadRadius: 1
                )
              ]
            ),
            padding: const EdgeInsets.all(4),
            child: Row (
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton (
                  icon: const Icon (
                    Icons.keyboard_arrow_left,
                    size: 24,
                  ),
                  onPressed: () {
                    if (_currentPage > 0) {
                      currentPage = _currentPage -1;
                    }
                  },
                ),
                Text (
                  "${_currentPage + 1} / ${
                    snapshot.data ?? 0
                  }",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                IconButton (
                  icon: const Icon (
                    Icons.keyboard_arrow_right,
                    size: 24,
                  ),
                  onPressed: () {
                    if (
                      _currentPage < (snapshot.data ?? 1000) - 1
                    ) {
                      currentPage = _currentPage + 1;
                    }
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar (),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Container (
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16
                  ),
                  child: Column (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      ServicesScreen(
                        currentPageStream: currentPageStream.stream,
                        pagesSink: pagesStream.sink,  
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned (
              bottom: 16,
              right: 16,
              child: _pageIndicator(),
            )
          ],
        ),
      ),
    );
  }
}