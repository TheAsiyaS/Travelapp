import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:travelapp/Domain/UnsplashSearch/I_Hotel1.dart';
import 'package:travelapp/Domain/UnsplashSearch/unsplash_search/unsplash_search.dart';

part 'hotel1_event.dart';
part 'hotel1_state.dart';
part 'hotel1_bloc.freezed.dart';

@injectable
class Hotel1Bloc extends Bloc<Hotel1Event, Hotel1State> {
  final Ihotel1eRepo objIrepoHotel;
  Hotel1Bloc(this.objIrepoHotel) : super(Hotel1State.initial()) {
    on<_Hotel1DetailsGet>((event, emit) async {
      final resultHotel = await objIrepoHotel.getHotel1Details();
      final emitHotelresult = resultHotel.fold(
          (mainFailure fail) => const Hotel1State(
                hotelModelList: [],
                isLoading: false,
                iserror: true,
              ), (result) {
        return Hotel1State(
          hotelModelList: result,
          isLoading: false,
          iserror: false,
        );
      });
      emit(emitHotelresult);
    });
  }
}
