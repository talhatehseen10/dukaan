class NotificationData {
  int? id;
  int? userId;
  String? content;
  String? type;
  int? read;
  DateTime? createdAt;
  DateTime? updatedAt;

  NotificationData({
    this.id,
    this.userId,
    this.content,
    this.type,
    this.read,
    this.createdAt,
    this.updatedAt,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        id: json["id"],
        userId: json["user_id"],
        content: json["content"],
        type: json["type"],
        read: json["read"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "content": content,
        "type": type,
        "read": read,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
