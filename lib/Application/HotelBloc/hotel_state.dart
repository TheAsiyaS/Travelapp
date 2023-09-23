part of 'hotel_bloc.dart';

@freezed
class HotelState with _$HotelState {
  const factory HotelState({
    required List<HotelData> hotelModelList,
     
    required bool isLoading,
    required bool iserror,
  }) = _Initial;
  factory HotelState.initial() =>
      const HotelState(hotelModelList:[] , isLoading: false, iserror: false, );
}
