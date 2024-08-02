import 'dart:io';
import 'package:registro_series/database/dao/seriedao.dart';
import 'package:registro_series/model/serie.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<void> main() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
  }

  databaseFactory = databaseFactoryFfi;

  // Dog meucachorro = Dog(id: 1, nome: 'Vitor', idade: 10);
  // Dog meucachorro2 = Dog(id: 2, nome: 'Gabriel', idade: 3);

  // insertDog(meucachorro);
  // insertDog(meucachorro2);

  // List dados = await findall();

  debugPrint(findall().toString());

  runApp(MaterialApp(home: TelaPrincipal()));
}

class TelaPrincipal extends StatefulWidget {
  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final List<Map<String, dynamic>> dados = [
    {'id': 1, 'nome': 'Série 1', 'progresso': 0.7, 'avaliacao': 4},
    {'id': 2, 'nome': 'Série 2', 'progresso': 0.5, 'avaliacao': 3},
    {'id': 3, 'nome': 'Série 3', 'progresso': 0.9, 'avaliacao': 5},
  ];

  void deleteById(int id) {
    dados.removeWhere((item) => item['id'] == id);
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
                setState(() {
                  deleteById(id);
                });
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
      // body: FutureBuilder(
      //   initialData: [],
      //   future: findall(),
      //   builder: (context, snapshot) {
      //     switch (snapshot.connectionState) {
      //       case ConnectionState.none:
      //         return Center(
      //             child: Text('Não houve conexão com o banco de dados'));
      //       case ConnectionState.active:
      //       case ConnectionState.waiting:
      //         return const Center(child: CircularProgressIndicator());
      //       case ConnectionState.done:
      //         List<Map> dados = snapshot.data as List<Map>;

      //         return ListView.builder(
      //           itemCount: dados.length,
      //           itemBuilder: (context, index) {
      //             return ListTile(
      //               title: Text('Nome: ${dados[index]['nome']}'),
      //               subtitle: Text('Idade: ${dados[index]['idade']}'),
      //               trailing: IconButton(
      //                   onPressed: () {
      //                     setState(() {
      //                       deleteById(dados[index]['id']);
      //                     });
      //                   },
      //                   icon: const Icon(Icons.delete)),
      //             );
      //           },
      //         );
      //     }
      //   },
      // ),
      body: ListView.builder(
        itemCount: dados.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(dados[index]['id'].toString()),
            direction: DismissDirection.endToStart,
            confirmDismiss: ((direction) async {
              await confirmDelete(
                  context, dados[index]['id'], dados[index]['nome']);
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
                        child: Icon(Icons.image, color: Colors.grey[700]),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nome: ${dados[index]['nome']}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: dados[index]['progresso'],
                              backgroundColor: Colors.grey[300],
                              color: Color.fromARGB(255, 35, 49, 223),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: List.generate(5, (starIndex) {
                                return Icon(
                                  starIndex < dados[index]['avaliacao']
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Color.fromARGB(255, 35, 49, 223),
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
