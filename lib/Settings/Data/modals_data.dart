import 'package:unicons/unicons.dart';

import '../Domain/modals_domain.dart';

final List<Modal> modals = [
  Modal(
    title: 'Clear History',
    icon: UniconsLine.trash,
    redirection: '/clearhistory_page',
    mtitle:'Clear History',
    mtext:'Are you sure you want to clear history?'

  ),
  Modal(
    title: 'logout',
    icon: UniconsLine.sign_out_alt,
    redirection: '/clearhistory_page',
    mtitle:'Logout',
    mtext:'Are you sure you want to logout?',
  ),
];
