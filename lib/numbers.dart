import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';  // Import necessário para gerar números aleatórios

class Numbers extends StatefulWidget {
  @override
  _NumbersState createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> with TickerProviderStateMixin {
  final player = AudioPlayer();
  Color _containerColor = Colors.transparent;

  void _executar(String nameAudio) {
    player.play(AssetSource("audios/${nameAudio}.mp3"));
    setState(() {
      _containerColor = _generateRandomColor();  // Gera uma cor aleatória
    });
  }

  // Função para gerar cores aleatórias
  Color _generateRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256), // Valor aleatório entre 0 e 255 para o vermelho
      random.nextInt(256), // Valor aleatório entre 0 e 255 para o verde
      random.nextInt(256), // Valor aleatório entre 0 e 255 para o azul
      1,                   // Opacidade total
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: MediaQuery.of(context).size.aspectRatio * 2,
      children: <Widget>[
        _buildNumbersTile("1", "assets/imagens/1.png"),
        _buildNumbersTile("2", "assets/imagens/2.png"),
        _buildNumbersTile("3", "assets/imagens/3.png"),
        _buildNumbersTile("4", "assets/imagens/4.png"),
        _buildNumbersTile("5", "assets/imagens/5.png"),
        _buildNumbersTile("6", "assets/imagens/6.png"),
      ],
    );
  }

  Widget _buildNumbersTile(String audio, String image) {
    return GestureDetector(
      onTap: () => _executar(audio),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        color: _containerColor,  // A cor agora é a gerada aleatoriamente
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
