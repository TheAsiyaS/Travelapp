import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:travelapp/Core/Failures/Failures.dart';
import 'package:dio/dio.dart';
import 'package:travelapp/Domain/UnsplashSearch/I_HotelModel_Service.dart';

import 'package:travelapp/Domain/UnsplashSearch/unsplash_search/unsplash_search.dart';

@LazySingleton(as: IhoteleRepo)
class HotelService implements IhoteleRepo {
  @override
  Future<Either<mainFailure, List<UnsplashSearch>>> getHotelDetails() async {
    try {
      final unsplashresponce = await Dio().get(
          'https://api.unsplash.com/search/photos/?client_id=mVpCHNk7WILyZxPwmlGuGfBlsnQGf_A-TrCI_v4O5tY&query=black%20bedroom');
      // log("unsplash responce $unsplashresponce");
      if (unsplashresponce.statusCode == 200 ||
          unsplashresponce.statusCode == 201) {
        // log('responce ${unsplashresponce.data}');
        final hotelList = (unsplashresponce.data['results'] as List).map((e) {
          return UnsplashSearch.fromJson(e);
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
  Future<Either<mainFailure, List<UnsplashSearch>>> getHotelDetails1() async {
    try {
      final unsplashresponce = await Dio().get(
          'https://api.unsplash.com/search/photos/?client_id=mVpCHNk7WILyZxPwmlGuGfBlsnQGf_A-TrCI_v4O5tY&query=black%20bedroom');
      // log("unsplash responce $unsplashresponce");
      if (unsplashresponce.statusCode == 200 ||
          unsplashresponce.statusCode == 201) {
        final hotelList1 = (unsplashresponce.data['results'] as List).map((e) {
          return UnsplashSearch.fromJson(e);
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
  Future<Either<mainFailure, List<UnsplashSearch>>> getHotelDetails2(
      {required String querry2}) async {
    try {
      final unsplashresponce = await Dio().get(
          'https://api.unsplash.com/search/photos/?client_id=mVpCHNk7WILyZxPwmlGuGfBlsnQGf_A-TrCI_v4O5tY&query=${querry2}');
      // log("unsplash responce $unsplashresponce");
      if (unsplashresponce.statusCode == 200 ||
          unsplashresponce.statusCode == 201) {
        // log('responce ${unsplashresponce.data}');
        final hotelList2 = (unsplashresponce.data['results'] as List).map((e) {
          return UnsplashSearch.fromJson(e);
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
}
