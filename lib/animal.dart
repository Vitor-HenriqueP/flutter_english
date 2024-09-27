import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class   Animal extends StatefulWidget {
  @override
  _AnimalState createState() => _AnimalState();
}
class _AnimalState extends State<Animal>{
  final player = AudioPlayer();

  void _executar(String nameAudio){
    player.play(AssetSource("audios/${nameAudio}.mp3"));
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio*2,
      children: <Widget>[
        GestureDetector(
          onTap: (){
            _executar("cao");
          },
          child: Image.asset("assets/imagens/cao.png"),

        ),
        GestureDetector(
          onTap: (){
            _executar("gato");
          },
          child: Image.asset("assets/imagens/gato.png"),

        ),
        GestureDetector(
          onTap: (){
            _executar("leao");
          },
          child: Image.asset("assets/imagens/leao.png"),

        ),
        GestureDetector(
          onTap: (){
            _executar("macaco");
          },
          child: Image.asset("assets/imagens/macaco.png"),

        ),
        GestureDetector(
          onTap: (){
            _executar("ovelha");
          },
          child: Image.asset("assets/imagens/ovelha.png"),

        ),
        GestureDetector(
          onTap: (){
            _executar("vaca");
          },
          child: Image.asset("assets/imagens/vaca.png"),

        ),

      ],
    );
  }
}
