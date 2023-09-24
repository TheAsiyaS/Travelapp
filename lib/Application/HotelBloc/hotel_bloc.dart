
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
      final resultHotel = await objIrepoHotel.getHotelDetails(querry:event.querry);
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const HotelState(
                hotelModelList: [],
                isLoading: false,
                iserror: true,
              ), (result) {
       

        return HotelState(
          hotelModelList: result,
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });
  }
}
