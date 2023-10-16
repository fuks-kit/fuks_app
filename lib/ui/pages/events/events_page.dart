import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fuks_app/generated/google/protobuf/empty.pb.dart';
import 'package:fuks_app/generated/services.pb.dart';
import 'package:fuks_app/services/fuks_cloud.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

final _dateFormat = DateFormat('dd-MM-yyyy kk:mm');

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

    final titleStyle = textTheme.titleLarge?.copyWith(
      fontWeight: FontWeight.w600,
    );
    final dateStyle = textTheme.bodySmall?.copyWith(
      color: colorScheme.outline,
      fontWeight: FontWeight.w600,
    );
    final subtitleStyle = textTheme.bodyMedium;

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
          return const Text('No data');
        }

        return ConstrainedListViewBuilder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final event = data[index];

            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
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
                  Text(
                    event.title,
                    style: titleStyle,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _dateFormat.format(event.date.toDateTime()),
                    style: dateStyle,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ActionChip(
                        label: Text(event.contact.name),
                        onPressed: () {
                          launchUrlString('mailto:${event.contact.eMail}');
                        },
                        avatar: CircleAvatar(
                          backgroundImage: NetworkImage(event.contact.imageUrl),
                        ),
                      ),
                      ActionChip(
                        label: const Text('Location'),
                        onPressed: () {
                          launchUrlString(
                            'https://www.google.com/maps/place/${event.location}',
                          );
                        },
                        avatar: const Icon(Icons.pin_drop_outlined),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  MarkdownBody(
                    data: event.subtitle,
                    styleSheet: MarkdownStyleSheet(
                      p: subtitleStyle,
                      listBullet: subtitleStyle,
                      listIndent: 16,
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
