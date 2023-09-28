import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travelapp/Domain/pixabayModel/piaxabay_model/piaxabay_model.dart';

part 'hotel_place_event.dart';
part 'hotel_place_state.dart';
part 'hotel_place_bloc.freezed.dart';

@injectable
class HotelPlaceBloc extends Bloc<HotelPlaceEvent, HotelPlaceState> {
  HotelPlaceBloc() : super(HotelPlaceState.initial()) {
    on<HotelPlaceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
  