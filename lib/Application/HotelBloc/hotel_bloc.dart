import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:travelapp/Domain/UnsplashSearch/I_HotelModel_Service.dart';
import 'package:travelapp/Domain/UnsplashSearch/unsplash_search/unsplash_search.dart';
import 'package:travelapp/Domain/pixabayModel/piaxabay_model/piaxabay_model.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';
part 'hotel_bloc.freezed.dart';

@injectable
class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final IhoteleRepo objIrepoHotel;
  HotelBloc(this.objIrepoHotel) : super(HotelState.initial()) {
    on<_HotelDetailsGet>((event, emit) async {
      final resultHotel = await objIrepoHotel.getHotelDetails();
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelState(
                hotelModelList: [],
                hotelModelList1: [],
                hotelModelList2: [],
                isLoading: false,
                iserror: true,
                advanture: [],
                cheep: [],
              ), (result) {
        return HotelState(
          hotelModelList: result,
          hotelModelList1: [],
          hotelModelList2: [],
          isLoading: false,
          iserror: false,
          advanture: [],
          cheep: [],
        );
      });
      emit(emitHotelresult);
    });
    on<_HotelDetailsGet1>((event, emit) async {
      final resultHotel = await objIrepoHotel.getHotelDetails1();
      final emitHotelresult1 = resultHotel.fold(
          (mainFailure fail) => const HotelState(
                hotelModelList1: [],
                hotelModelList2: [],
                hotelModelList: [],
                isLoading: false,
                iserror: true,
                advanture: [],
                cheep: [],
              ), (result1) {
        return HotelState(
          hotelModelList: [],
          hotelModelList2: [],
          hotelModelList1: result1,
          isLoading: false,
          iserror: false,
          advanture: [],
          cheep: [],
        );
      });
      emit(emitHotelresult1);
    });
    on<_HotelDetailsGet2>((event, emit) async {
      final resultHotel =
          await objIrepoHotel.getHotelDetails2(querry2: event.querry2);
      final emitHotelresult2 = resultHotel.fold(
          (mainFailure fail) => const HotelState(
                hotelModelList1: [],
                hotelModelList2: [],
                hotelModelList: [],
                isLoading: false,
                iserror: true,
                advanture: [],
                cheep: [],
              ), (result2) {
        return HotelState(
          hotelModelList1: [],
          hotelModelList: [],
          hotelModelList2: result2,
          isLoading: false,
          iserror: false,
          advanture: [],
          cheep: [],
        );
      });
      emit(emitHotelresult2);
    });
    on<_Cheap>((event, emit) async {
      final resultHotel = await objIrepoHotel.cheap();
      final emitHotelresult2 = resultHotel.fold(
          (mainFailure fail) => const HotelState(
                hotelModelList1: [],
                hotelModelList2: [],
                hotelModelList: [],
                isLoading: false,
                iserror: true,
                advanture: [],
                cheep: [],
              ), (result2) {
        return HotelState(
          hotelModelList1: [],
          hotelModelList: [],
          hotelModelList2: [],
          isLoading: false,
          iserror: false,
          advanture: [],
          cheep: result2,
        );
      });
      emit(emitHotelresult2);
    });
    on<_Advanture>((event, emit) async {
      final resultHotel = await objIrepoHotel.advanture();
      final emitHotelresult2 = resultHotel.fold(
          (mainFailure fail) => const HotelState(
                hotelModelList1: [],
                hotelModelList2: [],
                hotelModelList: [],
                isLoading: false,
                iserror: true,
                advanture: [],
                cheep: [],
              ), (result2) {
        return HotelState(
          hotelModelList1: [],
          hotelModelList: [],
          hotelModelList2: [],
          isLoading: false,
          iserror: false,
          advanture: result2,
          cheep: [],
        );
      });
      emit(emitHotelresult2);
    });
  }
}
