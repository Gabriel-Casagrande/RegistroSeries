// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:registro_series/database/dao/seriedao.dart';
import 'package:registro_series/model/serie.dart';

class SelectSeriesPage extends StatefulWidget {
  final List<int> selectedSeriesIds; // IDs das séries atualmente selecionadas

  const SelectSeriesPage({super.key, required this.selectedSeriesIds});

  @override
  _SelectSeriesPageState createState() => _SelectSeriesPageState();
}

class _SelectSeriesPageState extends State<SelectSeriesPage> {
  late Future<List<Serie>> _futureSeries;
  late List<int> _selectedSeriesIds;

  @override
  void initState() {
    super.initState();
    _futureSeries = findAll();
    _selectedSeriesIds =
        List.from(widget.selectedSeriesIds); // Copiar os IDs selecionados
  }

  void _toggleSelection(int id) {
    setState(() {
      if (_selectedSeriesIds.contains(id)) {
        _selectedSeriesIds.remove(id);
      } else {
        _selectedSeriesIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar Séries'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Navigator.pop(context, _selectedSeriesIds);
            },
          ),
        ],
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
                final serie = series[index];
                final isSelected = _selectedSeriesIds.contains(serie.id);

                return ListTile(
                  title: Text(serie.nome),
                  trailing: Icon(
                    isSelected
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    color: isSelected ? Colors.blue : null,
                  ),
                  onTap: () => _toggleSelection(serie.id!),
                );
              },
            );
          }
        },
      ),
    );
  }
}
