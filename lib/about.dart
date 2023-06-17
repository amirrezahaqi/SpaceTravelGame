import 'package:flutter/material.dart';
import 'package:spacetravel/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splashbg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.logo.path,
              scale: 1.5,
            ),
            const Text("DEVELOPER",
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            const Text("AMIRREZA  JOLOUS HAQI",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: size.width / 1.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        myLaunchUrl(String url) async {
                          var uri = Uri.parse(url);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          }
                        }

                        myLaunchUrl(
                            "https://www.linkedin.com/in/amirreza-haqi/");
                      },
                      icon: Image.asset(Assets.linkedin.path)),
                  IconButton(
                      onPressed: () {
                        myLaunchUrl(String url) async {
                          var uri = Uri.parse(url);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          }
                        }

                        myLaunchUrl("https://instagram.com/amirrezahaqi");
                      },
                      icon: Image.asset(Assets.instagram.path)),
                  IconButton(
                      onPressed: () {
                        myLaunchUrl(String url) async {
                          var uri = Uri.parse(url);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          }
                        }

                        myLaunchUrl("https://twitter.com/amirrezahaqi");
                      },
                      icon: Image.asset(Assets.twitter.path)),
                  IconButton(
                      onPressed: () {
                        myLaunchUrl(String url) async {
                          var uri = Uri.parse(url);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          }
                        }

                        myLaunchUrl("https://github.com/amirrezahaqi");
                      },
                      icon: Image.asset(Assets.github.path)),
                  IconButton(
                      onPressed: () {
                        myLaunchUrl(String url) async {
                          var uri = Uri.parse(url);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          }
                        }

                        myLaunchUrl("https://amirrezahaqi.ir");
                      },
                      icon: Image.asset(Assets.website.path)),
                ],
              ),
            )
          ],
        )),
      ]),
    );
  }
}
