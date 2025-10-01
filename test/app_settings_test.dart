import 'package:app_settings/app_settings.dart';
import 'package:app_settings/src/app_settings_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

test('FontFamilyNotifier stores and retrieves value', () async {
  SharedPreferences.setMockInitialValues({});
  final container = ProviderContainer();
  addTearDown(container.dispose);

  final notifier = container.read(fontFamilyProvider.notifier);

  // Act: set new value
  await notifier.set('Roboto');

  // Await state propagation
  final result = container.read(fontFamilyProvider);

  // Assert: state updated
  expect(result.value, 'Roboto');

  // And persisted
  final prefs = await SharedPreferences.getInstance();
  expect(prefs.getString('font_family'), 'Roboto');
});

}
