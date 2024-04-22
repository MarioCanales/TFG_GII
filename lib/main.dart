import 'package:flutter/material.dart';

import 'circuit_designer_2_meshes.dart';
import 'circuit_designer_3_meshes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ETSIIValente',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Image.asset('assets/logo_etsii.png',
                  fit: BoxFit.cover, height: 60),
              Expanded(
                  child: Center(
                    child: Text(
                        'ETSIIValente', style: TextStyle(color: Colors.brown, fontSize: 30)
                    ),
                  )
              ),
              ElevatedButton(
                onPressed: () {
                  // Action for saved circuits
                },
                child: Text('Circuitos guardados',
                    style: TextStyle(color: Colors.brown))
              ),
            ],
          ),
          toolbarHeight: 90
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Calcula el circuito equivalente Thevenin',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(
                  'Elige la estructura, diseña, resuelve.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.brown),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero, // No rounded
                      )
                    )
                  ),
                  child: Text('Diseñar', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    _showMeshSelectionDialog(context);
                  },
                )
              ],
            ),
          ),
        ));
  }

  void _showMeshSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecciona el número de mallas'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('2 Mallas'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CircuitDesigner2Meshes()));
                  },
                ),
                GestureDetector(
                  child: Text('3 Mallas'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CircuitDesigner3Meshes()));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}

