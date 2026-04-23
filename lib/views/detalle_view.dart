import 'package:flutter/material.dart';
import '../services/department_service.dart';
import '../services/region_service.dart';
import '../services/president_service.dart';
import '../services/touristic_attraction_service.dart';
import '../widgets/basic_state_widget.dart';

class DetalleView extends StatefulWidget {
  final String type;
  final String id;

  const DetalleView({super.key, required this.type, required this.id});

  @override
  State<DetalleView> createState() => _DetalleViewState();
}

class _DetalleViewState extends State<DetalleView> {
  bool isLoading = true;
  String? errorMessage;
  dynamic item;

  @override
  void initState() {
    super.initState();
    _fetchDetail();
  }

  Future<void> _fetchDetail() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final int parsedId = int.parse(widget.id);
      if (widget.type == 'departments') {
        item = await DepartmentService().getDepartmentById(parsedId);
      } else if (widget.type == 'regions') {
        item = await RegionService().getRegionById(parsedId);
      } else if (widget.type == 'presidents') {
        item = await PresidentService().getPresidentById(parsedId);
      } else if (widget.type == 'attractions') {
        item = await TouristicAttractionService().getAttractionById(parsedId);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle'),
      ),
      body: BasicStateWidget(
        isLoading: isLoading,
        errorMessage: errorMessage,
        onRetry: _fetchDetail,
        child: item != null ? _buildDetailContent() : const Center(child: Text('No data')),
      ),
    );
  }

  Widget _buildDetailContent() {
    String title = '';
    Map<String, String> details = {};

    if (widget.type == 'departments') {
      title = item.name;
      details = {
        'Descripción': item.description,
        'Población': item.population.toString(),
        'Superficie': '${item.surface} km²',
      };
    } else if (widget.type == 'regions') {
      title = item.name;
      details = {
        'Descripción': item.description,
      };
    } else if (widget.type == 'presidents') {
      title = '${item.name} ${item.lastName}';
      details = {
        'Partido Político': item.politicalParty,
        'Descripción': item.description,
      };
    } else if (widget.type == 'attractions') {
      title = item.name;
      details = {
        'Ciudad ID': item.cityId,
        'Descripción': item.description,
      };
    }

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        ...details.entries.map((entry) => Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entry.key,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                entry.value,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        )),
      ],
    );
  }
}
