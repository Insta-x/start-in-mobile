import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:start_in_mobile/queries/projects/like_project.dart';

class ProjectLikeButton extends StatefulWidget {
  int projectId;
  int likeCount;
  bool isLiked;
  ProjectLikeButton(
      {super.key,
      required this.projectId,
      required this.likeCount,
      required this.isLiked});

  @override
  State<ProjectLikeButton> createState() => _ProjectLikeButtonState();
}

class _ProjectLikeButtonState extends State<ProjectLikeButton> {
  int likeCount = 0;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();

    likeCount = widget.likeCount;
    isLiked = widget.isLiked;
  }

  @override
  void didUpdateWidget(ProjectLikeButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    setState(() {
      likeCount = widget.likeCount;
      isLiked = widget.isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Container(
      child: Column(
        children: [
          IconButton(
            onPressed: () async {
              if (!request.loggedIn) return;
              Map data = await likeProject(request, widget.projectId);
              setState(() {
                // print('SET STATE');
                // print(data['is_liked']);
                // print(data['like_count']);
                isLiked = data['is_liked'];
                likeCount = data['like_count'];
              });
            },
            icon: isLiked
                ? const Icon(Icons.thumb_up)
                : const Icon(Icons.thumb_up_outlined),
            color: isLiked ? Colors.blue : Colors.black,
          ),
          Text(
            '$likeCount',
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
