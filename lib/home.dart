import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _statusText = "Informe seus dados!";
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  void _resetFields()
  {
    weightController.text = "";
    heightController.text = "";
     _statusText = "Informe seus dados!"; 
    _formkey = GlobalKey<FormState>();

  }

  void calculate()
  {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight/ (height*height);

    if (imc<18.6)
    {
      _statusText = "Abaixo do peso! \n IMC: ${imc.toStringAsPrecision(4)}";
    }
    else if(imc>=18.6 && imc< 24.9)
    {
      _statusText = "Peso ideal! \n IMC:${imc.toStringAsPrecision(4)}";
    }
    else if(imc>=24.9 && imc<29.9)
    {
      _statusText = "Levemente acima do peso! \n IMC:${imc.toStringAsPrecision(4)}";
    }
    else if(imc>=29.9 && imc<34.9)
    {
      _statusText = "Obesidade grau I! \n IMC:${imc.toStringAsPrecision(4)}";
    }
    else if(imc>=34.9 && imc<39.9)
    {
      _statusText = "Obesidade grau II! \n IMC:${imc.toStringAsPrecision(4)}";
    }
    else if(imc>=40)
    {
      _statusText = "Obesidade grau III! \n IMC:${imc.toStringAsPrecision(4)}";
    }

    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Calculadora de IMC"),
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: (){
                setState(() {
                  _resetFields();                   
                });
              },
            )
          ],
        ),
        backgroundColor: Colors.deepPurple,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.16,bottom: MediaQuery.of(context).size.height * 0.07),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 370,
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(3),
                ),
                child:SingleChildScrollView(
                  child:  Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top:10),
                      child: Icon(
                                Icons.person,
                                size: 80,
                                color: Colors.black54,
                              )
                    ),
                    Form(
                      key: _formkey,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TextFormField(
                            validator: (value){
                              if(value.isEmpty)
                              {
                                return "Insira seu peso!";
                              }
                            },
                            keyboardType: TextInputType.number,
                            controller: weightController,
                            decoration: InputDecoration(
                              labelText: "Peso (kg)",                              
                            ),
                          ),
                          TextFormField(
                            validator: (value){
                              if(value.isEmpty)
                              {
                                return "Insira sua altura!";
                              }
                            },
                            keyboardType: TextInputType.number,
                            controller: heightController,
                            decoration: InputDecoration(
                              labelText: "Altura (cm)"
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:20),
                            child: OutlineButton(
                            padding: EdgeInsets.all(10),                          
                            onPressed: (){
                              if(_formkey.currentState.validate())
                              {
                                setState(() {
                                 calculate(); 
                                });
                              }
                            },
                            splashColor: Colors.purple,
                            child: Text("Calcular",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17),),
                          ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:15),
                            child: Text("$_statusText",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15,color: Colors.black87,fontWeight: FontWeight.bold),  
                                ),
                          )
                        ],
                      ),
                      )
                    )
                  ],
                ),
                )
              ),
            ),
            )
          ],
        ),
        )
        );
  }
}