import 'package:flutter/material.dart';

class IconsMenu {
  static const items = <IconMenu>[
    logout,
    settings,
    // notifications,
    // language,
    share,
    feedback,
    // moon,
    policy,
  ];

  static const logout = IconMenu(
    text: 'Log out',
    icon: Icons.logout,
  );

  static const settings = IconMenu(
    text: 'Settings',
    icon: Icons.settings,
  );

  // static const notifications = IconMenu(
  //   text: 'Notifications',
  //   icon: Icons.notifications,
  // );

  //   static const language = IconMenu(
  //   text: 'Language',
  //   icon: FontAwesomeIcons.language,
  // );

  static const share = IconMenu(
    text: 'Share',
    icon: Icons.share,
  );

  static const feedback = IconMenu(
    text: 'Send feedback',
    icon: Icons.feedback,
  );

  // static const moon = IconMenu(
  //   text: 'Dark mode',
  //   icon: FontAwesomeIcons.moon,
  // );

  static const policy = IconMenu(
    text: 'Privacy Policy',
    icon: Icons.policy_rounded,
  );
}

class IconMenu {
  final String text;
  final IconData icon;

  const IconMenu({
    required this.text,
    required this.icon,
  });
}
