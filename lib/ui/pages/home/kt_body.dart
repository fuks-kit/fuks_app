import 'package:flutter/material.dart';
import 'package:fuks_app/services/fuks.dart';
import 'package:fuks_app/ui/pages/home/header.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:undraw/illustrations.g.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
          itemCount: data.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const HeaderWithIllustration(
                title: 'Karlsruher Transfer',
                subtitle:
                    'The Karlsruher Transfer a free magazine for students in Karlsruhe',
                illustration: UnDrawIllustration.reading,
              );
            }

            final kt = data[index - 1];

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
