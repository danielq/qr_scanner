import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({super.key, required this.tipo});
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (_, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
          child: Icon(Icons.delete_forever),
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
              .borrarScanPorId(scans[i]!.id!);
        },
        child: ListTile(
            leading: Icon(
                tipo == 'http' ? Icons.home_outlined : Icons.map_outlined,
                color: Theme.of(context).primaryColor),
            title: Text(scans[i].valor),
            subtitle: Text(scans[i].id.toString()),
            trailing:
                Icon(Icons.keyboard_double_arrow_right, color: Colors.blueGrey),
            onTap: () => launchURL(scans[i], context)),
      ),
    );
  }
}
