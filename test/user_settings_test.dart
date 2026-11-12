import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/user_settings.dart';
 
void main() {
  group('UserSettings', () {
    test('default instance has empty strings and no newsletter', () {
      const UserSettings settings = UserSettings();
 
      expect(settings.name, isEmpty);
      expect(settings.email, isEmpty);
      expect(settings.address, isEmpty);
      expect(settings.receiveNewsletter, isFalse);
    });
 
    test('configured instance stores the values passed to the constructor', () {
      const UserSettings settings = UserSettings(
        name: 'Dimitri Gallardo',
        email: 'dimitri@example.com',
        address: 'commercial road, Portsmouth',
        receiveNewsletter: true,
      );
 
      expect(settings.name, 'Dimitri Gallardo');
      expect(settings.email, 'dimitri@example.com');
      expect(settings.address, '1 Palmerston Road, Southsea');
      expect(settings.receiveNewsletter, isTrue);
    });
  });
}