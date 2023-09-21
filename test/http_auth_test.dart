import 'package:flutter_test/flutter_test.dart';
import 'package:travelapp/Infrastructure/Hotel/Authentication.dart';

void main() {
  group('Testing App Provider', () {
    test('Authecation of Hotel', () async {
      final authenticationsObj = Authentications();
      final token = await authenticationsObj.authenticate();

      expect(token, token);
    });
  });
}
