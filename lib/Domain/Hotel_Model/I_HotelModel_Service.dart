import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:dartz/dartz.dart';
import 'package:travelapp/Domain/Hotel_Model/Hotel_price_model.dart';

abstract class IhoteleRepo {
Future<Either<mainFailure, HotelData>> getHotelDetails();
  //  Future<Either<mainFailure, List<HotelModel>>> getHotelDetails1();
  //   Future<Either<mainFailure, List<HotelModel>>> getHotelDetails2();
}