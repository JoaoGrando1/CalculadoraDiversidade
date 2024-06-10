import 'package:flutter/material.dart';

void main() {
  runApp(appWidget());
}

class appWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campanha de Diversidade',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variáveis para armazenar os valores das orientações sexuais
  double _homossexual = 0;
  double _heterossexual = 0;
  double _bissexual = 0;
  double _assexual = 0;
  double _pansexual = 0;

  // Variáveis para armazenar as porcentagens calculadas
  double _homossexualPercentage = 0;
  double _heterossexualPercentage = 0;
  double _bissexualPercentage = 0;
  double _assexualPercentage = 0;
  double _pansexualPercentage = 0;

  // Variável para controlar a visibilidade dos resultados
  bool _showResults = false;

  // Função para calcular as porcentagens
  void _calculatePercentages() {
    setState(() {
      double total = _homossexual + _heterossexual + _bissexual + _assexual + _pansexual;
      if (total > 0) {
        _homossexualPercentage = (_homossexual / total) * 100;
        _heterossexualPercentage = (_heterossexual / total) * 100;
        _bissexualPercentage = (_bissexual / total) * 100;
        _assexualPercentage = (_assexual / total) * 100;
        _pansexualPercentage = (_pansexual / total) * 100;
      } else {
        _homossexualPercentage = 0;
        _heterossexualPercentage = 0;
        _bissexualPercentage = 0;
        _assexualPercentage = 0;
        _pansexualPercentage = 0;
      }
      _showResults = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campanha de Diversidade'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Campo de entrada para homossexual
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Homossexual'),
              onChanged: (value) {
                _homossexual = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Campo de entrada para heterossexual
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Heterossexual'),
              onChanged: (value) {
                _heterossexual = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Campo de entrada para bissexual
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Bissexual'),
              onChanged: (value) {
                _bissexual = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Campo de entrada para assexual
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Assexual'),
              onChanged: (value) {
                _assexual = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Campo de entrada para pansexual
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Pansexual'),
              onChanged: (value) {
                _pansexual = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 20.0),
            // Botão para calcular as porcentagens
            ElevatedButton(
              onPressed: _calculatePercentages,
              child: Text('Calcular Porcentagens'),
            ),
            SizedBox(height: 20.0),
            // Exibição dos resultados
            if (_showResults)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Homossexual: ${_homossexualPercentage.toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Heterossexual: ${_heterossexualPercentage.toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Bissexual: ${_bissexualPercentage.toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Assexual: ${_assexualPercentage.toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Pansexual: ${_pansexualPercentage.toStringAsFixed(2)}%',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
