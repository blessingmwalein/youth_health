import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youthhealth/bloc/auth/authentication_bloc.dart';
import 'package:youthhealth/constants/theme.dart';
import 'package:youthhealth/routes/app_router.dart';
import 'package:youthhealth/ui/util/icon.dart';
import 'package:youthhealth/ui/util/shared/app_buttons.dart';
import 'package:youthhealth/ui/util/shared/user_avatar.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthenticationBloc>(context)
        .add(AuthUserCache()); // Replace with your authentication event
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryPurple,
      elevation: 0,
      actions: [
        BlocBuilder<AuthenticationBloc, AuthenticationBlocState>(
          builder: (context, state) {
            if (state is AuthUserCacheFound) {
              return Text(
                state.userModel.address ?? "No Address",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: primaryWhite,
                ),
              );
            } else {
              return Text(
                "Guest",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: primaryWhite,
                ),
              );
            }
          },
        ),
        SizedBox(width: 10),
        InkWell(
          onTap: () {
            context.router.push(const ProfileRoute());
          },
          child: userAvatar(context),
        ),
        SizedBox(width: 10),
      ],
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () {
          // Open the menu drawer when the icon is pressed
          Scaffold.of(context).openDrawer();
        },
      ),
      title: Expanded(
        child: Container(
          // width: 200, // Adjust the width as needed
          height: 50, // Adjust the height as needed
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
                10), // Adjust the radius for rounded corners
            border: Border.all(
              color: Colors.grey.withOpacity(0.4), // Set the border color
              width: 1.0, // Set the border width
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: myIcon(iconColor: Colors.black,
                    path: "assets/icons/search.svg", width: 30, height: 30),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
