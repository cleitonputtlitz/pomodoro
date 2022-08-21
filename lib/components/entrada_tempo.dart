import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {

  final String titulo;
  final int valor;
  final void Function()? inc;
  final void Function()? dec;

  const EntradaTempo({ Key? key, required this.titulo, required this.valor, this.inc, this.dec }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(titulo, style: TextStyle(fontSize: 25)),
        SizedBox(height: 10,),
        Observer(builder: (_)  =>
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: dec, 
              child: Icon(Icons.arrow_downward, color: Colors.white,),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                primary: store.estaTrabalhando() ? Colors.red : Colors.green
              ),
            ),
            Text('${valor.toString()} min', style: TextStyle(fontSize: 18),),
            ElevatedButton(onPressed: inc, 
              child: Icon(Icons.arrow_upward, color: Colors.white,),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(15),
                primary: store.estaTrabalhando() ? Colors.red : Colors.green
              ),
            )
          ],
        )
        )
      ],      
    );
  }
}