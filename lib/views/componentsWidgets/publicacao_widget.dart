import 'package:flutter/material.dart';

class PublicacaoWidget extends StatelessWidget {
  final double height;
  final double width;
  final String nomeUsuario;
  final String pathImage;
  final String qtdComentarios;
  final String qtdStars;
  final String tituloPublicacao;
  final String? pathAutorImagem;

  const PublicacaoWidget({Key? key, required this.height, required this.width, required this.nomeUsuario, required this.pathImage, required this.qtdComentarios, required this.qtdStars, required this.tituloPublicacao, this.pathAutorImagem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: width * 0.01, right: width * 0.01),
      child: Card(
        color: const Color(0xFFFFFFFF),
        child: Padding(
          padding: EdgeInsets.fromLTRB(width * 0.01, height * 0.01, width * 0.01, height * 0.01),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(pathAutorImagem ?? ""),
                    onBackgroundImageError: (exception, stackTrace) => Container(color: Colors.white),
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(width: width * 0.02),
                  Expanded(
                      child: Text(
                    nomeUsuario,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  )),
                  Image.asset('lib/assets/images/icon_coments.png'),
                  Text(" $qtdComentarios"),
                  SizedBox(width: width * 0.03),
                  Image.asset('lib/assets/images/icon_star.png'),
                  Text(" $qtdStars"),
                ],
              ),
              SizedBox(height: height * 0.01),
              Stack(
                children: [
                  SizedBox(
                    height: height * 0.45,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          pathImage,
                          fit: BoxFit.fill,
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return Container();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.30),
                    child: Center(
                      child: Container(
                        height: height * 0.10,
                        width: width * 0.55,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1fe2c2),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            tituloPublicacao,
                            style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 17, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
