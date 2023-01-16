import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget(
      {Key? key,
      this.imgUrl,
      this.repositoryName,
      this.ownersName,
      this.stargazersCount,
      this.watchers})
      : super(key: key);

  final String? imgUrl;
  final String? repositoryName;
  final String? ownersName;
  final String? stargazersCount;
  final String? watchers;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.grey,
      child: ListTile(
        leading: Image(
          image: CachedNetworkImageProvider(
            imgUrl ?? "",
          ),
        ),
        title: Text(repositoryName!),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ownersName ?? ""),
            Text(watchers ?? ""),
          ],
        ),
        trailing: Text("$stargazersCount ⭐"),
      ),
    );
  }
}
