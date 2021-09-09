import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasalt/models/post/post_tags.dart';
import 'package:seasalt/style.dart';

class TagColumn extends StatelessWidget {
  final PostTags tags;
  final bool? dense;

  const TagColumn({Key? key, required this.tags, this.dense}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = ThemeHolder.themeOf<AppTheme>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TagTile(
          category: "Artists",
          color: theme.artistTagColor ?? Colors.yellow,
          tags: tags.artist ?? [],
          dense: dense,
        ),
        // TagTile(category: "Copyrights", color: Colors.red, tags: tags ?? []),
        TagTile(
          category: "Characters",
          color: theme.characterTagColor ?? Colors.green,
          tags: tags.character ?? [],
          dense: dense,
        ),
        TagTile(
          category: "Species",
          color: theme.speciesTagColor ?? Colors.red,
          tags: tags.species ?? [],
          dense: dense,
        ),
        TagTile(
          category: "General",
          color: theme.generalTagColor ?? Colors.white,
          tags: tags.general ?? [],
          dense: dense,
        ),
        TagTile(
          category: "Meta",
          color: theme.metaTagColor ?? Colors.white,
          tags: tags.meta ?? [],
          dense: dense,
        ),
        TagTile(
          category: "Lore",
          color: theme.loreTagColor ?? Colors.green,
          tags: tags.lore ?? [],
          dense: dense,
        ),
      ],
    );
  }
}

class TagTile extends StatelessWidget {
  final String category;
  final Color color;
  final List<String> tags;
  final bool? dense;

  const TagTile({
    Key? key,
    required this.category,
    required this.color,
    required this.tags,
    this.dense,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) return Container();
    if (dense == true) {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              category,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Wrap(
              spacing: 8,
              children: [
                for (var tag in tags)
                  Text(
                    tag,
                    style: TextStyle(color: color),
                  ),
              ],
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              category,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            for (var tag in tags)
              Text(
                tag,
                style: TextStyle(color: color),
              ),
          ],
        ),
      );
    }
  }
}
