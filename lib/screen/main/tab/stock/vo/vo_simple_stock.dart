class SimpleStock {
  final String name;

  SimpleStock(this.name);

  factory SimpleStock.fromJson(json) {
    return SimpleStock(json['name']);
  }

  @override
  String toString() {
    return name;
  }
}
