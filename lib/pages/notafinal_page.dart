import 'package:flutter/material.dart';

class NotaFinalPage extends StatefulWidget {
  const NotaFinalPage({super.key});

  @override
  State<NotaFinalPage> createState() => _NotaFinalPageState();
}

class _NotaFinalPageState extends State<NotaFinalPage> {
  // Controladores para las notas ingresadas
  final TextEditingController _labController = TextEditingController();
  final TextEditingController _primerAvanceController = TextEditingController();
  final TextEditingController _segundoAvanceController = TextEditingController();
  final TextEditingController _proyectoFinalController = TextEditingController();

  String _resultado = '';

  // Método para calcular la nota final
  void _calcularNotaFinal() {
    String labText = _labController.text;
    String primerAvanceText = _primerAvanceController.text;
    String segundoAvanceText = _segundoAvanceController.text;
    String proyectoFinalText = _proyectoFinalController.text;

    if (labText.isEmpty || primerAvanceText.isEmpty || segundoAvanceText.isEmpty || proyectoFinalText.isEmpty) {
      setState(() {
        _resultado = 'Por favor ingrese todas las notas.';
      });
      return;
    }

    // Convertir los valores ingresados a double
    double lab = double.parse(labText);
    double primerAvance = double.parse(primerAvanceText);
    double segundoAvance = double.parse(segundoAvanceText);
    double proyectoFinal = double.parse(proyectoFinalText);

    // Validación para que las notas estén entre 0 y 5
    if (lab < 0 || lab > 5 || primerAvance < 0 || primerAvance > 5 || segundoAvance < 0 || segundoAvance > 5 || proyectoFinal < 0 || proyectoFinal > 5) {
      setState(() {
        _resultado = 'Las notas deben estar entre 0 y 5.';
      });
      return;
    }

    // Calcular la nota final
    double notaFinal = (lab * 0.60) +
        (primerAvance * 0.10) +
        (segundoAvance * 0.08) +
        (proyectoFinal * 0.25);

    setState(() {
      _resultado = 'La nota final es: ${notaFinal.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo de Nota Final'),
        backgroundColor: Colors.blue[300],
      ),
      backgroundColor: Colors.lightBlue[100],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo de texto para las prácticas de laboratorio
            TextField(
              controller: _labController,
              decoration: const InputDecoration(labelText: 'Nota de Prácticas de Laboratorio (60%)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Campo de texto para el primer avance del proyecto
            TextField(
              controller: _primerAvanceController,
              decoration: const InputDecoration(labelText: 'Nota del Primer Avance (10%)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Campo de texto para el segundo avance del proyecto
            TextField(
              controller: _segundoAvanceController,
              decoration: const InputDecoration(labelText: 'Nota del Segundo Avance (8%)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Campo de texto para la entrega final del proyecto
            TextField(
              controller: _proyectoFinalController,
              decoration: const InputDecoration(labelText: 'Nota del Proyecto Final (25%)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Botón para calcular la nota final
            ElevatedButton(
              onPressed: _calcularNotaFinal,
              child: const Text('Calcular Nota Final'),
            ),
            const SizedBox(height: 16),

            // Mostrar el resultado
            Text(
              _resultado,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}