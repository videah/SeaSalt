import 'package:extended_theme/extended_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seasalt/models/post/post_tags.dart';
import 'package:seasalt/style.dart';

class TagColumn extends StatelessWidget {
  final PostTags tags;

  const TagColumn({Key? key, required this.tags}) : super(key: key);

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
        ),
        // TagTile(category: "Copyrights", color: Colors.red, tags: tags ?? []),
        TagTile(
          category: "Characters",
          color: theme.characterTagColor ?? Colors.green,
          tags: tags.character ?? [],
        ),
        TagTile(
          category: "Species",
          color: theme.speciesTagColor ?? Colors.red,
          tags: tags.species ?? [],
        ),
        TagTile(
          category: "General",
          color: theme.generalTagColor ?? Colors.white,
          tags: tags.general ?? [],
        ),
        TagTile(
          category: "Meta",
          color: theme.metaTagColor ?? Colors.white,
          tags: tags.meta ?? [],
        ),
        TagTile(
          category: "Lore",
          color: theme.loreTagColor ?? Colors.green,
          tags: tags.lore ?? [],
        ),
      ],
    );
  }
}

class TagTile extends StatelessWidget {
  final String category;
  final Color color;
  final List<String> tags;

  const TagTile(
      {Key? key,
      required this.category,
      required this.color,
      required this.tags})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("$category", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
        for (var tag in tags)
          Text(
            "$tag",
            style: TextStyle(color: color),
          ),
      ],
    );
  }
}
