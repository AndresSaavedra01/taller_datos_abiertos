import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../services/department_service.dart';
import '../services/region_service.dart';
import '../services/president_service.dart';
import '../services/touristic_attraction_service.dart';
import '../widgets/basic_state_widget.dart';

class ListadoView extends StatefulWidget {
  final String type;

  const ListadoView({super.key, required this.type});

  @override
  State<ListadoView> createState() => _ListadoViewState();
}

class _ListadoViewState extends State<ListadoView> {
  bool isLoading = true;
  String? errorMessage;
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      if (widget.type == 'departments') {
        items = await DepartmentService().getDepartments();
      } else if (widget.type == 'regions') {
        items = await RegionService().getRegions();
      } else if (widget.type == 'presidents') {
        items = await PresidentService().getPresidents();
      } else if (widget.type == 'attractions') {
        items = await TouristicAttractionService().getAttractions();
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  String _getTitle() {
    switch (widget.type) {
      case 'departments': return 'Departamentos';
      case 'regions': return 'Regiones';
      case 'presidents': return 'Presidentes';
      case 'attractions': return 'Atracciones';
      default: return 'Listado';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle()),
      ),
      body: BasicStateWidget(
        isLoading: isLoading,
        errorMessage: errorMessage,
        onRetry: _fetchData,
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            String name = '';
            String subtitle = '';
            int id = 0;

            if (widget.type == 'departments') {
              name = item.name;
              subtitle = 'Población: ${item.population}';
              id = item.id;
            } else if (widget.type == 'regions') {
              name = item.name;
              subtitle = 'ID: ${item.id}';
              id = item.id;
            } else if (widget.type == 'presidents') {
              name = '${item.name} ${item.lastName}';
              subtitle = item.politicalParty;
              id = item.id;
            } else if (widget.type == 'attractions') {
              name = item.name;
              subtitle = item.description;
              id = item.id;
            }

            return ListTile(
              title: Text(name),
              subtitle: Text(subtitle, maxLines: 2, overflow: TextOverflow.ellipsis),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.push('/detail/${widget.type}/$id');
              },
            );
          },
        ),
      ),
    );
  }
}
