import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:travelapp/Domain/pixabayModel/I_repo_hotel_place.dart';
import 'package:travelapp/Domain/pixabayModel/piaxabay_model/piaxabay_model.dart';

part 'hotel_place_event.dart';
part 'hotel_place_state.dart';
part 'hotel_place_bloc.freezed.dart';

@injectable
class HotelPlaceBloc extends Bloc<HotelPlaceEvent, HotelPlaceState> {
  final IplaceHotelRepo objIplaceHotelRepo;

  HotelPlaceBloc(this.objIplaceHotelRepo) : super(HotelPlaceState.initial()) {
    on<_HotelDetailsGet>((event, emit) async {
      final resultHotel = await objIplaceHotelRepo.getHotelDetail();
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelPlaceState(
              popular: [],
              advanture: [],
              beach: [],
              historical: [],
              mostpeoplevist: [],
              cheap: [],
              place: [],
              placesearch: [],
              hotel: [],
              isLoading: false,
              iserror: false), (result) {
        return HotelPlaceState(
          popular: [],
          advanture: [],
          beach: [],
          historical: [],
          mostpeoplevist: [],
          cheap: [],
          place: [],
          placesearch: [],
          hotel: result,
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });

    on<_PlaceDetailsGet>((event, emit) async {
      final resultHotel = await objIplaceHotelRepo.getPlacesDetail();
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelPlaceState(
              popular: [],
              advanture: [],
              beach: [],
              historical: [],
              mostpeoplevist: [],
              cheap: [],
              place: [],
              placesearch: [],
              hotel: [],
              isLoading: false,
              iserror: false), (result) {
        return HotelPlaceState(
          popular: [],
          advanture: [],
          beach: [],
          historical: [],
          mostpeoplevist: [],
          cheap: [],
          place: result,
          placesearch: [],
          hotel: [],
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });
    on<_Popular>((event, emit) async {
      final resultHotel = await objIplaceHotelRepo.popular();
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelPlaceState(
              popular: [],
              advanture: [],
              beach: [],
              historical: [],
              mostpeoplevist: [],
              cheap: [],
              place: [],
              placesearch: [],
              hotel: [],
              isLoading: false,
              iserror: false), (result) {
        return HotelPlaceState(
          popular: result,
          advanture: [],
          beach: [],
          historical: [],
          mostpeoplevist: [],
          cheap: [],
          place: [],
          placesearch: [],
          hotel: [],
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });
    on<_Cheep>((event, emit) async {
      final resultHotel = await objIplaceHotelRepo.cheep();
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelPlaceState(
              popular: [],
              advanture: [],
              beach: [],
              historical: [],
              mostpeoplevist: [],
              cheap: [],
              place: [],
              placesearch: [],
              hotel: [],
              isLoading: false,
              iserror: false), (result) {
        return HotelPlaceState(
          popular: [],
          advanture: [],
          beach: [],
          historical: [],
          mostpeoplevist: [],
          cheap:result,
          place: [],
          placesearch: [],
          hotel: [],
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });
    on<_Mostpeoplevisit>((event, emit) async {
      final resultHotel = await objIplaceHotelRepo.mostpeoplevisit();
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelPlaceState(
              popular: [],
              advanture: [],
              beach: [],
              historical: [],
              mostpeoplevist: [],
              cheap: [],
              place: [],
              placesearch: [],
              hotel: [],
              isLoading: false,
              iserror: false), (result) {
        return HotelPlaceState(
          popular: [],
          advanture: [],
          beach: [],
          historical: [],
          mostpeoplevist: result,
          cheap: [],
          place: [],
          placesearch: [],
          hotel: [],
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });
    on<_Advanture>((event, emit) async {
      final resultHotel = await objIplaceHotelRepo.advanture();
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelPlaceState(
              popular: [],
              advanture: [],
              beach: [],
              historical: [],
              mostpeoplevist: [],
              cheap: [],
              place: [],
              placesearch: [],
              hotel: [],
              isLoading: false,
              iserror: false), (result) {
        return HotelPlaceState(
          popular: [],
          advanture: result,
          beach: [],
          historical: [],
          mostpeoplevist: [],
          cheap: [],
          place: [],
          placesearch: [],
          hotel: [],
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });
    on<_Historical>((event, emit) async {
      final resultHotel = await objIplaceHotelRepo.historical();
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelPlaceState(
              popular: [],
              advanture: [],
              beach: [],
              historical: [],
              mostpeoplevist: [],
              cheap: [],
              place: [],
              placesearch: [],
              hotel: [],
              isLoading: false,
              iserror: false), (result) {
        return HotelPlaceState(
          popular: [],
          advanture: [],
          beach: [],
          historical: result,
          mostpeoplevist: [],
          cheap: [],
          place: [],
          placesearch: [],
          hotel: [],
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });
    on<_Beach>((event, emit) async {
      final resultHotel = await objIplaceHotelRepo.beach();
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelPlaceState(
              popular: [],
              advanture: [],
              beach: [],
              historical: [],
              mostpeoplevist: [],
              cheap: [],
              place: [],
              placesearch: [],
              hotel: [],
              isLoading: false,
              iserror: false), (result) {
        return HotelPlaceState(
          popular: [],
          advanture: [],
          beach: result,
          historical: [],
          mostpeoplevist: [],
          cheap: [],
          place: [],
          placesearch: [],
          hotel: [],
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });
    on<_GetSearchPlaceDetails>((event, emit) async {
      final resultHotel = await objIplaceHotelRepo.getSearchPlaceDetail(
          searchQuery: event.searchQuery);
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelPlaceState(
              popular: [],
              advanture: [],
              beach: [],
              historical: [],
              mostpeoplevist: [],
              cheap: [],
              place: [],
              placesearch: [],
              hotel: [],
              isLoading: false,
              iserror: false), (result) {
        return HotelPlaceState(
          popular: [],
          advanture: [],
          beach: [],
          historical: [],
          mostpeoplevist: [],
          cheap: [],
          place: [],
          placesearch: result,
          hotel: [],
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });
  }
}
