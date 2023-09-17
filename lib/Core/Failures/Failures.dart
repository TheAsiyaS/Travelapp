import 'package:freezed_annotation/freezed_annotation.dart';
part 'Failures.freezed.dart';

@freezed
class mainFailure with _$mainFailure {
  const factory mainFailure.clientFailure() = _ClientFailure;
  const factory mainFailure.serverFailure() = _ServerFailure;

}
