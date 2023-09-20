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
      log("responce ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        final hotelList =
            (response.data['Comparison'] as List<dynamic>).map((e) {
          return HotelModel.fromJson(e);
        }).toList();
        log("result : \n$hotelList");
        return right(hotelList);
      } else {
        log('server Failure');
        return left(const mainFailure.serverFailure());
      }
    } catch (e) {
      log("error : $e");
      return left(const mainFailure.clientFailure());
    }
  }

  @override
  Future<Either<mainFailure, List<HotelModel>>> getHotelDetails1() async {
    try {
      final token = await authenticate();
      final Response response = await Dio(BaseOptions(headers: {
        'Authorization': 'JWT $token',
      })).get(khotelApiendpoint);

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('responce2 ${response.data}');
        final hotelList =
            (response.data['Comparison'] as List<dynamic>).map((e) {
          return HotelModel.fromJson(e);
        }).toList();
        log("result : \n$hotelList");
        return right(hotelList);
      } else {
        log('server Failure');
        return left(const mainFailure.serverFailure());
      }
    } catch (e) {
      log("error : $e");
      return left(const mainFailure.clientFailure());
    }
  }

  @override
  Future<Either<mainFailure, List<HotelModel>>> getHotelDetails2() async {
    try {
      final token = await authenticate();
      final Response response = await Dio(BaseOptions(headers: {
        'Authorization': 'JWT $token',
      })).get(khotelApiendpoint);

      if (response.statusCode == 200 || response.statusCode == 201) {
        log('responce2 ${response.data}');
        final hotelList =
            (response.data['Comparison'] as List<dynamic>).map((e) {
          return HotelModel.fromJson(e);
        }).toList();
        log("result : \n$hotelList");
        return right(hotelList);
      } else {
        log('server Failure');
        return left(const mainFailure.serverFailure());
      }
    } catch (e) {
      log("error : $e");
      return left(const mainFailure.clientFailure());
    }
  }
}
