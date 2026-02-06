import '../data/dummy_data.dart';
import '../models/ride/locations.dart';
import '../models/ride/ride.dart';

class RidesService {
  static List<Ride> availableRides = fakeRides; // TODO for now fake data

  //
  //  filter the rides starting from given departure location
  //
  static List<Ride> _filterByDeparture(List<Ride> rides ,Location departure) {
    return rides.where((ride) => ride.departureLocation == departure).toList();
  }

  //
  //  filter the rides starting for the given requested seat number
  //
  static List<Ride> _filterBySeatRequested(List<Ride> rides ,int requestedSeat) {
    return rides.where((ride) => ride.availableSeats >= requestedSeat).toList();
  }

  //
  //  filter the rides   with several optional criteria (flexible filter options)
  //
  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    List<Ride> results = availableRides;
    // if(departure != null){
    //   results = results.where((ride) => ride.departureLocation == departure).toList();
    // }

    // if(seatRequested != null){
    //   results = results.where((ride) => ride.availableSeats >= seatRequested).toList();
    // }

    if(departure != null) results = _filterByDeparture(results, departure);

    if(seatRequested != null) results = _filterBySeatRequested(results, seatRequested);

    return results;
  }
}
