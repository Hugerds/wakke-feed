// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakke_fun_feed/controllers/initial_controller.dart';
import 'package:wakke_fun_feed/views/componentsWidgets/publicacao_widget.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  late InitialController controller;
  @override
  void initState() {
    controller = InitialController();
    controller.listaPublicacoes.addListener(() {
      setState(() {});
    });
    controller.getPublicacoes();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Color(0xFF6435ff),
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFfafafa),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    width * 0.01,
                    height * 0.01,
                    width * 0.01,
                    height * 0.01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'lib/assets/images/icon_header_menu.png',
                        width: width * 0.05,
                      ),
                      Image.asset(
                        'lib/assets/images/logo_wakke_roxo.png',
                        width: width * 0.3,
                      ),
                      Image.asset(
                        'lib/assets/images/icon_header_search.png',
                        width: width * 0.05,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              Padding(
                padding: EdgeInsets.only(left: width * 0.01, right: width * 0.01),
                child: Row(
                  children: [
                    Image.asset('lib/assets/images/icon_chat.png'),
                    SizedBox(width: width * 0.01),
                    const Text(
                      "Está acontecendo...",
                      style: TextStyle(color: Color(0xFF6139f8), fontSize: 19, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
              Expanded(
                child: ListView.builder(
                    itemCount: controller.listaPublicacoes.value.length,
                    itemBuilder: (context, index) {
                      return PublicacaoWidget(
                        height: height,
                        width: width,
                        nomeUsuario: controller.listaPublicacoes.value[index].usuarioAutorApelido,
                        pathImage: controller.listaPublicacoes.value[index].imagemCapa,
                        qtdComentarios: controller.listaPublicacoes.value[index].comentariosQtd.toString(),
                        qtdStars: controller.listaPublicacoes.value[index].avaliacaoNota.toString(),
                        tituloPublicacao: controller.listaPublicacoes.value[index].titulo,
                        pathAutorImagem: controller.listaPublicacoes.value[index].usuarioAutorImagemPerfil,
                      );
                    }),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF06cfae),
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.all(height * 0.008),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/icon_wakke_fun.png'),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Padding(
          padding: EdgeInsets.fromLTRB(width * 0.05, height * 0.005, width * 0.05, height * 0.005),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                'lib/assets/images/icon_header_menu_branco.png',
                color: Color(0xFF908d8d),
                width: width * 0.05,
              ),
              Image.asset(
                'lib/assets/images/icon_add.png',
                color: Color(0xFF908d8d),
                width: width * 0.05,
              ),
              const SizedBox(),
              Image.asset(
                'lib/assets/images/icon_account.png',
                color: Color(0xFF908d8d),
                width: width * 0.05,
              ),
              Image.asset(
                'lib/assets/images/icon_notificacoes.png',
                color: Color(0xFF908d8d),
                width: width * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
