import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fuks_app/generated/app_services/google/protobuf/empty.pb.dart';
import 'package:fuks_app/generated/app_services/services.pb.dart';
import 'package:fuks_app/services/fuks_cloud.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:fuks_app/ui/widgets/illustration.dart';
import 'package:intl/intl.dart';
import 'package:undraw/illustrations.g.dart';
import 'package:url_launcher/url_launcher_string.dart';

final _dateFormat = DateFormat('dd.MM.yyyy kk:mm');

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  static const String route = 'events';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
      ),
      body: const EventsBody(),
    );
  }

  static void show(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}

class EventsBody extends StatelessWidget {
  const EventsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final titleStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );
    final dateStyle = textTheme.bodySmall?.copyWith(
      color: colorScheme.outline,
      fontWeight: FontWeight.w600,
    );
    final subtitleStyle = textTheme.bodyMedium;

    final now = DateTime.now().add(const Duration(hours: 1));

    return FutureBuilder<Events>(
      future: fuksCloud.getEvents(Empty()),
      builder: (context, snap) {
        if (snap.hasError) {
          return ErrorBody(error: snap.error);
        }

        if (!snap.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snap.data?.items ?? <Event>[];

        if (data.isEmpty) {
          return const Center(
            child: TextIllustration(
              illustration: UnDrawIllustration.void_,
              text: 'Gerade sind keine Events vorhanden',
            ),
          );
        }

        return ConstrainedListViewBuilder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final event = data[index];

            Widget contactAvatar;
            if (event.contact.imageUrl.isNotEmpty) {
              contactAvatar = CircleAvatar(
                backgroundImage: NetworkImage(event.contact.imageUrl),
              );
            } else {
              contactAvatar = const Icon(Icons.alternate_email_outlined);
            }

            return Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: colorScheme.outlineVariant,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (event.label.isNotEmpty)
                    Text(
                      event.label,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  Text(
                    event.title,
                    style: titleStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _dateFormat.format(event.date.toDateTime()),
                    style: dateStyle?.copyWith(
                      decoration: event.date.toDateTime().isBefore(now)
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ActionChip(
                        label: Text(event.contact.name),
                        onPressed: () {
                          launchUrlString('mailto:${event.contact.eMail}');
                        },
                        padding: const EdgeInsets.all(4),
                        avatar: contactAvatar,
                      ),
                      if (event.location.isNotEmpty)
                        ActionChip(
                          label: const Text('Ort'),
                          onPressed: () {
                            launchUrlString(
                              'https://www.google.com/maps/place/${event.location}',
                            );
                          },
                          avatar: const Icon(Icons.pin_drop_outlined),
                        ),
                      if (event.buttonText.isNotEmpty)
                        ActionChip(
                          onPressed: event.buttonHref.isNotEmpty
                              ? () => launchUrlString(event.buttonHref)
                              : null,
                          label: Text(event.buttonText),
                        ),
                    ],
                  ),
                  if (event.subtitle.isNotEmpty) const SizedBox(height: 16),
                  if (event.subtitle.isNotEmpty)
                    MarkdownBody(
                      data: event.subtitle,
                      onTapLink: (_, href, __) {
                        if (href != null) {
                          launchUrlString(href);
                        }
                      },
                      styleSheet: MarkdownStyleSheet(
                        p: subtitleStyle,
                        listBullet: subtitleStyle,
                        listIndent: 20,
                      ),
                    ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
