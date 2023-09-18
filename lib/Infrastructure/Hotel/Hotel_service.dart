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
}
/*

  Future<Either<mainFailure, List<Map<String, dynamic>>>> getplaylistoverview(
      List<String> playListIds) async {
    final access_token = await getSpotifyAccessToken();

    final List<Map<String, dynamic>> playlistcommon = [];
    final dio = Dio();
    for (final playlistId in playListIds) {
      final String url = 'https://api.spotify.com/v1/playlists/$playlistId';
      final Map<String, String> headers = {
        'Authorization': 'Bearer $access_token'
      };

      try {
        final response = await dio.get(
          url,
          options: Options(headers: headers),
        );

        if (response.statusCode == 200) {
          playlistcommon.add({
            'name': response.data['name'],
            'description': response.data['description'],
            'images': response.data['images'][0]['url'],
            'id': response.data['id'],
          });
          //log('length : ${response.data['name']}');
        } else {
          return left(const mainFailure.clientFailure());
        }
      } catch (e) {
        return left(const mainFailure.serverFailure());
      }
    }

    return right(playlistcommon);
  }
 */