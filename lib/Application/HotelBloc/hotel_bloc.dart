import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:travelapp/Domain/HotelModel/I_HotelModel_Service.dart';
import 'package:travelapp/Domain/UnsplashSearch/unsplash_search/unsplash_search.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';
part 'hotel_bloc.freezed.dart';

@injectable
class HotelBloc extends Bloc<HotelEvent, HotelState> {
  final IhoteleRepo objIrepoHotel;
  HotelBloc(this.objIrepoHotel) : super(HotelState.initial()) {
    on<_HotelDetailsGet>((event, emit) async {
      final resultHotel =
          await objIrepoHotel.getHotelDetails(querry: event.querry);
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelState(
                hotelModelList: [],
                hotelModelList1: [],
                hotelModelList2: [],
                isLoading: false,
                iserror: true,
              ), (result) {
        return HotelState(
          hotelModelList: result,
          hotelModelList1: [],
          hotelModelList2: [],
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });
    on<_HotelDetailsGet1>((event, emit) async {
      final resultHotel =
          await objIrepoHotel.getHotelDetails(querry: event.querry);
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelState(
                hotelModelList1: [],
                hotelModelList2: [],
                hotelModelList: [],
                isLoading: false,
                iserror: true,
              ), (result) {
        return HotelState(
          hotelModelList: [],
          hotelModelList2: [],
          hotelModelList1: result,
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });
    on<_HotelDetailsGet2>((event, emit) async {
      final resultHotel =
          await objIrepoHotel.getHotelDetails(querry: event.querry);
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelState(
                hotelModelList1: [],
                hotelModelList2: [],
                hotelModelList: [],
                isLoading: false,
                iserror: true,
              ), (result) {
        return HotelState(
          hotelModelList1: [],
          hotelModelList: [],
          hotelModelList2: result,
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });
  }
}
