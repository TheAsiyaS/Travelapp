part of 'hotel_bloc.dart';

@freezed
class HotelEvent with _$HotelEvent {
  const factory HotelEvent.hotelDetailsGet({required String querry}) = _HotelDetailsGet;
  const factory HotelEvent.hotelDetailsGet1() = _HotelDetailsGet1;
  const factory HotelEvent.hotelDetailsGet2() = _HotelDetailsGet2;
}
