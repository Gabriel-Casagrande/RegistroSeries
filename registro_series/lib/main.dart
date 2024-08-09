import 'dart:io';
import 'package:flutter/material.dart';
import 'package:registro_series/database/dao/seriedao.dart';
import 'package:registro_series/model/serie.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
  }

  databaseFactory = databaseFactoryFfi;

  runApp(MaterialApp(home: TelaPrincipal()));
}

class TelaPrincipal extends StatefulWidget {
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<Serie> series = [];

  @override
  void initState() {
    super.initState();
    buscarSeries();
  }

  Future<void> buscarSeries() async {
    final List<Serie> seriesList = await findAll();
    setState(() {
      series = seriesList;
    });
  }

  Future<void> deleteSerieById(int id) async {
    await deleteById(id);
    await buscarSeries();
  }

  Future<void> confirmDelete(BuildContext context, int id, String nome) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Tem certeza que deseja excluir "$nome"?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Excluir'),
              onPressed: () {
                Navigator.of(context).pop();
                deleteSerieById(id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$nome foi deletado'),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Registro de Séries",
          style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 35, 49, 223),
              fontWeight: FontWeight.bold,
              fontFamily: 'Serif'),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: series.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: series.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(series[index].id.toString()),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: ((direction) async {
                    await confirmDelete(
                        context, series[index].id, series[index].nome);
                    return Future.value(false);
                  }),
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SerieDados(serie: series[index])));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child:
                                    Icon(Icons.image, color: Colors.grey[700]),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nome: ${series[index].nome}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    LinearProgressIndicator(
                                      value: series[index].progresso,
                                      backgroundColor: Colors.grey[300],
                                      color: Color.fromARGB(255, 35, 49, 223),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: List.generate(5, (starIndex) {
                                        return Icon(
                                          starIndex < series[index].avaliacao
                                              ? Icons.star
                                              : Icons.star_border,
                                          color:
                                              Color.fromARGB(255, 35, 49, 223),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddSeriePage()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 35, 49, 223), // Cor azul
      ),
    );
  }
}

class SerieDados extends StatelessWidget {
  final Serie serie;

  SerieDados({required this.serie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          serie.nome,
          style: TextStyle(
            color: Color.fromARGB(255, 35, 49, 223), // Cor azul
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.image,
                      color: Colors.grey[700],
                      size: 50,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sinopse',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 35, 49, 223), // Cor azul
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTemporadaItem(context, 'Temporada 1', locked: true),
                _buildTemporadaItem(context, 'Temporada 2'),
                _buildTemporadaItem(context, 'Temporada 3', locked: true),
                _buildTemporadaItem(context, 'Temporada 4'),
              ],
            ),
            SizedBox(height: 16),
            _buildEpisodioItem('Episodio 1', '45:40', completed: true),
            _buildEpisodioItem('Episodio 2', '25:13'),
            _buildEpisodioItem('Episodio 3', '12:29'),
          ],
        ),
      ),
    );
  }

  Widget _buildTemporadaItem(BuildContext context, String temporada,
      {bool locked = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 184, 204, 240), // Cor azul clara
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              temporada,
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 35, 49, 223), // Cor azul
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (locked)
            Icon(
              Icons.lock,
              color: Color.fromARGB(255, 35, 49, 223), // Cor azul
            ),
          if (!locked)
            Checkbox(
              value: false,
              onChanged: (bool? value) {},
            ),
        ],
      ),
    );
  }

  Widget _buildEpisodioItem(String episodio, String duration,
      {bool completed = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              episodio,
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 35, 49, 223), // Cor azul
              ),
            ),
          ),
          Text(
            duration,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          Checkbox(
            value: completed,
            onChanged: (bool? value) {},
          ),
        ],
      ),
    );
  }
}

class AddSeriePage extends StatefulWidget {
  @override
  _AddSeriePageState createState() => _AddSeriePageState();
}

class _AddSeriePageState extends State<AddSeriePage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _progressoController = TextEditingController();
  final _avaliacaoController = TextEditingController();

  void _saveSerie() {
    if (_formKey.currentState!.validate()) {
      Serie newSerie = Serie(
        nome: _nomeController.text,
        progresso: double.tryParse(_progressoController.text) ?? 0,
        avaliacao: int.tryParse(_avaliacaoController.text) ?? 0,
      );

      // Adicione aqui a lógica para salvar a série no banco de dados

      Navigator.pop(context, newSerie); // Retorna para a tela anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Série'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome da Série'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome da série';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _progressoController,
                decoration: InputDecoration(labelText: 'Progresso (%)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o progresso';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _avaliacaoController,
                decoration: InputDecoration(labelText: 'Avaliação (0-10)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a avaliação';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveSerie,
                child: Text('Salvar'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 35, 49, 223), // Cor azul
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
