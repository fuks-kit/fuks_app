import 'package:flutter/material.dart';
import 'package:fuks_app/generated/google/protobuf/empty.pb.dart';
import 'package:fuks_app/generated/services.pb.dart';
import 'package:fuks_app/services/fcs.dart';
import 'package:fuks_app/ui/pages/project/project_page.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';

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
    final subtitleStyle = textTheme.bodySmall?.copyWith(
      color: colorScheme.outline,
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
          return const Text('No data');
        }

        return ConstrainedListViewBuilder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final project = data[index];

            return Container(
              margin: const EdgeInsets.all(8),
              // padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: colorScheme.outlineVariant,
                  width: 1,
                ),
              ),
              child: InkWell(
                onTap: () {
                  ProjectPage.open(context, project);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: double.infinity),
                      // if (project.illustration != null)
                      //   Align(
                      //     alignment: Alignment.center,
                      //     child: UnDraw(
                      //       width: 150,
                      //       illustration: project.illustration!,
                      //       color: colorScheme.primary,
                      //     ),
                      //   ),
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
                      Text(
                        project.subtitle,
                        style: subtitleStyle,
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
