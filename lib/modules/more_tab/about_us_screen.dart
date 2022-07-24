import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Welcome to Click to Eat!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your number one source for all food delivery. We're dedicated to giving you the very best of any food you order, with a focus on timely deliver.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Founded in 2021 by Santosh Lamichhane, Click to Eat has come a long way from its beginnings in Lakeside, Pokhara. When Mr. Santosh first started out, his passion for delicious foods drove him to do tons of research so that Click to Eat can offer you delicious foods on time. We now serve customers all over Pokhara city, and are thrilled that we're able to turn our passion into our own app.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    "We hope you enjoy our foods as much as we enjoy offering them to you. If you have any questions or comments, please don't hesitate to contact us.",
                    textAlign: TextAlign.justify),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Sincerely,\nSantosh Lamichhane",
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ));
  }
}
