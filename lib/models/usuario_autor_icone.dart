class UsuarioAutorIcone {
  late String id;
  late String url;
  late int xpAmount;

  UsuarioAutorIcone({required this.id, required this.url, required this.xpAmount});

  UsuarioAutorIcone.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    xpAmount = json['xp_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['xp_amount'] = xpAmount;
    return data;
  }
}
