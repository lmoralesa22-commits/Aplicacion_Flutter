import 'package:flutter/material.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion 01',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF202324),
          primary: const Color(0xFFD5CD5F),
          secondary: const Color(0xFFE3A102),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 20),
        ),
      ),
      home: const PantallaInicio(),
    );
  }
}

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }
  void _mostrarAviso() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.celebration, size: 40),
        title: const Text('¡Muy bien!'),
        content: Text('Has presionado el contador $_contador veces.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colores = Theme.of(context).colorScheme;
    final estilos = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicacion 01 '),
        backgroundColor: colores.primaryContainer,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite, size: 72, color: colores.primary),
              const SizedBox(height: 16),
              Text(
                'Veces que has presionado:',
                style: estilos.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                '$_contador',
                style: estilos.headlineMedium?.copyWith(
                  fontSize: 64,
                  color: colores.primary,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _mostrarAviso,
                icon: const Icon(Icons.notifications),
                label: const Text('Ver mensaje'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementar,
        icon: const Icon(Icons.add),
        label: const Text('Sumar'),
      ),
    );
  }
}