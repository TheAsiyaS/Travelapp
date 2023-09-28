part of 'hotel_place_bloc.dart';

@freezed
class HotelPlaceEvent with _$HotelPlaceEvent {
  const factory HotelPlaceEvent.hotelDetailsGet() = _HotelDetailsGet;
  const factory HotelPlaceEvent.popular() = _PlaceDetailsGet;
  const factory HotelPlaceEvent.cheep() = _PlaceDetailsGet;
  const factory HotelPlaceEvent.mostpeoplevisit() = _PlaceDetailsGet;
  const factory HotelPlaceEvent.advanture() = _PlaceDetailsGet;
  const factory HotelPlaceEvent.historical() = _PlaceDetailsGet;
  const factory HotelPlaceEvent.placeDetailsGet() = _PlaceDetailsGet;
  const factory HotelPlaceEvent.beach() = _PlaceDetailsGet;
    const factory HotelPlaceEvent.getSearchPlaceDetails({required String searchQuery}) = _PlaceDetailsGet;

  const factory HotelPlaceEvent.placeSearchDetailsGet() =
      _PlaceSearchDetailsGet;
}
