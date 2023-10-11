import 'package:flutter/material.dart';
import 'package:fuks_app/services/fuks.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';

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

  void _onTapEvent(BuildContext context, Event event) {
    if (event.lineThrough) {
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(event.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(event.subtitle),
              const Divider(),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: Icon(Icons.pin_drop),
                title: Text('Location'),
                subtitle: Text('Waldhornstraße 27, 76131 Karlsruhe'),
              ),
              const ListTile(
                contentPadding: EdgeInsets.zero,
                trailing: Icon(Icons.email),
                title: Text('Contact'),
                subtitle: Text('dominik.mueller@fuks.org'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final titleStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w500,
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
              margin: const EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: colorScheme.outlineVariant,
                  width: 1,
                ),
              ),
              child: InkWell(
                onTap: !event.lineThrough
                    ? () => _onTapEvent(context, event)
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (event.label != null)
                        Text(
                          event.label!,
                          style: textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                      Text(
                        event.title,
                        style: titleStyle?.copyWith(
                          decoration: event.lineThrough
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      Text(
                        event.subtitle,
                        style: subtitleStyle?.copyWith(
                          decoration: event.lineThrough
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
