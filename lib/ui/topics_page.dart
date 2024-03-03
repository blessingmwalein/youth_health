import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youthhealth/bloc/service/service_bloc.dart';
import 'package:youthhealth/bloc/topic/topic_bloc.dart';
import 'package:youthhealth/constants/theme.dart';
import 'package:youthhealth/routes/app_router.dart';
import 'package:youthhealth/ui/util/app_container.dart';
import 'package:youthhealth/ui/util/icon.dart';
import 'package:youthhealth/ui/util/shared/heading_text.dart';
import 'package:youthhealth/ui/util/shared/service_card.dart';
import 'package:youthhealth/ui/util/shared/symptom_card.dart';
import 'package:youthhealth/ui/util/shared/toll_free_card.dart';

@RoutePage()
class TopicsPage extends StatefulWidget {
  const TopicsPage({Key? key}) : super(key: key);

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  @override
  void initState() {
    BlocProvider.of<TopicBloc>(context).add(const GetTopics());
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      title: 'Topics',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              BlocBuilder<TopicBloc, TopicBlocState>(
                builder: (context, state) {
                  if (state is TopicSuccess) {
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemCount: state.topics.length,
                      itemBuilder: (context, index) {
                        final topic = state.topics[index];
                        return InkWell(
                          onTap: () {
                            context.router.push(TopicSingleRoute(topic: topic));
                          },
                          child: symptomCard(topic),
                        );
                      },
                    );
                  } else if (state is TopicLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(child: Text('Something went wrong'));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
