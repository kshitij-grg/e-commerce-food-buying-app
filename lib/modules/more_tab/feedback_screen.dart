import 'package:flutter/material.dart';
import 'package:food_delivery/modules/more_tab/feedback_controller.dart';
import 'package:food_delivery/widgets/progress_loading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';
import '../../widgets/input_text_field.dart';
import '../../widgets/custom_button.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FeedbackController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Provide Feedback'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor)),
                  labelText: "Subject",
                  floatingLabelStyle: TextStyle(color: primaryColor),
                ),
                cursorColor: primaryColor,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                controller: controller.subjectController,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor)),
                  labelText: "Message",
                  floatingLabelStyle: TextStyle(color: primaryColor),
                ),
                maxLines: 5,
                textInputAction: TextInputAction.done,
                cursorColor: primaryColor,
                keyboardType: TextInputType.text,
                controller: controller.messageController,
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => controller.isLoading.isTrue
                    ? const ProgressLoading(
                        size: 100,
                      )
                    : CustomButton(
                        label: "Submit",
                        onPress: () {
                          controller.provideFeedback();
                          // for sending message directly to mail
                          // String? encodeQueryParameters(Map<String, String> params) {
                          //   return params.entries
                          //       .map((e) =>
                          //           '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                          //       .join('&');
                          // }

                          // final Uri emailLaunchUri = Uri(
                          //   scheme: 'mailto',
                          //   path: 'ssrusan@gmail.com',
                          //   query: encodeQueryParameters(<String, String>{
                          //     'subject': subject,
                          //     'body': message,
                          //   }),
                          // );

                          // launchUrl(emailLaunchUri);
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
