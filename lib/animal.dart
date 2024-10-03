import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';  

class Animal extends StatefulWidget {
  @override
  _AnimalState createState() => _AnimalState();
}

class _AnimalState extends State<Animal> with TickerProviderStateMixin {
  final player = AudioPlayer();
  Color _containerColor = Colors.transparent;

  void _executar(String nameAudio) {
    player.play(AssetSource("audios/${nameAudio}.mp3"));
    setState(() {
      _containerColor = _generateRandomColor();  
    });
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256), 
      random.nextInt(256), 
      random.nextInt(256), 
      1,                   
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: <Widget>[
        _buildAnimalTile("cao", "assets/imagens/cao.png"),
        _buildAnimalTile("gato", "assets/imagens/gato.png"),
        _buildAnimalTile("leao", "assets/imagens/leao.png"),
        _buildAnimalTile("macaco", "assets/imagens/macaco.png"),
        _buildAnimalTile("ovelha", "assets/imagens/ovelha.png"),
        _buildAnimalTile("vaca", "assets/imagens/vaca.png"),
      ],
    );
  }

  Widget _buildAnimalTile(String audio, String image) {
    return GestureDetector(
      onTap: () => _executar(audio),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: _containerColor,
        child: ScaleTransition(
          scale: Tween(begin: 0.5, end: 1.0).animate(
            CurvedAnimation(
              parent: AnimationController(
                vsync: this,
                duration: Duration(milliseconds: 300),
              )..forward(),
              curve: Curves.easeInOut,
            ),
          ),
          child: Image.asset(image),
        ),
      ),
    );
  }
}
