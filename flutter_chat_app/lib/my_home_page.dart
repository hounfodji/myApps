import 'package:flutter/material.dart';
import 'package:flutter_chat_app/message.dart';
import 'package:flutter_chat_app/theme_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [
    Message(text: "Hi", isUser: true),
    Message(text: "Hello, what's up ?", isUser: false),
    Message(text: "Great and you ?", isUser: true),
    Message(text: "I'm excellent", isUser: false),
  ];

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
       appBar: AppBar(
        centerTitle: false,
         backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/images/gpt-robot.png'),
                SizedBox(width: 10,),
                Text('Gemini Gpt', style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            GestureDetector(
                child: (currentTheme == ThemeMode.dark) ? Icon(Icons.light_mode, color: Theme.of(context).colorScheme.secondary,) : Icon(Icons.dark_mode,  color: Theme.of(context).colorScheme.primary,),
              onTap: (){
                  ref.read(themeProvider.notifier).toggleTheme();
              },
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index){
                  final message = _messages[index];
                  return ListTile(
                    title: Align(
                      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: message.isUser ? Theme.of(context).colorScheme.primary :
                            Theme.of(context).colorScheme.secondary,
                            borderRadius: message.isUser ?
                            BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20)
                            ) :
                            BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                            )
                          ),
                          child: Text(
                              message.text,
                            style: message.isUser ? Theme.of(context).textTheme.bodyMedium :
                            Theme.of(context).textTheme.bodySmall
                          )
                      ),
                    ),
                  );
                }
            ),
          ),

          // user input
          Padding(
            padding: const EdgeInsets.only(bottom: 32,top: 16.0, left: 16.0, right: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3)
                  )
                ]
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: Theme.of(context).textTheme.titleSmall,
                      decoration: InputDecoration(
                        hintText: 'Write your message',
                        hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.grey
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20)
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  
                   Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      child: Image.asset('assets/images/send.png'),
                      onTap: (){},
                    ),
                   ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}