class GenericUser {
  final String name;
  final int money;

  GenericUser(this.name, this.money);

 
}

class UserItems {
   int calculateMoney(List<GenericUser> users) {
    final int response = users
        .map((e) => e.money)
        .fold<int>(0, (previousValue, element) => previousValue + element);

    return response;
  }
}
