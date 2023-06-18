import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../History/Widgets/list_tile_history.dart';
import '../../Record/Domain/noti_domain.dart';
import '../../Record/Repository/noti_data_repository.dart';
import 'noti_tiles.dart';

class Notii extends StatefulWidget {
  const Notii({super.key});

  @override
  State<Notii> createState() => _NotiiState();
}

class _NotiiState extends State<Notii> {
  final NotificationsRepository _repository = NotificationsRepository();
  List<Notifications> _notifications = [];
  @override
  void initState() {
    super.initState();
  }

  Future<void> getNotification() async {
    final notifications = await _repository.getNotification();
    setState(() {
      _notifications = notifications;
    });
  }

  @override
  Widget build(BuildContext context) {
    //* Screen size
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Notifications',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: screenwidth * 0.06),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () {
            GoRouter.of(context).go('/home/4');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Notifications>>(
          future: _repository.getNotification(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              _notifications = snapshot.data!;
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: NotiTiles(
                      date: snapshot.data![index].date,
                      tripid: snapshot.data![index].tripId,
                      info: snapshot.data![index].info,
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error ${snapshot.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
