import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/login.dart';
import 'package:movie_app/services/shared_preferance.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (_, data, __) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .05,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                ),
                LottieBuilder.asset('assets/first_img.json'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                ),
                InkWell(
                  onTap: () {
                    data.isFirstTime
                        ? Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          )
                        : data.setUserInfo();
                  },
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .09,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 85, 104, 254),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: const Center(
                      child: Text(
                        'Enjoy your time',
                        textScaleFactor: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
