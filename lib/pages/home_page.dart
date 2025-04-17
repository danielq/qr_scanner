import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/pages.dart';
import 'package:qr_scanner/providers/db_provider.dart';
import 'package:qr_scanner/providers/ui_providers.dart';
import 'package:qr_scanner/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Historial'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationbar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);
    // cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;
    // TODO: Temporal leer la base de datos
    // final tempScan = new ScanModel(valor: 'http://google.com');
    // DbProvider.db.nuevoScan(tempScan);
    // DbProvider.db.getScanById(4).then((scan) => print(scan?.valor));
    // DbProvider.db.getTodosLosScans().then(print);
    // DbProvider.db.deleteAllScan().then(print);
    switch (currentIndex) {
      case 0:
        return MapasPage();
      case 1:
        return DireccionesPage();
      default:
        return MapasPage();
    }
  }
}
