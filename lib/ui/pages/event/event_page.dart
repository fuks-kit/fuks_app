import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fuks_app/generated/app_services/services.pb.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:fuks_app/utils/date.dart';
import 'package:url_launcher/url_launcher_string.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  static const String route = 'event';

  static Future<Object?> open(
    BuildContext context,
    Event event,
  ) =>
      Navigator.of(context).pushNamed(route, arguments: event);

  @override
  Widget build(BuildContext context) {
    final event = ModalRoute.of(context)?.settings.arguments as Event?;

    if (event == null) {
      return const ErrorScaffold(
        title: 'Event',
        error: 'Missing event',
      );
    }

    return _EventPage(event);
  }
}

class _EventPage extends StatelessWidget {
  const _EventPage(this.event);

  final Event event;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    Widget managerAvatar;
    if (event.contact.imageUrl.isNotEmpty) {
      managerAvatar = CircleAvatar(
        backgroundImage: NetworkImage(event.contact.imageUrl),
      );
    } else {
      managerAvatar = const CircleAvatar(
        child: Icon(Icons.person),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
      ),
      body: ConstrainedListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: MarkdownBody(
              onTapLink: (text, href, title) {
                if (href != null) launchUrlString(href);
              },
              data: event.details,
            ),
          ),
          const Divider(height: 24),
          ListTile(
            title: Text(
              event.contact.name,
              style: textTheme.titleSmall,
            ),
            subtitle: Text(event.contact.eMail),
            onTap: () {
              launchUrlString('mailto:${event.contact.eMail}');
            },
            leading: managerAvatar,
          ),
          ListTile(
            title: Text(
              'Datum',
              style: textTheme.titleSmall,
            ),
            subtitle: Text(GermanDateUtils.format(event.date)),
            leading: CircleAvatar(
              foregroundColor: colorScheme.onSurfaceVariant,
              backgroundColor: colorScheme.surfaceVariant,
              child: const Icon(Icons.event),
            ),
          ),
          if (event.location.isNotEmpty)
            ListTile(
              title: Text(
                'Ort',
                style: textTheme.titleSmall,
              ),
              subtitle: Text(event.location),
              onTap: () {
                launchUrlString(
                  'https://www.google.com/maps/place/${event.location}',
                );
              },
              leading: CircleAvatar(
                foregroundColor: colorScheme.onSurfaceVariant,
                backgroundColor: colorScheme.surfaceVariant,
                child: const Icon(Icons.pin_drop_outlined),
              ),
            ),
          if (event.buttonText.isNotEmpty)
            ListTile(
              onTap: () => launchUrlString(event.buttonHref),
              title: Text(
                event.buttonText,
                style: textTheme.titleSmall,
              ),
              subtitle: Text(
                event.buttonHref,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              leading: CircleAvatar(
                foregroundColor: colorScheme.onSurfaceVariant,
                backgroundColor: colorScheme.surfaceVariant,
                child: const Icon(Icons.open_in_new),
              ),
            ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
