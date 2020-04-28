// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waypoints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatLng _$LatLngFromJson(Map<String, dynamic> json) {
  return LatLng(
      id: json['id'] as String,
      lat: (json['lat'] as num)?.toDouble(),
      lng: (json['lng'] as num)?.toDouble());
}

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lng': instance.lng
    };

WayPoints _$WayPointsFromJson(Map<String, dynamic> json) {
  return WayPoints(
      waypoints: (json['waypoints'] as List)
          ?.map((e) =>
              e == null ? null : LatLng.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$WayPointsToJson(WayPoints instance) =>
    <String, dynamic>{'waypoints': instance.waypoints};
