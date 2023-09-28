import 'package:dartz/dartz.dart';
import 'package:travelapp/Domain/pixabayModel/piaxabay_model/piaxabay_model.dart';

import '../../Core/Failures/Failures.dart';

abstract class IplaceHotelRepo {
  Future<Either<mainFailure, List<PiaxabayModel>>> getHotelDetail();
  Future<Either<mainFailure, List<PiaxabayModel>>> getPlacesDetail();
  Future<Either<mainFailure, List<PiaxabayModel>>> popular();
  Future<Either<mainFailure, List<PiaxabayModel>>> cheep();
  Future<Either<mainFailure, List<PiaxabayModel>>> mostpeoplevisit();
  Future<Either<mainFailure, List<PiaxabayModel>>> advanture();
  Future<Either<mainFailure, List<PiaxabayModel>>> historical();
  Future<Either<mainFailure, List<PiaxabayModel>>> beech();

  Future<Either<mainFailure, List<PiaxabayModel>>> getSearchPlaceDetail(
      {required String searchQuery});
}
