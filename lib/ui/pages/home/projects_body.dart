import 'package:flutter/material.dart';
import 'package:fuks_app/services/fuks.dart';
import 'package:fuks_app/ui/pages/home/header.dart';
import 'package:fuks_app/ui/pages/project/project_page.dart';
import 'package:fuks_app/ui/widgets/constrained_list_view.dart';
import 'package:fuks_app/ui/widgets/error_scaffold.dart';
import 'package:undraw/illustrations.g.dart';

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
      future: fuks.getProjects(),
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
          itemCount: data.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const HeaderWithIllustration(
                title: 'Projekte',
                subtitle:
                    'Fuks projects are a great way to get to know other students and to get involved in the student community',
                illustration: UnDrawIllustration.reading,
              );
            }

            final project = data[index - 1];

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
                      // if (project.imageUrl != null)
                      //   Container(
                      //     width: 150,
                      //     alignment: Alignment.center,
                      //     child: Image.network(
                      //       project.imageUrl!,
                      //       color: colorScheme.primary,
                      //     ),
                      //   ),
                      // if (project.illustration != null)
                      //   Align(
                      //     alignment: Alignment.center,
                      //     child: UnDraw(
                      //       width: 150,
                      //       illustration: project.illustration!,
                      //       color: colorScheme.primary,
                      //     ),
                      //   ),
                      if (project.label != null)
                        Text(
                          project.label!,
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
