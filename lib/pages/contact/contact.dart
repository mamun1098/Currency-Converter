import 'package:currency_converter/pages/contact/common.dart';
import 'package:currency_converter/pages/contact/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final ContactControllers = Get.put(ContactController());
  final nameController = TextEditingController();

  final mailController = TextEditingController();

  final phoneController = TextEditingController();

  final messageController = TextEditingController();

  final subjectController = TextEditingController();

  void data() async {
    String name = nameController.text;
    String mail = mailController.text;
    String phone = phoneController.text;
    String message = messageController.text;
    String subject = subjectController.text;
    String errorText = "";

    if (name.isEmpty) {
      errorText = "Name Filed is empty";
    } else if (mail.isEmpty) {
      errorText = "Email is empty";
    } else if (!GetUtils.isEmail(mail)) {
      errorText = "Invalid email";
    } else if (phone.isEmpty) {
      errorText = "Phon is empty";
    } else if (phone.length < 8) {
      errorText = "Correct phone";
    } else if (message.isEmpty) {
      errorText = "Message empty";
    } else if (subject.isEmpty) {
      errorText = "subject empty";
    }

    if (errorText.isNotEmpty) {
      print(errorText);
    } else {
      ContactControllers.contactUs(
        name: name,
        mail: mail,
        phone: phone,
        subject: subject,
        message: message,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact Us")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              OutlinedTextField(
                controller: nameController,
                hintText: "Name",
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 20),
              OutlinedTextField(
                controller: mailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              OutlinedTextField(
                controller: phoneController,
                hintText: "Phone",
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20),
              OutlinedTextField(
                controller: messageController,
                hintText: "Message",
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(height: 20),
              OutlinedTextField(
                controller: subjectController,
                hintText: "Subject",
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 50),

              //submit button
              TextButton(
                onPressed: () {
                  data();
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
