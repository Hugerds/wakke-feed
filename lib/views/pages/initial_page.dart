import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakke_fun_feed/controllers/initial_controller.dart';
import 'package:wakke_fun_feed/views/componentsWidgets/button_bottom_app_bar_widget.dart';
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
    controller.index.addListener(() {
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
      key: controller.key,
      drawerEnableOpenDragGesture: false,
      backgroundColor: const Color(0xFFfafafa),
      drawer: Drawer(child: Container()),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      GestureDetector(
                        onTap: () => controller.key.currentState!.openDrawer(),
                        child: Image.asset(
                          'lib/assets/images/icon_header_menu.png',
                          width: width * 0.05,
                        ),
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
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF06cfae),
        onPressed: () {},
        child: Container(
          // margin: EdgeInsets.all(height * 0.008),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/button_fun.png'),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Padding(
          padding: EdgeInsets.fromLTRB(width * 0.05, height * 0.00, width * 0.05, height * 0.00),
          child: SizedBox(
            height: width * 0.1,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ButtonBottomAppBarWidget(
                  width: width,
                  imagePath: 'lib/assets/images/icon_header_menu_branco.png',
                  onTap: () => controller.trocaIndex(0),
                  selected: controller.index.value == 0,
                ),
                ButtonBottomAppBarWidget(
                  width: width,
                  imagePath: 'lib/assets/images/icon_add.png',
                  onTap: () => controller.trocaIndex(1),
                  selected: controller.index.value == 1,
                ),
                const SizedBox(),
                ButtonBottomAppBarWidget(
                  width: width,
                  imagePath: 'lib/assets/images/icon_account.png',
                  onTap: () => controller.trocaIndex(2),
                  selected: controller.index.value == 2,
                ),
                ButtonBottomAppBarWidget(
                  width: width,
                  imagePath: 'lib/assets/images/icon_notificacoes.png',
                  onTap: () => controller.trocaIndex(3),
                  selected: controller.index.value == 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
