import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app_api_bloc/features/posts/bloc/postbloc_bloc.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PostPage> {
  final PostblocBloc postblocBloc = PostblocBloc();
  @override
  void initState() {
    postblocBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text(
            "post Page",
            style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 25),
          ),
        ),
        body: BlocConsumer<PostblocBloc, PostblocState>(
          bloc: postblocBloc,
          listenWhen: (previous, current) => current is PostsActionState,
          buildWhen: (previous, current) => current is! PostsActionState,
          builder: (BuildContext context, state) {
            switch (state.runtimeType) {
              case PostsFetchingLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case PostFetchingSuccessfullState:
                final successState = state as PostFetchingSuccessfullState;
                return Container(
                  color: Colors.grey.shade300,
                  margin: const EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: successState.posts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.grey.shade500,
                        margin: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                                color: Colors.grey.shade500,
                                child: Text(
                                  successState.posts[index].title,
                                  style: GoogleFonts.k2d(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 2 / 10,
                            ),
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  successState.posts[index].body,
                                  style: GoogleFonts.arima(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      letterSpacing: 1.2,
                                      wordSpacing: 4),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 2.5 / 10,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              default:
                return const SizedBox();
            }
          },
          listener: (BuildContext context, Object? state) {},
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: (){
          postblocBloc.add(PostAddEvent());
        }),
      ),
    );
  }
}
