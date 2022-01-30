import 'package:wakke_fun_feed/models/usuario_autor_borda_model.dart';
import 'package:wakke_fun_feed/models/usuario_autor_icone.dart';

class Publicacao {
  late int partidasExecutadasQtd;
  late int comentariosQtd;
  late int mediaNota;
  late int iV;
  late double avaliacaoNota;
  late double mediaAcertos;
  late double porcetagemMediaAcertos;
  late double mediaDuracao;
  late String sId;
  late String desafioId;
  late String titulo;
  late String descricao;
  late String usuarioAutor;
  late String usuarioAutorNome;
  late String usuarioAutorApelido;
  late String imagemCapa;
  late String linkVideo;
  late String numeroNic;
  late String dataCriacao;
  String? usuarioAutorImagemPerfil;
  late bool privado;
  late bool statusAtivo;
  late bool finalizado;
  late bool podeSerExcluido;
  UsuarioAutorBorda? usuarioAutorBorda;
  UsuarioAutorIcone? usuarioAutorIcone;

  Publicacao({required this.sId, required this.privado, required this.partidasExecutadasQtd, required this.comentariosQtd, required this.mediaNota, required this.mediaAcertos, required this.porcetagemMediaAcertos, required this.mediaDuracao, required this.avaliacaoNota, required this.statusAtivo, required this.finalizado, required this.desafioId, required this.titulo, required this.descricao, required this.usuarioAutor, required this.usuarioAutorNome, required this.usuarioAutorApelido, required this.imagemCapa, required this.linkVideo, required this.numeroNic, required this.dataCriacao, required this.iV, required this.podeSerExcluido, this.usuarioAutorImagemPerfil, this.usuarioAutorBorda, this.usuarioAutorIcone});

  Publicacao.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    privado = json['privado'];
    partidasExecutadasQtd = json['partidas_executadas_qtd'];
    comentariosQtd = json['comentarios_qtd'];
    mediaNota = json['media_nota'];
    mediaAcertos = double.parse(json['media_acertos'].toString());
    porcetagemMediaAcertos = double.parse(json['porcetagem_media_acertos'].toString());
    mediaDuracao = double.parse(json['media_duracao'].toString());
    avaliacaoNota = double.parse(json['avaliacao_nota'].toString());
    statusAtivo = json['status_ativo'];
    finalizado = json['finalizado'];
    desafioId = json['desafio_id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    usuarioAutor = json['usuario_autor'];
    usuarioAutorNome = json['usuario_autor_nome'];
    usuarioAutorApelido = json['usuario_autor_apelido'];
    imagemCapa = json['imagem_capa'];
    linkVideo = json['link_video'];
    numeroNic = json['numero_nic'];
    dataCriacao = json['data_criacao'];
    iV = json['__v'];
    podeSerExcluido = json['pode_ser_excluido'];
    usuarioAutorImagemPerfil = json['usuario_autor_imagem_perfil'];
    usuarioAutorBorda = json['usuario_autor_borda'] != null ? UsuarioAutorBorda.fromJson(json['usuario_autor_borda']) : null;
    usuarioAutorIcone = json['usuario_autor_icone'] != null ? UsuarioAutorIcone.fromJson(json['usuario_autor_icone']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['privado'] = privado;
    data['partidas_executadas_qtd'] = partidasExecutadasQtd;
    data['comentarios_qtd'] = comentariosQtd;
    data['media_nota'] = mediaNota;
    data['media_acertos'] = mediaAcertos;
    data['porcetagem_media_acertos'] = porcetagemMediaAcertos;
    data['media_duracao'] = mediaDuracao;
    data['avaliacao_nota'] = avaliacaoNota;
    data['status_ativo'] = statusAtivo;
    data['finalizado'] = finalizado;
    data['desafio_id'] = desafioId;
    data['titulo'] = titulo;
    data['descricao'] = descricao;
    data['usuario_autor'] = usuarioAutor;
    data['usuario_autor_nome'] = usuarioAutorNome;
    data['usuario_autor_apelido'] = usuarioAutorApelido;
    data['imagem_capa'] = imagemCapa;
    data['link_video'] = linkVideo;
    data['numero_nic'] = numeroNic;
    data['data_criacao'] = dataCriacao;
    data['__v'] = iV;
    data['pode_ser_excluido'] = podeSerExcluido;
    data['usuario_autor_imagem_perfil'] = usuarioAutorImagemPerfil;
    if (usuarioAutorBorda != null) {
      data['usuario_autor_borda'] = usuarioAutorBorda!.toJson();
    }
    if (usuarioAutorIcone != null) {
      data['usuario_autor_icone'] = usuarioAutorIcone!.toJson();
    }
    return data;
  }
}
