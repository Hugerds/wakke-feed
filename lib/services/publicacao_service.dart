import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wakke_fun_feed/models/publicacao_model.dart';

class PublicacaoSevice {
  Future<List<Publicacao>> getPublicacoes() async {
    final String response = await rootBundle.loadString('lib/data/json_wakkefun.json');
    final data = await json.decode(response);
    return (data as List).map((x) => Publicacao.fromJson(x)).toList();
  }
}
