
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/cronometroBotao.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
    return 
      Observer(
      builder: (_) {
        return Container(
          color: store.estaTrabalhando() ? Colors.red : Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(store.estaTrabalhando() ? 'Hora de trabalhar' : 'Hora de descansar', 
              style: TextStyle(fontSize: 40, color: Colors.white)),
              SizedBox(height: 20,),          
              Text('${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}', style: TextStyle(fontSize: 120, color: Colors.white)),         
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  store.iniciado == false ?
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: CronometroBotao(texto: 'Iniciar', icone: Icons.play_arrow, onPressed: store.iniciar,),
                  )
                  :
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: CronometroBotao(texto: 'Parar', icone: Icons.stop, onPressed: store.parar,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CronometroBotao(texto: 'Reiniciar', icone: Icons.refresh, onPressed: store.reiniciar,),
                  ),
                  
                ],
              )          
            ]),
          
        );
      }
    );
  }
}
 

