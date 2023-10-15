import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fuks_app/generated/services.pb.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  static const String route = 'project';

  static Future<Object?> open(
    BuildContext context,
    Project project,
  ) =>
      Navigator.of(context).pushNamed(route, arguments: project);

  @override
  Widget build(BuildContext context) {
    final project = ModalRoute.of(context)?.settings.arguments as Project?;

    if (project == null) {
      return const ErrorScaffold(
        title: 'Project',
        error: 'Missing project',
      );
    }

    return _ProjectPage(project);
  }
}

class _ProjectPage extends StatelessWidget {
  const _ProjectPage(this.project);

  final Project project;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: ConstrainedListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Text(
              project.title,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(project.manager.imageUrl),
            ),
            title: Text(
              project.manager.name,
              style: textTheme.titleMedium,
            ),
            subtitle: Text(
              project.manager.eMail,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.primary,
              ),
            ),
            onTap: () => launchUrlString('mailto:${project.manager.eMail}'),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: MarkdownBody(
              onTapLink: (text, href, title) {
                if (href != null) launchUrlString(href);
              },
              data: project.details,
            ),
          ),
        ],
      ),
    );
  }
}
