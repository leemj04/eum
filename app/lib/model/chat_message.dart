enum Sender { user, bot }

class ChatMessage {
  final Sender sender;
  final String text;
  final String time;

  ChatMessage({
    required this.sender,
    required this.text,
    required this.time,
  });
}
