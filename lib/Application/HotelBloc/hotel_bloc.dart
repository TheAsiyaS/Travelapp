import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:travelapp/Domain/Hotel_Model/Hotel_price_model.dart';
import 'package:travelapp/Domain/Hotel_Model/I_HotelModel_Service.dart';

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
             ), (result) {
        log('list $result');

        return HotelState(
            hotelModelList: [result],
            isLoading: false,
            iserror: false,
           );
      });
      emit(emitHotelresult);
    });
 
  }
}
