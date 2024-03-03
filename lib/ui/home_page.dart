import 'dart:math';

import 'package:youthhealth/bloc/service/service_bloc.dart';
import 'package:youthhealth/models/topic_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youthhealth/bloc/info/info_bloc.dart';
import 'package:youthhealth/bloc/topic/topic_bloc.dart';
import 'package:youthhealth/constants/theme.dart';
import 'package:youthhealth/routes/app_router.dart';
import 'package:youthhealth/ui/util/app_container.dart';
import 'package:youthhealth/ui/util/icon.dart';
import 'package:youthhealth/ui/util/shared/heading_text.dart';
import 'package:youthhealth/ui/util/shared/home_slider.dart';
import 'package:youthhealth/ui/util/shared/info_card.dart';
import 'package:youthhealth/ui/util/shared/service_card.dart';
import 'package:youthhealth/ui/util/shared/symptom_card.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> hexColors = [
    '#4294FF',
    '#FF914D',
    '#4C51B9',
    '#FF0393',
    '#A167BA',
    '#FFDE59',
    '#FF5757'
  ];

  @override
  void initState() {
    BlocProvider.of<TopicBloc>(context).add(const GetTopics());
    BlocProvider.of<ServiceBloc>(context).add(const GetServices());

    // BlocProvider.of<InvoiceBloc>(context)
    //     .add(GetInvoicesByLoadSheetId(loadSheetId: state.loadSheet.id ?? 0));
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
        title: 'Home',
        child: SingleChildScrollView(
            child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const HomeSlider(imageHeight: 200.0),
                // Row(
                //   children: [
                //     Expanded(
                //       child: Container(
                //         // width: 200, // Adjust the width as needed
                //         height: 50, // Adjust the height as needed
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(
                //               10), // Adjust the radius for rounded corners
                //           border: Border.all(
                //             color: Colors.grey
                //                 .withOpacity(0.4), // Set the border color
                //             width: 1.0, // Set the border width
                //           ),
                //         ),
                //         child: Row(
                //           children: [
                //             Padding(
                //               padding: EdgeInsets.all(5.0),
                //               child: myIcon(
                //                   path: "assets/icons/search.svg",
                //                   width: 30,
                //                   height: 30),
                //             ),
                //             const Expanded(
                //               child: TextField(
                //                 decoration: InputDecoration(
                //                   hintText: 'Filter Health Services',
                //                   hintStyle: TextStyle(
                //                     color: Colors.grey,
                //                     fontSize: 22,
                //                   ),
                //                   border: InputBorder.none,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     const SizedBox(width: 10),
                //     Container(
                //       width: 50,
                //       height: 50,
                //       padding: const EdgeInsets.all(5),
                //       decoration: BoxDecoration(
                //         color: primaryBlue,
                //         borderRadius: BorderRadius.circular(10),
                //         border: Border.all(
                //           color: primaryBlue,
                //           width: 2,
                //         ),
                //       ),
                //       child: myIcon(
                //           path: "assets/icons/adjustments.svg",
                //           width: 30,
                //           height: 30,
                //           iconColor: Colors.white),
                //     )
                //   ],
                // ),
                const SizedBox(height: 10),
                BlocBuilder<TopicBloc, TopicBlocState>(
                  builder: (context, state) {
                    if (state is TopicSuccess) {
                      List<Topic> firstSixTopics =
                          state.topics.take(6).toList();

                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: firstSixTopics.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          // Assuming each symptom has a `name` and an `imagePath`
                          final infor = firstSixTopics[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: getRandomColor(hexColors),
                            ),
                            child: Text(
                              infor.title ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is TopicLoading) {
                      return Container(child: CircularProgressIndicator());
                    } else {
                      return Container(child: Text('Something went wrong'));
                    }
                  },
                ),
                // headingText("Frequent Topics", () {
                //   context.router.push(const TopicsRoute());
                // }),
                // const SizedBox(height: 10),
                // BlocBuilder<TopicBloc, TopicBlocState>(
                //   builder: (context, state) {
                //     if (state is TopicSuccess) {
                //       List<Topic> firstSixTopics =
                //           state.topics.take(6).toList();

                //       return GridView.builder(
                //         physics: const NeverScrollableScrollPhysics(),
                //         shrinkWrap: true,
                //         gridDelegate:
                //             const SliverGridDelegateWithMaxCrossAxisExtent(
                //           maxCrossAxisExtent: 150,
                //           mainAxisSpacing: 1,
                //           crossAxisSpacing: 1,
                //           childAspectRatio: 1,
                //         ),
                //         itemCount: firstSixTopics.length,
                //         itemBuilder: (context, index) {
                //           final topic = firstSixTopics[index];
                //           return InkWell(
                //             onTap: () {
                //               context.router
                //                   .push(TopicSingleRoute(topic: topic));
                //             },
                //             child: symptomCard(topic),
                //           );
                //         },
                //       );
                //     } else if (state is TopicLoading) {
                //       return Container(child: CircularProgressIndicator());
                //     } else {
                //       return Container(child: Text('Something went wrong'));
                //     }
                //   },
                // ),
                const SizedBox(height: 10),
                // headingText("SHRH Information", () {
                //   context.router.push(const InforRoute());
                // }),
                const Text(
                  'Youth Friendly Health Services Near you.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 10),

                // BlocBuilder<InfoBloc, InfoBlocState>(builder: (context, state) {
                //   if (state is InfoSuccess) {
                //     return ListView.builder(
                //       physics: const NeverScrollableScrollPhysics(),
                //       itemCount: state.infos.length,
                //       shrinkWrap: true,
                //       itemBuilder: (context, index) {
                //         // Assuming each symptom has a `name` and an `imagePath`
                //         final infor = state.infos[index];
                //         return Column(
                //           children: [
                //             InforCard(
                //               info: infor,
                //             ),
                //             const SizedBox(height: 10),
                //           ],
                //         );
                //       },
                //     );
                //   } else if (state is InfoLoading) {
                //     return Container(child: CircularProgressIndicator());
                //   } else {
                //     return Container(child: Text('Something went wrong'));
                //   }
                // }),

                BlocBuilder<ServiceBloc, ServiceBlocState>(
                    builder: (context, state) {
                  if (state is ServiceSuccess) {
                    return SizedBox(
                      height: 300,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.services.length,
                        // shrinkWrap: true,
                        itemBuilder: (context, index) {
                          // Assuming each symptom has a `name` and an `imagePath`
                          final infor = state.services[index];
                          return InkWell(
                            onTap: () => () {
                              context.router.push(
                                  ServiceSingleRoute(service: infor));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/search.jpeg',
                                    height: 100,
                                    width: 100,
                                  ),
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      infor.title ?? '',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is ServiceLoading) {
                    return Container(child: CircularProgressIndicator());
                  } else {
                    return Container(child: Text('Something went wrong'));
                  }
                }),
              ],
            ),
          ),
        )));
  }

  Color getRandomColor(List<String> hexColors) {
    Random random = Random();
    String randomHexColor = hexColors[random.nextInt(hexColors.length)];
    // Remove the '#' character before parsing
    randomHexColor = randomHexColor.replaceAll('#', '');
    return Color(int.parse(randomHexColor, radix: 16) | 0xFF000000);
  }
}
