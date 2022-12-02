class Project {
  final String username;
  final DateTime timeCreated;
  final String title;
  final String description;
  final int donationTarget;
  final int currentDonation;
  final int likeCount;
  final bool isPublished;
  final bool isDone;
  final bool isLiked;

  const Project({
    required this.username,
    required this.timeCreated,
    required this.title,
    required this.description,
    required this.donationTarget,
    required this.currentDonation,
    required this.likeCount,
    required this.isPublished,
    required this.isDone,
    required this.isLiked,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      username: json['owner_username'],
      timeCreated: json['time_created'],
      title: json['title'],
      description: json['description'],
      donationTarget: json['donation_target'],
      currentDonation: json['current_donation'],
      likeCount: json['like_count'],
      isPublished: json['is_published'],
      isDone: json['is_done'],
      isLiked: json['is_liked'],
    );
  }
}
