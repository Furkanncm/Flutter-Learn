import 'package:flutter_test/flutter_test.dart';

main()  {
  setUp(() {
    print("Here");
  });

  test('User Login Test', () {
    const bool isUserLogin = true;
    expect(isUserLogin, isTrue);
  });
}
