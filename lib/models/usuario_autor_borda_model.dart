class UsuarioAutorBorda {
  late String id;
  late String color1;
  late String color2;

  UsuarioAutorBorda({required this.id, required this.color1, required this.color2});

  UsuarioAutorBorda.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color1 = json['color1'];
    color2 = json['color2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['color1'] = color1;
    data['color2'] = color2;
    return data;
  }
}
