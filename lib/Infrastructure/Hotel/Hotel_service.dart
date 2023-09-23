import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:travelapp/Core/ApiEndpoints.dart';
import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:dio/dio.dart';
import 'package:travelapp/Domain/Hotel_Model/Hotel_price_model.dart';
import 'package:travelapp/Domain/Hotel_Model/I_HotelModel_Service.dart';
import 'package:travelapp/Infrastructure/Hotel/Authentication.dart';

@LazySingleton(as: IhoteleRepo)
class HotelService implements IhoteleRepo {
  @override
  Future<Either<mainFailure, HotelData>> getHotelDetails() async {
    try {
      final authenticationsObj = Authentications();
      final token = await authenticationsObj.authenticate();
      final Response response = await Dio(BaseOptions(headers: {
        'Authorization': 'JWT $token',
      })).get(khotelApiendpoint);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.data);
        log('decode result : ${HotelData.fromJson(jsonData)}');
        return right(HotelData.fromJson(jsonData));
      } else {
        return left(const mainFailure.clientFailure());
      }
    } catch (e) {
      return left(const mainFailure.clientFailure());
    }
  }
}
