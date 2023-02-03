import 'package:flutter/widgets.dart';
import 'package:unicons/unicons.dart';

import '../Domain/tiles_domain.dart';

// List<String> tiles = [
//   'Edit Profile',
//   'Notifications',
//   'Clear History',
//   'About',
//   'Logout'
// ];
// List<IconData> icons = [
//   UniconsLine.user,
//   UniconsLine.bell,
//   UniconsLine.trash,
//   UniconsLine.info_circle,
//   UniconsLine.sign_out_alt
// ];
final List<Tile> tiles = [
  Tile(
    title: 'Edit Profile',
    icon: UniconsLine.user,
    redirection: 'settings/edit_profile',
  ),
  Tile(
    title: 'Notifications',
    icon: UniconsLine.bell,
    redirection: 'settings/notifications',
  ),
  Tile(
    title: 'Clear History',
    icon: UniconsLine.trash,
    redirection: 'settings/clear_history',
  ),
  Tile(
    title: 'About',
    icon: UniconsLine.info_circle,
    redirection: 'settings/about',
  ),
  Tile(
    title: 'Logout',
    icon: UniconsLine.sign_out_alt,
    redirection: 'settings/logout',
  ),
];
