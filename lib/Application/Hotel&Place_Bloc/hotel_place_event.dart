part of 'hotel_place_bloc.dart';

@freezed
class HotelPlaceEvent with _$HotelPlaceEvent {
  const factory HotelPlaceEvent.hotelDetailsGet() = _HotelDetailsGet;
  const factory HotelPlaceEvent.popular() = _Popular;
  const factory HotelPlaceEvent.cheep() = _Cheep;
  const factory HotelPlaceEvent.mostpeoplevisit() = _Mostpeoplevisit;
  const factory HotelPlaceEvent.advanture() = _Advanture;
  const factory HotelPlaceEvent.historical() = _Historical;
  const factory HotelPlaceEvent.placeDetailsGet() = _PlaceDetailsGet;
  const factory HotelPlaceEvent.beach() = _Beach;
  const factory HotelPlaceEvent.getSearchPlaceDetails(
      {required String searchQuery}) = _GetSearchPlaceDetails;

 
}
                