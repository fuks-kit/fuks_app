import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fuks_app/generated/app_services/services.pb.dart';
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
    final textTheme = Theme.of(context).textTheme;

    Widget managerAvatar;
    if (project.manager.imageUrl.isNotEmpty) {
      managerAvatar = CachedNetworkImage(
        placeholder: (context, url) => const CircleAvatar(
          child: Icon(Icons.person),
        ),
        errorWidget: (context, url, error) => const CircleAvatar(
          child: Icon(Icons.person),
        ),
        fit: BoxFit.contain,
        imageUrl: project.manager.imageUrl,
        imageBuilder: (context, imageProvider) =>
            CircleAvatar(backgroundImage: imageProvider),
      );
    } else {
      managerAvatar = const CircleAvatar(
        child: Icon(Icons.person),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
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
              data: project.details,
            ),
          ),
          const Divider(),
          ListTile(
            leading: managerAvatar,
            title: Text(
              project.manager.name,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              project.manager.eMail,
              style: textTheme.bodySmall,
            ),
            onTap: () => launchUrlString('mailto:${project.manager.eMail}'),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
