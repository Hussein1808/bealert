import 'package:unicons/unicons.dart';

import '../Domain/tiles_domain.dart';

final List<Tile> tiles = [
  Tile(
    title: 'Edit Profile',
    icon: UniconsLine.user,
    redirection: '/editprofile_page',
  ),
  Tile(
    title: 'Notifications',
    icon: UniconsLine.bell,
    redirection: '/notification_page',
  ),
  Tile(
    title: 'About',
    icon: UniconsLine.info_circle,
    redirection: '/editprofile_page',
  ),
];
