import 'package:flutter/material.dart';
import 'package:wakke_fun_feed/models/publicacao_model.dart';
import 'package:wakke_fun_feed/services/publicacao_service.dart';

class InitialController {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  ValueNotifier<List<Publicacao>> listaPublicacoes = ValueNotifier([]);
  ValueNotifier<int> index = ValueNotifier(-1);

  Future<void> getPublicacoes() async {
    listaPublicacoes.value = await PublicacaoSevice().getPublicacoes();
  }

  void trocaIndex(int index) {
    this.index.value = index;
  }
}
