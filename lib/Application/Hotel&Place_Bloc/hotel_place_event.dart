part of 'hotel_place_bloc.dart';

@freezed
class HotelPlaceEvent with _$HotelPlaceEvent {
  const factory HotelPlaceEvent.hotelDetailsGet() = _HotelDetailsGet;
  const factory HotelPlaceEvent.placeDetailsGet() = _PlaceDetailsGet;
  const factory HotelPlaceEvent.placeSearchDetailsGet() =
      _PlaceSearchDetailsGet;
}
