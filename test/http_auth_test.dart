import 'package:flutter_test/flutter_test.dart';
import 'package:travelapp/Infrastructure/Hotel/Authentication.dart';
import 'package:travelapp/Infrastructure/Hotel/Hotel_service.dart';

void main() {
  group('Testing App Provider', () {
    test('Authecation of Hotel', () async {
      final authenticationsObj = Authentications();
      final token = await authenticationsObj.authenticate();

      expect(token, isNotNull);
      expect(token, isNotEmpty);
    });
    test('Hotel data fetching ', () async {
      final objHotelService = HotelService();
      final result = await objHotelService.getHotelDetails();

      //expect(result, right(List<HotelModel>));
    });
  });
}
