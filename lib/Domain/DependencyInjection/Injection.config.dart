// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../Application/Hotel&Place_Bloc/hotel_place_bloc.dart' as _i11;
import '../../Application/Hotel1_Bloc/hotel1_bloc.dart' as _i9;
import '../../Application/HotelBloc/hotel_bloc.dart' as _i10;
import '../../Infrastructure/Hotel/hotel1_service.dart' as _i4;
import '../../Infrastructure/Hotel/Hotel_service.dart' as _i6;
import '../../Infrastructure/Places/Place&Hotel.dart' as _i8;
import '../pixabayModel/I_repo_hotel_place.dart' as _i7;
import '../UnsplashSearch/I_Hotel1.dart' as _i3;
import '../UnsplashSearch/I_HotelModel_Service.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.Ihotel1eRepo>(() => _i4.HotelService());
  gh.lazySingleton<_i5.IhoteleRepo>(() => _i6.HotelService());
  gh.lazySingleton<_i7.IplaceHotelRepo>(() => _i8.HotelService());
  gh.factory<_i9.Hotel1Bloc>(() => _i9.Hotel1Bloc(get<_i3.Ihotel1eRepo>()));
  gh.factory<_i10.HotelBloc>(() => _i10.HotelBloc(get<_i5.IhoteleRepo>()));
  gh.factory<_i11.HotelPlaceBloc>(
      () => _i11.HotelPlaceBloc(get<_i7.IplaceHotelRepo>()));
  return get;
}
