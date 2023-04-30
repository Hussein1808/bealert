

import '../Data/trip_data_data.dart';
import '../Domain/trip_data_domain.dart';

class TripsRepository {
  final TripsData _tripsData = TripsData();

  Future<void> addTrip(Trips trip) async {
    await _tripsData.addTrip(trip);
  }
  Future<List<Trips>> getTrips() async {
    return await _tripsData.getTrips();
  }
}
 
