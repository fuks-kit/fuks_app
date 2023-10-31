import 'package:flutter/material.dart';
import 'package:fuks_app/generated/app_services/google/protobuf/empty.pb.dart';
import 'package:fuks_app/generated/app_services/services.pb.dart';
import 'package:fuks_app/services/fuks_cloud.dart';
import 'package:fuks_app/ui/pages/project/project_page.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:fuks_app/ui/widgets/illustration.dart';
import 'package:undraw/undraw.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  static const String route = 'projects';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projekte'),
      ),
      body: const ProjectsBody(),
    );
  }

  static void show(BuildContext context) {
    Navigator.of(context).pushNamed(route);
  }
}

class ProjectsBody extends StatelessWidget {
  const ProjectsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final titleStyle = textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.bold,
    );

    return FutureBuilder<Projects>(
      future: fuksCloud.getProjects(Empty()),
      builder: (context, snap) {
        if (snap.hasError) {
          return ErrorBody(error: snap.error);
        }

        if (!snap.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snap.data?.items ?? <Project>[];

        if (data.isEmpty) {
          return const Center(
            child: TextIllustration(
              illustration: UnDrawIllustration.void_,
              text: 'Gerade sind keine Projekte vorhanden',
            ),
          );
        }

        return ConstrainedListViewBuilder(
          divider: Divider(
            height: 24,
            indent: 16,
            endIndent: 16,
            thickness: 0.5,
            color: colorScheme.outlineVariant,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final project = data[index];

            return ListTile(
              trailing: CircleAvatar(
                backgroundImage: NetworkImage(project.manager.imageUrl),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: double.infinity),
                  if (project.label.isNotEmpty)
                    Text(
                      project.label,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Text(
                    project.title,
                    style: titleStyle,
                  ),
                ],
              ),
              subtitle: project.subtitle.isNotEmpty
                  ? Text(
                      project.subtitle,
                      maxLines: 2,
                    )
                  : null,
              onTap: () {
                ProjectPage.open(context, project);
              },
            );
          },
        );
      },
    );
  }
}
