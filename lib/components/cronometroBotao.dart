
import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  
  final String texto;
  final IconData icone;
  final void Function() onPressed;
  const CronometroBotao({ Key? key , required this.texto, required this.icone, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: TextStyle(fontSize: 25)        
      ),
      
      onPressed: onPressed,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(icone, size: 35,),
          ),
          Text(texto)          
        ],
      ),
      
    );
  }
}