import 'package:deliveristo_test/core/cubit/internet_cubit.dart';
import 'package:deliveristo_test/core/cubit/my_snackbar.dart';
import 'package:deliveristo_test/core/cubit/pageview_cubit.dart';
import 'package:deliveristo_test/core/network/internet_conn_bloc.dart';
import 'package:deliveristo_test/screens/images_list_by_breed.dart';
import 'package:deliveristo_test/screens/images_list_by_breed_and_sub_breed.dart';
import 'package:deliveristo_test/screens/random_image_by_breed.dart';
import 'package:deliveristo_test/screens/random_image_by_breed_and_sub_breed.dart';
import 'package:deliveristo_test/widgets/my_bottom_bar.dart';
import 'package:deliveristo_test/widgets/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //List of Pages
    List<Widget> listPages = [
      const RandomImageByBreed(),
      const ImagesListByBreed(),
      const RandomImageByBreedAndSubBreed(),
      const ImagesListByBreedAndSubBreed(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dogs 🐾'),
        elevation: 5.0,
      ),
      drawer: MediaQuery.of(context).size.width >= 600.0
          ? null
          : Drawer(child: SideBar(pageController: pageController)),
      body: BlocListener<InternetConnBloc, InternetConnState>(
        listener: (context, state) {
          if (state is InternetConnSuccessState) {
            context.read<InternetCubit>().connection(true);
            context.read<MySnackBarCubit>().mySnackBar(
                context, const Text('Connesso 🛜'), Colors.green.shade400);
          } else if (state is InternetConnFailureState) {
            context.read<InternetCubit>().connection(false);
            context.read<MySnackBarCubit>().mySnackBar(
                context, const Text('Disconnesso 🤌🏻🛜'), Colors.red.shade400);
          }
        },
        child: Row(
          children: [
            MediaQuery.of(context).size.width >= 600.0
                ? Flexible(
                    flex: 1, child: SideBar(pageController: pageController))
                : const SizedBox(),
            Flexible(
              flex: 3,
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  context.read<PageViewCubit>().changePageIndex(value);
                },
                children: listPages,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomBar(pageController: pageController),
    );
  }
}
