import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesScreen extends StatefulWidget {
  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String _username = '';
  double _counterValue = 0;

  // cargar las preferencias
  Future<void> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
      _counterValue = prefs.getDouble('counterValue') ?? 0;
    });
  }

  // guardar las preferencias
  Future<void> _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _username);
    await prefs.setDouble('counterValue', _counterValue);
    
  }

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre de Usuario', style: TextStyle(fontSize: 18)),
            TextFormField(
              initialValue: _username,
              decoration: InputDecoration(hintText: 'Ingresa tu nombre de usuario'),
              onChanged: (value) {
                setState(() {
                  _username = value;
                });
              },
            ),
            SizedBox(height: 24),
            Text('Valor del Contador: ${_counterValue.toInt()}', style: TextStyle(fontSize: 18)),
            Slider(
              value: _counterValue,
              min: 0,
              max: 100,
              divisions: 100,
              label: _counterValue.toInt().toString(),
              onChanged: (value) {
                setState(() {
                  _counterValue = value;
                });
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                _savePreferences();
                // Retornar a la pantalla anterior, indicando que se guardaron las preferencias
                Navigator.pop(context, true);
              },
              child: Text('Guardar Preferencias'),
            ),
          ],
        ),
      ),
    );
  }
}