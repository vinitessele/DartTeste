import 'package:flutter/material.dart';

class ViaCepScreen extends StatefulWidget {
  const ViaCepScreen({super.key});

  @override
  _ViaCepScreenState createState() => _ViaCepScreenState();
}

class _ViaCepScreenState extends State<ViaCepScreen> {
  final TextEditingController _cepController = TextEditingController();
  String _resultado = ''; 

  void _buscarEndereco() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta ViaCEP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _cepController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Digite o CEP',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _buscarEndereco,
              child: const Text('Buscar'),
            ),
            const SizedBox(height: 16.0),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
