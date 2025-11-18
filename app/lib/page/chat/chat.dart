import 'package:flutter/material.dart';
import '../../constant/test_data.dart';
import '../../model/chat_message.dart';
import '../../widgets/chat_bubble.dart';
import 'chat_controller.dart';

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _AiChatPageState();
}

class _AiChatPageState extends State<AiChatPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ChatController _chatController = ChatController(initial: testMessages);
  double _lastBottomInset = 0;

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    FocusScope.of(context).unfocus();

    setState(() {
      _chatController.handleUserSend(text);
    });

    _controller.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final position = _scrollController.position;
      final target = position.maxScrollExtent;

      _scrollController.jumpTo(target);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    if (bottomInset != _lastBottomInset) {
      _lastBottomInset = bottomInset;
      if (bottomInset > 0) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollToBottom();
        });
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFFEFE3D8),
        resizeToAvoidBottomInset: true,

        body: SafeArea(
          child: Column(
            children: [
              const _ChatAppBar(),

              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1F1F1F),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      const ChatDateDivider(text: '25/11/18 TUE'),
                      const SizedBox(height: 8),

                      Expanded(
                        child: GestureDetector(
                          onTap: () => FocusScope.of(context).unfocus(),
                          child: ListView.builder(
                            controller: _scrollController,
                            physics: const ClampingScrollPhysics(),
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: 8,
                            ), // bottom padding 없음
                            itemCount: _chatController.messages.length,
                            itemBuilder: (context, index) {
                              final msg = _chatController.messages[index];
                              final isLast =
                                  index == testMessages.length - 1;
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: isLast ? 4 : 12,
                                ),
                                child: ChatBubble(message: msg),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _InputBar(
                controller: _controller,
                onSend: _sendMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatAppBar extends StatelessWidget {
  const _ChatAppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 12),
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AI 챗봇 이음',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '이음에게 필요한 정책에 대해 자유롭게 질문해 보세요!',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Spacer(),
          TextButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.logout, size: 18),
            label: const Text('나가기'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

/// 하단 입력창
class _InputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const _InputBar({
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEFE3D8),
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 8,
        bottom: MediaQuery.of(context).viewPadding.bottom + 8,
        // ✅ 하단 SafeArea 고려
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.add,
              size: 18,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: TextField(
                controller: controller,
                minLines: 1,
                maxLines: 4,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '이음에게 무엇이든 물어보세요!',
                ),
                onSubmitted: (_) => onSend(), // 엔터로도 전송
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onSend,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF4C6FFF),
              ),
              child: const Icon(
                Icons.send_rounded,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
