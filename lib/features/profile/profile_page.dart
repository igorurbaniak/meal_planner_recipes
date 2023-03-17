import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_planner_recipes/features/profile/data/icon_menu.dart';
import 'package:meal_planner_recipes/features/profile/menu_pages/logout_page.dart';
import 'package:meal_planner_recipes/features/profile/menu_pages/privacy_policy_page.dart';
import 'package:meal_planner_recipes/features/profile/menu_pages/send_feedback_page.dart';
import 'package:meal_planner_recipes/features/profile/menu_pages/settings_page.dart';
import 'package:meal_planner_recipes/features/profile/menu_pages/share_page.dart';
import 'package:meal_planner_recipes/features/profile/widgets/profile_view.dart';
import 'package:meal_planner_recipes/features/profile/widgets/profile_view_vol_two.dart';
import 'package:meal_planner_recipes/utils/extensions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    Key? key,
    // required this.user,
  }) : super(key: key);

  // final User user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: '#f5f5f0'.toColor(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: '#537979'.toColor(),
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              'Profile',
              style: GoogleFonts.prozaLibre(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          PopupMenuButton<IconMenu>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            icon: const Icon(Icons.dehaze_sharp),
            onSelected: (value) {
              switch (value) {
                case IconsMenu.logout:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LogoutPage(),
                    ),
                  );
                  break;
                case IconsMenu.settings:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                  break;
                case IconsMenu.share:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SharePage(),
                    ),
                  );
                  break;
                case IconsMenu.feedback:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SendFeedbackPage(),
                    ),
                  );
                  break;
                case IconsMenu.policy:
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage(),
                    ),
                  );
                  break;
              }
            },
            itemBuilder: (context) => IconsMenu.items
                .map((item) => PopupMenuItem<IconMenu>(
                      value: item,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(item.icon, color: '#537979'.toColor()),
                        title: Text(item.text),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
      body: const ProfileViewVol(
          // user: widget.user
          ),
    );
  }
}
