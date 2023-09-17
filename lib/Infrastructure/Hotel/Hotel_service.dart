import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:travelapp/Core/ApiEndpoints.dart';
import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:travelapp/Domain/HotelModel/I_HotelModel_Service.dart';
import 'package:dio/dio.dart';
import 'package:travelapp/Domain/HotelModel/hotel_model/hotel_model.dart';
import 'package:travelapp/Infrastructure/Hotel/Authentication.dart';

@LazySingleton(as: IhoteleRepo)
class HotelService implements IhoteleRepo {
  @override
  Future<Either<mainFailure, List<HotelModel>>> getHotelDetails() async {
    try {
      final token = await authenticate();
      final Response response = await Dio(BaseOptions(headers: {
        'Authorization': 'JWT $token',
      })).get(khotelApiendpoint);
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final hotelList = (response.data['comparison'] as List).map((e) {
          return HotelModel.fromJson(e);
        }).toList();
        log("result : \n$hotelList");
        return right(hotelList);
      } else {
        log('server Failure');
        return left(const mainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return left(const mainFailure.clientFailure());
    }
  }
}
