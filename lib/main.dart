import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'data.dart';
import 'halaman_detail.dart';
import 'halaman_tentang.dart';
import 'halaman_wisata.dart';

void main() => runApp(const WisataSumutApp());

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, shell) => KerangkaNavigasi(shell: shell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HalamanWisata(),
              routes: [
                GoRoute(
                  path: 'destinasi/:id',
                  builder: (context, state) {
                    final id = int.tryParse(state.pathParameters['id'] ?? '');
                    return HalamanDetail(
                      destinasi: id == null ? null : cariDestinasi(id),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tentang',
              builder: (context, state) => const HalamanTentang(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class WisataSumutApp extends StatelessWidget {
  const WisataSumutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Wisata Sumatera Utara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00695C)),
      ),
      routerConfig: _router,
    );
  }
}

class KerangkaNavigasi extends StatelessWidget {
  const KerangkaNavigasi({super.key, required this.shell});

  final StatefulNavigationShell shell;

  void _pilihTab(int indeks) {
    shell.goBranch(indeks, initialLocation: indeks == shell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final lebarLayar = MediaQuery.sizeOf(context).width;

    // Layar lebar (>= 840 dp): navigasi samping dengan NavigationRail
    if (lebarLayar >= 840) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: shell.currentIndex,
              onDestinationSelected: _pilihTab,
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.explore_outlined),
                  selectedIcon: Icon(Icons.explore),
                  label: Text('Destinasi'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.info_outline),
                  selectedIcon: Icon(Icons.info),
                  label: Text('Tentang'),
                ),
              ],
            ),
            const VerticalDivider(width: 1),
            Expanded(child: shell),
          ],
        ),
      );
    }

    // Layar sempit (< 840 dp): navigasi bawah dengan NavigationBar
    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: _pilihTab,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Destinasi',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'Tentang',
          ),
        ],
      ),
    );
  }
}