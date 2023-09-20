import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:travelapp/Domain/HotelModel/I_HotelModel_Service.dart';
import 'package:travelapp/Domain/HotelModel/hotel_model/hotel_model.dart';

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
            isLoading: false,
            iserror: true,
            hotelModelList1: [],
            hotelModelList2: []),
        (result) => HotelState(
            hotelModelList: result,
            isLoading: false,
            iserror: false,
            hotelModelList1: [],
            hotelModelList2: []),
      );
      emit(emitHotelresult);
    });
    on<_HotelDetailsGet1>((event, emit) async {
      final resultHotel = await objIrepoHotel.getHotelDetails();
      final emitHotelresult = resultHotel.fold(
        (mainFailure fail) => const HotelState(
            hotelModelList: [],
            isLoading: false,
            iserror: true,
            hotelModelList1: [],
            hotelModelList2: []),
        (result) => HotelState(
            hotelModelList: [],
            isLoading: false,
            iserror: false,
            hotelModelList1: result,
            hotelModelList2: []),
      );
      emit(emitHotelresult);
    });
    on<_HotelDetailsGet2>((event, emit) async {
      final resultHotel = await objIrepoHotel.getHotelDetails();
      final emitHotelresult = resultHotel.fold(
        (mainFailure fail) => const HotelState(
            hotelModelList: [],
            isLoading: false,
            iserror: true,
            hotelModelList1: [],
            hotelModelList2: []),
        (result) => HotelState(
            hotelModelList: [],
            isLoading: false,
            iserror: false,
            hotelModelList1: [],
            hotelModelList2: result),
      );
      emit(emitHotelresult);
    });
  }
}
