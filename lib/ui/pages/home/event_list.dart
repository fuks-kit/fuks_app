import 'package:flutter/material.dart';
import 'package:fuks_app/generated/app_services/google/protobuf/empty.pb.dart';
import 'package:fuks_app/generated/app_services/services.pb.dart';
import 'package:fuks_app/services/app_services.dart';
import 'package:fuks_app/ui/pages/event/event_page.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:fuks_app/ui/widgets/illustration.dart';
import 'package:fuks_app/utils/date.dart';
import 'package:undraw/illustrations.g.dart';

class EventsList extends StatelessWidget {
  const EventsList({super.key});

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
          divider: Divider(
            height: 24,
            indent: 16,
            endIndent: 16,
            thickness: 0.5,
            color: colorScheme.outlineVariant,
          ),
          itemBuilder: (context, index) {
            final event = data[index];

            Widget? contactAvatar;
            if (event.contact.imageUrl.isNotEmpty) {
              contactAvatar = CircleAvatar(
                backgroundImage: NetworkImage(event.contact.imageUrl),
              );
            }

            return ListTile(
              title: Column(
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
                ],
              ),
              subtitle: Text(
                GermanDateUtils.format(event.date),
                style: dateStyle?.copyWith(
                  decoration: event.date.toDateTime().isBefore(now)
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              trailing: contactAvatar,
              onTap: () => EventPage.open(context, event),
            );
          },
        );
      },
    );
  }
}
