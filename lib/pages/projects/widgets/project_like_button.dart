import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          IconButton(
            onPressed: () {},
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
