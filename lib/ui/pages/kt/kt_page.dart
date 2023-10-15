import 'package:flutter/material.dart';
import 'package:fuks_app/services/fcs.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:url_launcher/url_launcher_string.dart';

class KTPage extends StatelessWidget {
  const KTPage({super.key});

  static const String route = 'karlsruher-transfer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karlsruher Transfer'),
      ),
      body: const KTBody(),
    );
  }

  static void show(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}

class KTBody extends StatelessWidget {
  const KTBody({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final titleStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final subtitleStyle = textTheme.bodySmall?.copyWith(
      color: colorScheme.outline,
    );

    return FutureBuilder<KarlsruherTransferEditions>(
      future: fuks.getKarlsruherTransfers(),
      builder: (context, snap) {
        if (snap.hasError) {
          return ErrorBody(error: snap.error);
        }

        if (!snap.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snap.data?.items ?? <KarlsruherTransferEdition>[];

        if (data.isEmpty) {
          return const Text('No data');
        }

        return ConstrainedListViewBuilder(
          divider: Divider(
            indent: 16,
            endIndent: 16,
            color: colorScheme.outlineVariant,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final kt = data[index];

            return ListTile(
              title: Text(
                kt.title,
                style: titleStyle,
              ),
              subtitle: Text(
                kt.subtitle,
                style: subtitleStyle,
              ),
              onTap: () => launchUrlString(kt.pdfUrl),
              trailing: Image.network(kt.imageUrl),
            );
          },
        );
      },
    );
  }
}
