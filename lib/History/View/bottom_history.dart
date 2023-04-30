import 'package:bealert/History/Data/tiles_data.dart';
import 'package:flutter/material.dart';
import '../../Record/Domain/trip_data_domain.dart';
import '../../Record/Repository/trip_data_repo.dart';
import '../Widgets/list_tile_history.dart';

class BottomHistory extends StatefulWidget {
  const BottomHistory({super.key});

  @override
  State<BottomHistory> createState() => _BottomHistoryState();
}

class _BottomHistoryState extends State<BottomHistory> {
  final TripsRepository _repository = TripsRepository();
  List<Trips> _trips = [];
  @override
  void initState() {
    super.initState();
  }

  Future<void> _getTrips() async {
    final trips = await _repository.getTrips();
    setState(() {
      _trips = trips;
    });
  }

  @override
  Widget build(BuildContext context) {
    //* Screen size

    return FutureBuilder<List<Trips>>(
      future: _repository.getTrips(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _trips = snapshot.data!;
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: HistoryListTilee(
                  date: snapshot.data![index].date,
                  distance: snapshot.data![index].distance,
                  drowsinesstimes: snapshot.data![index].drowsinesstimes,
                  time: snapshot.data![index].time,
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
    );
  }
}
