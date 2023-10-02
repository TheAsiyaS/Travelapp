part of 'hotel_bloc.dart';

@freezed
class HotelState with _$HotelState {
  const factory HotelState({
    required List<UnsplashSearch> hotelModelList,
    required List<UnsplashSearch> hotelModelList1,
    required List<UnsplashSearch> hotelModelList2,
        required List<PiaxabayModel> cheep,
            required List<PiaxabayModel> advanture,
    required bool isLoading,
    required bool iserror,
  }) = _Initial;
  factory HotelState.initial() => const HotelState(
        hotelModelList: [],
        hotelModelList1: [],
        hotelModelList2: [],
        isLoading: false,
        iserror: false, advanture: [], cheep: [],
      );
}
