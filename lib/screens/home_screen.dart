import 'package:flutter/material.dart';
import 'package:peliculas_flutter/providers/movies_provider.dart';
import 'package:peliculas_flutter/search/search_delegate.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en estreno'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () =>
                showSearch(context: context, delegate: MovieSearchDelegate()),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        CardSwiper(movies: moviesProvider.onDisplayMovies),
        MovieSlider(
          movies: moviesProvider.popularMovies,
          tittle: 'Populares de la semana',
          onNetxPage: () => moviesProvider.getPopularMovies(),
        ),
      ])),
    );
  }
}
