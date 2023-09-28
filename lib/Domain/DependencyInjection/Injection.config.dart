// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../Application/Hotel1/hotel1_bloc.dart' as _i7;
import '../../Application/HotelBloc/hotel_bloc.dart' as _i8;
import '../../Infrastructure/Hotel/hotel1_service.dart' as _i4;
import '../../Infrastructure/Hotel/Hotel_service.dart' as _i6;
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
  gh.factory<_i7.Hotel1Bloc>(() => _i7.Hotel1Bloc(get<_i3.Ihotel1eRepo>()));
  gh.factory<_i8.HotelBloc>(() => _i8.HotelBloc(get<_i5.IhoteleRepo>()));
  return get;
}
