part of 'hotel1_bloc.dart';

@freezed
class Hotel1State with _$Hotel1State {
  const factory Hotel1State({
    required List<UnsplashSearch> hotelModelList,
    required bool isLoading,
    required bool iserror,
  }) = _Initial;
  factory Hotel1State.initial() => const Hotel1State(
        hotelModelList: [],
        isLoading: false,
        iserror: false,
      );
}
