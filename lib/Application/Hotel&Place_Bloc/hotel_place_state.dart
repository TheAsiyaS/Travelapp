part of 'hotel_place_bloc.dart';

@freezed
class HotelPlaceState with _$HotelPlaceState {
 const factory HotelPlaceState({
    required List place,
      required List placesearch,
        required List hotel,
    required bool isLoading,
    required bool iserror,
  }) = _Initial;
  factory HotelPlaceState.initial() => const HotelPlaceState(
        place: [],
         placesearch: [], hotel: [],
        isLoading: false,
        iserror: false,
      );
}
