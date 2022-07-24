import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Terms and Conditions'),
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
                  "These terms and conditions outline the rules and regulations for the use of Click to Eat.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "By using this app we assume you accept these terms and conditions. Do not continue to use Click to Eat if you do not agree to take all of the terms and conditions stated on this page.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    "The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: the person log on this website and compliant to the Company’s terms and conditions. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client’s needs in respect of provision of the Company’s stated services, in accordance with and subject to, prevailing law of Netherlands. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.",
                    textAlign: TextAlign.justify),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "License",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Unless otherwise stated, Click to Eat and/or its licensors own the intellectual property rights for all material on Click to Eat. All intellectual property rights are reserved. You may access this from Click to Eat for your own personal use subjected to restrictions set in these terms and conditions.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Parts of this app offer an opportunity for users to post and exchange opinions and information in certain areas of the website. Click to Eat does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of Click to Eat, its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, Click to Eat shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    "Click to Eat reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.",
                    textAlign: TextAlign.justify),
              ],
            ),
          ),
        ));
  }
}
