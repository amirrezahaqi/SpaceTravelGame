import 'package:flutter/material.dart';
import 'package:hellofirebase/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Image.asset(
          Assets.bg.path,
          fit: BoxFit.cover,
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
                  GestureDetector(
                    onTap: () {
                      myLaunchUrl(String url) async {
                        var uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      }

                      myLaunchUrl("https://instagram.com/amirrezahaqi");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                          border: Border.all(color: Colors.yellow, width: 2)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(Assets.instagram.path)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      myLaunchUrl(String url) async {
                        var uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      }

                      myLaunchUrl("https://www.linkedin.com/in/amirreza-haqi/");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                          border: Border.all(color: Colors.yellow, width: 2)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(Assets.linkedin.path)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      myLaunchUrl(String url) async {
                        var uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      }

                      myLaunchUrl("https://github.com/amirrezahaqi");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                          border: Border.all(color: Colors.yellow, width: 2)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(Assets.github.path)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      myLaunchUrl(String url) async {
                        var uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      }

                      myLaunchUrl("https://twitter.com/amirrezahaqi");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                          border: Border.all(color: Colors.yellow, width: 2)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(Assets.twitter.path)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      myLaunchUrl(String url) async {
                        var uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      }

                      myLaunchUrl("https://amirrezahaqi.ir");
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red,
                          border: Border.all(color: Colors.yellow, width: 2)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(Assets.website.path)),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ]),
    );
  }
}
