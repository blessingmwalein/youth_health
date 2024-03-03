import 'package:flutter/material.dart';
import 'package:youthhealth/constants/theme.dart';
import 'package:youthhealth/ui/util/shared/app_buttons.dart';
import 'package:youthhealth/ui/util/shared/strike_through_text.dart';

class AuthPageLayout extends StatefulWidget {
  const AuthPageLayout(
      {super.key,
      required this.child,
      required this.title,
      this.welcomeText = "",
      this.welcomeSubText = "",
      required this.hasSocial});

  final Widget child;
  final String title;
  final String welcomeText;
  final String welcomeSubText;
  final bool hasSocial;
  @override
  State<AuthPageLayout> createState() => _AuthPageLayoutState();
}

class _AuthPageLayoutState extends State<AuthPageLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //add logo here from asset

              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0, top: 20.0),
                child: Text(
                  widget.welcomeText,
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: primaryOrange),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: Text(
                  widget.welcomeSubText,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryWhite),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 2),
                child: widget.child,
              ),
              widget.hasSocial
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: Column(
                        children: [
                          const StrikeThroughTextField(
                            text: "OR",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          socialMediaButton(
                            context,
                            text: "Sign In with Google",
                            height: 60,
                            iconPath: "assets/icons/google.svg",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          socialMediaButton(
                            context,
                            text: "Sign In with Facebook",
                            height: 60,
                            iconPath: "assets/icons/facebook.svg",
                          )
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
