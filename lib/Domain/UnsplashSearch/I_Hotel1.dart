import 'package:dartz/dartz.dart';
import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:travelapp/Domain/UnsplashSearch/unsplash_search/unsplash_search.dart';

abstract class Ihotel1eRepo {
  Future<Either<mainFailure, List<UnsplashSearch>>> getHotel1Details();
}
