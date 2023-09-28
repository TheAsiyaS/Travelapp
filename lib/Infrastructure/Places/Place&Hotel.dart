
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:dio/dio.dart';

import 'package:travelapp/Domain/pixabayModel/I_repo_hotel_place.dart';
import 'package:travelapp/Domain/pixabayModel/piaxabay_model/piaxabay_model.dart';

@LazySingleton(as: IplaceHotelRepo)
class HotelService implements IplaceHotelRepo {
  @override
  Future<Either<mainFailure, List<PiaxabayModel>>> getHotelDetail() async {
    try {
      final unsplashresponce = await Dio().get(
          'https://pixabay.com/api/?key=29794808-de72aa3602715c0f8bc9d7224&q=hotel+bedroom+indoor&image_type=photo&pretty=true');
      // log("unsplash responce $unsplashresponce");
      if (unsplashresponce.statusCode == 200 ||
          unsplashresponce.statusCode == 201) {
        // log('responce ${unsplashresponce.data}');
        final hotelList = (unsplashresponce.data['hits'] as List).map((e) {
          return PiaxabayModel.fromJson(e);
        }).toList();

        return right(hotelList);
      } else {
        log('Server Failure');
        return left(const mainFailure.serverFailure());
      }
    } catch (e) {
      log('error $e ');
      return left(const mainFailure.clientFailure());
    }
  }

  @override
  Future<Either<mainFailure, List<PiaxabayModel>>> getPlacesDetail() async {
    try {
      final unsplashresponce = await Dio().get(
          'https://api.unsplash.com/search/photos/?client_id=mVpCHNk7WILyZxPwmlGuGfBlsnQGf_A-TrCI_v4O5tY&query=black%20bedroom');
      // log("unsplash responce $unsplashresponce");
      if (unsplashresponce.statusCode == 200 ||
          unsplashresponce.statusCode == 201) {
        final hotelList1 = (unsplashresponce.data['hits'] as List).map((e) {
          return PiaxabayModel.fromJson(e);
        }).toList();
// log('responce1 ${hotelList}');
        return right(hotelList1);
      } else {
        log('Server Failure');
        return left(const mainFailure.serverFailure());
      }
    } catch (e) {
      log('error $e ');
      return left(const mainFailure.clientFailure());
    }
  }

  @override
  Future<Either<mainFailure, List<PiaxabayModel>>> getSearchPlaceDetail(
      {required String searchQuery}) async {
    try {
      final unsplashresponce = await Dio().get(
          'https://api.unsplash.com/search/photos/?client_id=mVpCHNk7WILyZxPwmlGuGfBlsnQGf_A-TrCI_v4O5tY&query=${searchQuery}');
      // log("unsplash responce $unsplashresponce");
      if (unsplashresponce.statusCode == 200 ||
          unsplashresponce.statusCode == 201) {
        // log('responce ${unsplashresponce.data}');
        final hotelList2 = (unsplashresponce.data['hits'] as List).map((e) {
          return PiaxabayModel.fromJson(e);
        }).toList();

        return right(hotelList2);
      } else {
        log('Server Failure');
        return left(const mainFailure.serverFailure());
      }
    } catch (e) {
      log('error $e ');
      return left(const mainFailure.clientFailure());
    }
  }
  
  @override
  Future<Either<mainFailure, List<PiaxabayModel>>> advanture() {
    // TODO: implement advanture
    throw UnimplementedError();
  }
  
  @override
  Future<Either<mainFailure, List<PiaxabayModel>>> beech() {
    // TODO: implement beech
    throw UnimplementedError();
  }
  
  @override
  Future<Either<mainFailure, List<PiaxabayModel>>> cheep() {
    // TODO: implement cheep
    throw UnimplementedError();
  }
  
  @override
  Future<Either<mainFailure, List<PiaxabayModel>>> historical() {
    // TODO: implement historical
    throw UnimplementedError();
  }
  
  @override
  Future<Either<mainFailure, List<PiaxabayModel>>> mostpeoplevisit() {
    // TODO: implement mostpeoplevisit
    throw UnimplementedError();
  }
  
  @override
  Future<Either<mainFailure, List<PiaxabayModel>>> placeDetailsGet() {
    // TODO: implement placeDetailsGet
    throw UnimplementedError();
  }
  
  @override
  Future<Either<mainFailure, List<PiaxabayModel>>> popular() {
    // TODO: implement popular
    throw UnimplementedError();
  }


  
}
