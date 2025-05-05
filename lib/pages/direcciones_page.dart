import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';

class DireccionesPage extends StatelessWidget {
  const DireccionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => ListTile(
        leading:
            Icon(Icons.home_outlined, color: Theme.of(context).primaryColor),
        title: Text(scans[i].valor),
        subtitle: Text(scans[i].id.toString()),
        trailing:
            Icon(Icons.keyboard_double_arrow_right, color: Colors.blueGrey),
        onTap: () => print(scans[i].id),
      ),
    );
  }
}
