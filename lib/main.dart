import 'package:flutter/material.dart';
import 'package:calculadora_imc/home.dart';
void main()
{
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.deepPurple,
      ),
    home: Home(),
    title: "Calculadora de IMC",
  ));
}