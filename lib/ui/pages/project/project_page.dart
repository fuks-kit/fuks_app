import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fuks_app/services/fuks.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: ConstrainedListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
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
