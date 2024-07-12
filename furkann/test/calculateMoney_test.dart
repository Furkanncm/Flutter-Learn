import "package:flutter_test/flutter_test.dart";
import "package:furkann/303/GenericLearn.dart";

void main() {
  setUp(() {});

  test("Calculate Test", () {
    final user = [
      GenericUser('John', 100),
      GenericUser('Doe', 200),
      GenericUser('Jane', 300),
    ];

    final response = UserItems().calculateMoney(user);

    expect(response, 600);
    print(expect);
  });
}
