// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:registro_series/database/dao/seriedao.dart';
import 'package:registro_series/model/serie.dart';
import 'package:registro_series/pages/selectSeries.dart';
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
  late Future<List<Serie>> _futureSeries;
  List<int> _selectedSeriesIds = [];

  @override
  void initState() {
    super.initState();
    _loadSeries();
  }

  void _loadSeries() {
    setState(() {
      _futureSeries = findAll().then((allSeries) {
        if (_selectedSeriesIds.isNotEmpty) {
          return allSeries
              .where((serie) => _selectedSeriesIds.contains(serie.id))
              .toList();
        } else {
          return allSeries;
        }
      });
    });
  }

  void _updateSelectedSeries(List<int> selectedIds) {
    setState(() {
      _selectedSeriesIds = selectedIds;
    });
    _loadSeries();
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
            fontFamily: 'Serif',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<List<Serie>>(
        future: _futureSeries,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar as séries.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhuma série encontrada.'));
          } else {
            final series = snapshot.data!;
            return ListView.builder(
              itemCount: series.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(series[index].id.toString()),
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (direction) async {
                    await _confirmDelete(
                        context, series[index].id!, series[index].nome);
                    return false;
                  },
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
                              SerieDados(serie: series[index]),
                        ),
                      );
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
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final selectedSeriesIds = await Navigator.push<List<int>>(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SelectSeriesPage(selectedSeriesIds: _selectedSeriesIds),
            ),
          );

          if (selectedSeriesIds != null) {
            _updateSelectedSeries(selectedSeriesIds);
          }
        },
        backgroundColor: Color.fromARGB(255, 35, 49, 223),
        child: Icon(Icons.list), // Cor azul
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, int id, String nome) async {
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
              onPressed: () async {
                Navigator.of(context).pop();
                await deleteById(id);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$nome foi deletado'),
                  ),
                );
                _loadSeries(); // Atualiza a lista de séries após deletar
              },
            ),
          ],
        );
      },
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
                    textAlign: TextAlign.center,
                    serie.sinopse.length > 100
                        ? serie.sinopse.substring(0, 100) + '...'
                        : serie.sinopse,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Text(
                  //   serie.sinopse,
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(fontSize: 16),
                  // ),
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

  Widget _buildEpisodioItem(String episodio, String duracao,
      {bool completed = false}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: completed
            ? Color.fromARGB(255, 173, 216, 230)
            : Color.fromARGB(255, 184, 204, 240),
        borderRadius: BorderRadius.circular(10),
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
            duracao,
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 35, 49, 223), // Cor azul
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
