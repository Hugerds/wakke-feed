import 'package:flutter/foundation.dart';
import 'package:wakke_fun_feed/models/publicacao_model.dart';
import 'package:wakke_fun_feed/services/publicacao_service.dart';

class InitialController {
  ValueNotifier<List<Publicacao>> listaPublicacoes = ValueNotifier([]);

  Future<void> getPublicacoes() async {
    listaPublicacoes.value = await PublicacaoSevice().getPublicacoes();
  }
}
