import 'package:flutter/material.dart';
import 'package:fuks_app/services/fuks.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:intl/intl.dart';

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

    final titleStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );
    final subtitleStyle = textTheme.bodySmall?.copyWith(
      color: colorScheme.outline,
    );

    return FutureBuilder<Events>(
      future: fuks.getEvents(),
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
              decoration: BoxDecoration(
                border: Border.all(
                  color: colorScheme.outlineVariant,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (event.label != null)
                          Text(
                            event.label!,
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.primary,
                            ),
                          ),
                        Text(
                          event.title,
                          style: titleStyle,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      event.subtitle,
                      style: subtitleStyle,
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: 32,
                    dense: true,
                    leading: const Icon(Icons.event_outlined),
                    title: const Text('Date'),
                    subtitle: Text(
                      _dateFormat.format(event.date!),
                      style: subtitleStyle,
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: 32,
                    dense: true,
                    leading: const Icon(Icons.pin_drop_outlined),
                    title: const Text('Location'),
                    subtitle: Text(
                      event.location!,
                      style: subtitleStyle,
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: 32,
                    dense: true,
                    leading: const Icon(Icons.email_outlined),
                    title: const Text('Contact'),
                    subtitle: Text(
                      '${event.contactName} <${event.contactEMail}>',
                      style: subtitleStyle,
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
