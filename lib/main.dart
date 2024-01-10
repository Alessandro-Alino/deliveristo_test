import 'package:deliveristo_test/app.dart';
import 'package:deliveristo_test/core/cubit/internet_cubit.dart';
import 'package:deliveristo_test/core/cubit/my_snackbar.dart';
import 'package:deliveristo_test/core/cubit/pageview_cubit.dart';
import 'package:deliveristo_test/core/network/internet_conn_bloc.dart';
import 'package:deliveristo_test/core/services/api_services.dart';
import 'package:deliveristo_test/features/images_list_by_breed/domain/use_cases/images_list_by_breed_use_cases.dart';
import 'package:deliveristo_test/features/images_list_by_breed/presentation/bloc/images_list_by_breed_bloc.dart';
import 'package:deliveristo_test/features/images_list_by_sub_breed/domain/use_cases/images_list_by_breed_use_cases.dart';
import 'package:deliveristo_test/features/images_list_by_sub_breed/presentation/bloc/images_list_by_sub_breed_bloc.dart';
import 'package:deliveristo_test/features/images_list_by_sub_breed/presentation/cubit/selected_breed_image_list.dart';
import 'package:deliveristo_test/features/list_all_breeds/domain/use_cases/breeds_use_cases.dart';
import 'package:deliveristo_test/features/list_all_breeds/presentation/bloc/breeds_bloc.dart';
import 'package:deliveristo_test/features/list_all_breeds/presentation/cubit/selected_breed.dart';
import 'package:deliveristo_test/features/random_image_by_breed/domain/use_cases/random_image_by_breed_use_cases.dart';
import 'package:deliveristo_test/features/random_image_by_breed/presentation/bloc/random_image_by_breed_bloc.dart';
import 'package:deliveristo_test/features/random_image_by_sub_breed/domain/use_cases/random_image_by_sub_breed_use_cases.dart';
import 'package:deliveristo_test/features/random_image_by_sub_breed/presentation/bloc/random_image_by_sub_breed_bloc.dart';
import 'package:deliveristo_test/features/random_image_by_sub_breed/presentation/cubit/selected_breed_subbreed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => BreedsServices()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => InternetConnBloc()),
          BlocProvider(create: (context) => InternetCubit()),
          BlocProvider(create: (context) => PageViewCubit()),
          BlocProvider(create: (context) => MySnackBarCubit()),
          BlocProvider(
            create: (context) => BreedsBloc(
              useCases: BreedsUseCases(breedsServices: context.read()),
            )..add(BreedsFetchEvent()),
          ),
          BlocProvider(create: (context) => SelectedBreed()),
          BlocProvider(create: (context) => SelectedBreedForImageList()),
          BlocProvider(
              create: (context) => RandomImageByBreedBloc(
                  useCases:
                      RandomBreedsUseCases(breedsServices: context.read()))),
          BlocProvider(
              create: (context) => ImagesListByBreedBloc(
                  useCase: ListImagesByBreedUseCases(
                      breedsServices: context.read()))),
          BlocProvider(
              create: (context) => ImagesListBySubBreedBloc(
                  useCase: ListImagesBySubBreedUseCases(
                      breedsServices: context.read()))),
          BlocProvider(
              create: (context) => RandomImageBySubBreedBloc(
                  useCases:
                      RandomSubBreedsUseCases(breedsServices: context.read()))),
          BlocProvider(create: (context) => SelectedBreedForSubBreed()),
          BlocProvider(create: (context) => SelectedSubBreedForSubBreed()),
          BlocProvider(create: (context) => SelectedBreedForListSubBreed()),
          BlocProvider(create: (context) => SelectedSubBreedForListSubBreed()),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
              useMaterial3: true,
            ),
            home: const App()),
      ),
    );
  }
}
