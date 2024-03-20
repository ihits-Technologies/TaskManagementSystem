class Chat {
final String id;

  final String name;
  final String imageUrl;
  final String lastMessage;
  final DateTime lastMessageTime;
  final bool hasUnreadMessages;
  final bool isOnline;

  Chat({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.hasUnreadMessages,
    this.isOnline = false

  });
}
