import 'package:chaloapp/screen/ticket_booking/data/flights_data.dart';
import 'package:chaloapp/screen/ticket_booking/models/flight_model.dart';

final List<FlightModel> flightsAvailable = flightsAvailableJson
    .asMap()
    .map((index, value) =>
        MapEntry(index, FlightModel.fromMap(flightsAvailableJson[index])))
    .values
    .toList();
