// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:registro_series/database/dao/seriedao.dart';
import 'package:registro_series/database/db.dart';
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
                              SeriesWithSeasonsPage(serie: series[index]),
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

// Fetch all series
Future<List<Serie>> fetchSeries() async {
  Database db = await getDatabase();
  final List<Map<String, dynamic>> maps = await db.query('series');
  return List.generate(maps.length, (i) {
    return Serie.fromMap(maps[i]);
  });
}

// Fetch seasons by series ID
Future<List<int>> fetchSeasonsBySeriesId(int seriesId) async {
  Database db = await getDatabase();
  final List<Map<String, dynamic>> maps = await db.rawQuery(
    'SELECT DISTINCT temporada FROM episodios WHERE serie_id = ? ORDER BY temporada',
    [seriesId],
  );
  return maps.map((map) => map['temporada'] as int).toList();
}

// Fetch episodes by series ID and season number
Future<List<Map<String, dynamic>>> fetchEpisodesBySeriesIdAndSeason(
    int seriesId, int season) async {
  Database db = await getDatabase();
  return await db.query(
    'episodios',
    where: 'serie_id = ? AND temporada = ?',
    whereArgs: [seriesId, season],
    orderBy: 'episodio',
  );
}

class SeriesWithSeasonsPage extends StatefulWidget {
  final Serie serie; // Accept Serie object in the constructor

  const SeriesWithSeasonsPage({Key? key, required this.serie})
      : super(key: key);

  @override
  _SeriesWithSeasonsPageState createState() => _SeriesWithSeasonsPageState();
}

class _SeriesWithSeasonsPageState extends State<SeriesWithSeasonsPage> {
  late Future<List<int>> _futureSeasons;
  int? _selectedSeason;
  Future<List<Map<String, dynamic>>>? _futureEpisodes;

  @override
  void initState() {
    super.initState();
    _futureSeasons = fetchSeasonsBySeriesId(widget.serie.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Séries e Temporadas: ${widget.serie.nome}'),
      ),
      body: Column(
        children: [
          FutureBuilder<List<int>>(
            future: _futureSeasons,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro ao carregar as temporadas.'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('Nenhuma temporada encontrada.'));
              } else {
                final seasons = snapshot.data!;
                return DropdownButton<int>(
                  hint: Text('Selecione uma temporada'),
                  value: _selectedSeason,
                  items: seasons.map((season) {
                    return DropdownMenuItem<int>(
                      value: season,
                      child: Text('Temporada $season'),
                    );
                  }).toList(),
                  onChanged: (season) {
                    setState(() {
                      _selectedSeason = season;
                      _futureEpisodes = fetchEpisodesBySeriesIdAndSeason(
                        widget.serie.id!,
                        _selectedSeason!,
                      );
                    });
                  },
                );
              }
            },
          ),
          if (_selectedSeason != null)
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _futureEpisodes,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro ao carregar os episódios.'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Nenhum episódio encontrado.'));
                } else {
                  final episodes = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: episodes.length,
                      itemBuilder: (context, index) {
                        final episode = episodes[index];
                        return ListTile(
                          title: Text(
                            'Ep ${episode['episodio']}: ${episode['nome']}',
                          ),
                          subtitle: Text('Duração: ${episode['tempo']} min'),
                        );
                      },
                    ),
                  );
                }
              },
            ),
        ],
      ),
    );
  }
}
