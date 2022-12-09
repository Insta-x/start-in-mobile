class Project {
  final int id;
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
    required this.id,
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
      id: json['pk'],
      username: json['fields']['owner_username'],
      timeCreated: DateTime.parse(json['fields']['time_created']),
      title: json['fields']['title'],
      description: json['fields']['description'],
      donationTarget: json['fields']['donation_target'],
      currentDonation: json['fields']['current_donation'],
      likeCount: json['fields']['like_count'],
      isPublished: json['fields']['is_published'],
      isDone: json['fields']['is_done'],
      isLiked: json['fields']['is_liked'],
    );
  }
}
