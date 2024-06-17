import 'package:flutter/material.dart';
import 'package:fuks_app/generated/app_services/google/protobuf/empty.pb.dart';
import 'package:fuks_app/generated/app_services/services.pb.dart';
import 'package:fuks_app/services/app_services.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:fuks_app/ui/widgets/illustration.dart';
import 'package:undraw/undraw.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LinksBody extends StatelessWidget {
  const LinksBody({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final titleStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );
    final subtitleStyle = textTheme.bodySmall;

    return FutureBuilder<Links>(
      future: fuksCloud.getLinks(Empty()),
      builder: (context, snap) {
        if (snap.hasError) {
          return ErrorBody(error: snap.error);
        }

        if (!snap.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snap.data?.items ?? <Link>[];

        if (data.isEmpty) {
          return const Center(
            child: TextIllustration(
              illustration: UnDrawIllustration.void_,
              text: 'Gerade sind keine Links verfügbar',
            ),
          );
        }

        return ConstrainedListViewBuilder(
          divider: Divider(
            indent: 16,
            endIndent: 16,
            thickness: 0.5,
            color: colorScheme.outlineVariant,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];

            return ListTile(
              title: Text(
                item.title,
                style: titleStyle,
              ),
              subtitle: item.description.isNotEmpty
                  ? Text(
                      item.description,
                      style: subtitleStyle,
                      maxLines: 3,
                    )
                  : null,
              onTap: () => launchUrlString(item.url),
            );
          },
        );
      },
    );
  }
}
