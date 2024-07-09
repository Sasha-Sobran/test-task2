class Poet {
  final String name;
  final int id;

  Poet({required this.name, required this.id});

  factory Poet.fromJson(Map<String, dynamic> json) => Poet(
        id: json["id"],
        name: json["name"],
      );
}
