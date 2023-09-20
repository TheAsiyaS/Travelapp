import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:travelapp/Domain/HotelModel/hotel_model/hotel_model.dart';
import 'package:dartz/dartz.dart';

abstract class IhoteleRepo {
  Future<Either<mainFailure, List<HotelModel>>> getHotelDetails();
   Future<Either<mainFailure, List<HotelModel>>> getHotelDetails1();
    Future<Either<mainFailure, List<HotelModel>>> getHotelDetails2();
}