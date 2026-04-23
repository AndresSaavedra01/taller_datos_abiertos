import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/custom_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Abiertos Colombia'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          CustomCard(
            title: 'Departamentos',
            description: 'Explora los departamentos de Colombia',
            icon: Icons.map,
            onTap: () => context.push('/list/departments'),
          ),
          const SizedBox(height: 16),
          CustomCard(
            title: 'Regiones',
            description: 'Conoce las regiones naturales',
            icon: Icons.landscape,
            onTap: () => context.push('/list/regions'),
          ),
          const SizedBox(height: 16),
          CustomCard(
            title: 'Presidentes',
            description: 'Historia presidencial de Colombia',
            icon: Icons.person,
            onTap: () => context.push('/list/presidents'),
          ),
          const SizedBox(height: 16),
          CustomCard(
            title: 'Atracciones Turísticas',
            description: 'Descubre lugares increíbles',
            icon: Icons.camera_alt,
            onTap: () => context.push('/list/attractions'),
          ),
        ],
      ),
    );
  }
}
