import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculadora(),
  ));
}

class Calculadora extends StatefulWidget {
  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {

  String texto = "";

  double n1 = 0;
  double n2 = 0;

  String operacion = "";

  bool resultadoMostrado = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text("CalculadoraApp"),
        backgroundColor: Colors.orange,
      ),

      body: Column(

        children: [

          Expanded(

            flex: 2,

            child: Container(

              width: double.infinity,

              alignment: Alignment.bottomRight,

              padding: EdgeInsets.all(20),

              child: Text(
                texto,

                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Expanded(

            flex: 5,

            child: Column(

              children: [

                filaBotones(["7", "8", "9", "/"]),
                filaBotones(["4", "5", "6", "*"]),
                filaBotones(["1", "2", "3", "-"]),
                filaBotones(["0", ",", "C", "+"]),

                Expanded(

                  child: Container(

                    width: double.infinity,

                    margin: EdgeInsets.all(5),

                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),

                      onPressed: calcularResultado,

                      child: Text(
                        "=",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  
  Widget filaBotones(List<String> botones) {

    return Expanded(

      child: Row(

        children: botones.map((valor) {

          bool esOperacion =
              valor == "+" ||
              valor == "-" ||
              valor == "*" ||
              valor == "/";

          return Expanded(

            child: Container(

              margin: EdgeInsets.all(5),

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(

                  backgroundColor:
                  esOperacion
                      ? Colors.orange
                      : Colors.grey[800],

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                onPressed: () {

                  setState(() {

                    if (valor == "C") {

                      texto = "";

                      n1 = 0;
                      n2 = 0;

                      operacion = "";

                      resultadoMostrado = false;
                    }

                   else if (
                    valor == "+" ||
                        valor == "-" ||
                        valor == "*" ||
                        valor == "/") {

                      n1 = double.parse(texto);

                      operacion = valor;

                      texto = "";

                      resultadoMostrado = false;
                    }

                    else if (valor == ",") {

                      texto = texto + ".";
                    }

                    else {

                      if (resultadoMostrado == true) {

                        texto = valor;

                        resultadoMostrado = false;
                      }

                      else {

                        texto = texto + valor;
                      }
                    }
                  });
                },

                child: Text(

                  valor,

                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );

        }).toList(),
      ),
    );
  }

  
  void calcularResultado() {

    n2 = double.parse(texto);

    setState(() {

      if (operacion == "+") {
        texto = (n1 + n2).toString();
      }

      if (operacion == "-") {
        texto = (n1 - n2).toString();
      }

      if (operacion == "*") {
        texto = (n1 * n2).toString();
      }

      if (operacion == "/") {
        texto = (n1 / n2).toString();
      }

     resultadoMostrado = true;
    });
  }
}