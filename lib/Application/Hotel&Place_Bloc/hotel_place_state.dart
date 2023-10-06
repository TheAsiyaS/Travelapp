part of 'hotel_place_bloc.dart';

@freezed
class HotelPlaceState with _$HotelPlaceState {
  const factory HotelPlaceState({
    required List<PiaxabayModel> popular,
    required List<PiaxabayModel> advanture,
    required List<PiaxabayModel> beach,
    required List<PiaxabayModel> historical,
    required List<PiaxabayModel> mostpeoplevist,
    required List<PiaxabayModel> cheap,
    required List<PiaxabayModel> place,
    required List<PiaxabayModel> placesearch,
    required List<PiaxabayModel> hotel,

    required bool isLoading,
    required bool iserror,
  }) = _Initial;
  factory HotelPlaceState.initial() => const HotelPlaceState(
        place: [],
        placesearch: [],
        hotel: [],
        isLoading: false,
        iserror: false,
        advanture: [],
        beach: [],
        cheap: [],
        historical: [],
        mostpeoplevist: [],
        popular: [],
      );
}
