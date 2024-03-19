  class ActionItem {
    final String title;
    final String assignedPerson;
    final String date;
    final bool isPending;
    final List<String> actionsTaken;

    ActionItem({
      required this.title,
      required this.assignedPerson,
      required this.date,
      required this.isPending,
      required this.actionsTaken
    });
  }
