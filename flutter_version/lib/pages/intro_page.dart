import 'package:flutter/material.dart';
import 'package:flutter_version/pages/landing_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image (
            image: AssetImage('assets/OrangeFinal.png'),
            height: 150,
            width: 200,
          ),
          const SizedBox(
            height: 0,
          ),
          Text("Welcome to HelloOrange!\n\nThis recipe recommendation app will help you find\nhighly curated recipes based on your personal preferences.\n\nLet's get started!",
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(200, 100)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.headlineMedium
              ),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LandingPage()), (route) => false);
            },
            child: const Text("Proceed to profile creation"),
          ),
        ],
      ),
    );
  }
}
