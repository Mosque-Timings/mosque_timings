import 'package:flutter/material.dart';
import 'package:mosque_timings/src/widgets/mosque_clock.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MosqueClock(),
    );
  }
}
