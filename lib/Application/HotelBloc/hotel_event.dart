part of 'hotel_bloc.dart';

@freezed
class HotelEvent with _$HotelEvent {
  const factory HotelEvent.hotelDetailsGet() = _HotelDetailsGet;
  const factory HotelEvent.hotelDetailsGet1() = _HotelDetailsGet1;
  const factory HotelEvent.hotelDetailsGet2({required String querry2}) =
      _HotelDetailsGet2;
      const factory HotelEvent.cheap() = _Cheap;
      const factory HotelEvent.advanture() = _Advanture;
}
