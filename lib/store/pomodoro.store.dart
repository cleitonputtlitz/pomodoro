
import 'dart:async';

import 'package:mobx/mobx.dart';

part 'pomodoro.store.g.dart';

class PomodoroStore = _PomodoroStore with _$PomodoroStore;

enum TipoIntervalo { TRABALHO, DESCANSO}

abstract class _PomodoroStore with Store {

  Timer? cronometro;

  @observable
  int tempoTrabalho = 2;

  @observable
  int tempoDescanso = 1;

  @observable
  int minutos = 2;

  @observable
  int segundos = 0;

  @observable
  bool iniciado = false;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.TRABALHO;

  @action
  void incrementarTempoTrabalho(){
    tempoTrabalho++;
  }

  @action
  void decrementarTempoTrabalho(){
    if(tempoTrabalho > 1)
      tempoTrabalho--;
  }

  @action
  void incrementarTempoDescanso(){
    tempoDescanso++;
  }

  @action
  void decrementarTempoDescanso(){
    if(tempoDescanso > 1)
      tempoDescanso--;
  }

  @action
  void iniciar(){
    iniciado = true;
    cronometro = Timer.periodic(Duration(seconds: 1), (timer) { //chama a função a cada segundo
      if(minutos == 0 && segundos == 0){
        _trocarTipoIntervalo();
      } else if(segundos == 0){
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }


    });
  }

  @action
  void parar(){
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void reiniciar(){
    parar();
    minutos = estaTrabalhando() ? tempoTrabalho : tempoDescanso;
    segundos = 0;
  }

  bool estaTrabalhando(){
    return tipoIntervalo == TipoIntervalo.TRABALHO;
  }

  bool estaDescansando(){
    return tipoIntervalo == TipoIntervalo.DESCANSO;
  }

  void _trocarTipoIntervalo(){
    if(estaTrabalhando()){
      tipoIntervalo = TipoIntervalo.DESCANSO;
      minutos = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.TRABALHO;
       minutos = tempoTrabalho;
    }
    segundos = 0;
  }

  

}