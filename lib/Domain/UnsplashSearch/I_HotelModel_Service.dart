import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:travelapp/Domain/UnsplashSearch/unsplash_search/unsplash_search.dart';


abstract class IhoteleRepo {
  Future<Either<mainFailure, List<UnsplashSearch>>> getHotelDetails();
   Future<Either<mainFailure, List<UnsplashSearch>>> getHotelDetails1();
    Future<Either<mainFailure, List<UnsplashSearch>>> getHotelDetails2({required String querry2});
}
