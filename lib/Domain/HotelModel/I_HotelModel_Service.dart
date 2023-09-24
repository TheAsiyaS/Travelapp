import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:travelapp/Domain/UnsplashSearch/unsplash_search/unsplash_search.dart';


abstract class IhoteleRepo {
  Future<Either<mainFailure, List<UnsplashSearch>>> getHotelDetails({required String querry});
  //  Future<Either<mainFailure, List<HotelModel>>> getHotelDetails1();
  //   Future<Either<mainFailure, List<HotelModel>>> getHotelDetails2();
}
