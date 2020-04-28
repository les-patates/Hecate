import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'waypoints.g.dart';

@JsonSerializable()
class LatLng {
  LatLng({
    this.id,
    this.lat,
    this.lng,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);
  final String id;
  final double lat;
  final double lng;
}

@JsonSerializable()
class WayPoints {
  WayPoints({
    this.waypoints,
  });

  factory WayPoints.fromJson(Map<String, dynamic> json) =>
      _$WayPointsFromJson(json);
  Map<String, dynamic> toJson() => _$WayPointsToJson(this);

  final List<LatLng> waypoints;
}

Future<WayPoints> getWayPoints() async {
  const serverURL = 'https://localhost:8000/';

  // Retrieve the locations of Google offices
  final response = await http.get(serverURL);
  if (response.statusCode == 200) {
    return WayPoints.fromJson(json.decode(response.body));
  } else {
    throw HttpException(
        'Unexpected status code ${response.statusCode}:'
        ' ${response.reasonPhrase}',
        uri: Uri.parse(serverURL));
  }
}
