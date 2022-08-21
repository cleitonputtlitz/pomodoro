
import 'package:mobx/mobx.dart';

part 'contador.store.g.dart'; //arquivo gerado automaticamente

class ContadorStore = _ContadorStore with _$ContadorStore;

abstract class _ContadorStore with Store {

  @observable
  int contador = 0;

  @action
  void incrementar() {
    contador ++;
  }

}

/*
executar no terminal para gerar o arquivo contador.store.g.dart
flutter pub run build_runner watch 

*/
