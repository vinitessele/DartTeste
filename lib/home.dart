import 'package:appacessogps/mapScreen.dart';
import 'package:appacessogps/weatherHome.dart';
import 'package:appacessogps/viaCepScreen.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Nome do Usuário'),
              accountEmail: const Text('email@exemplo.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.map), // Ícone de marcador de mapa
              title: const Text('Mapa'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const mapScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.cloud), // Ícone de nuvem
              title: const Text('Clima'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherHome()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on), // Ícone de localização
              title: const Text('ViaCEP'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViaCepScreen()), // Redireciona para a nova tela
                );
              },
            ),
          ],
        ),
      ),
      body: Center(child: const Text('Tela Inicial')),
    );
  }
}
