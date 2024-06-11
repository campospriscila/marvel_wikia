import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marvel_wikia/blocs/characters/cubit.dart';
import 'package:marvel_wikia/configs/configs.dart';
import 'package:marvel_wikia/models/character_model.dart';
import 'package:marvel_wikia/screens/screens.dart';
import 'package:marvel_wikia/utils/utils.dart';
import 'package:marvel_wikia/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CharactersCubit _charactersCubit = CharactersCubit();

  final ScrollController _scrollController = ScrollController();

  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isLoadingMore) {
        _isLoadingMore = true;
        _charactersCubit.loadMoreCharacters(Application.allCharacters.length).then((_) {
          setState(() {
            _isLoadingMore = false;
          });
        });
      }
    });
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            MWKTranslate.of(context).translate('home-title').toUpperCase(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        MWKSizing.columnPadding16,
        SizedBox(
          height: 210,
          child: _buildCarrousel(Application.popularCharacters),
        ),
        MWKSizing.columnPadding16,
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            MWKTranslate.of(context).translate('home-subtitle').toUpperCase(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        MWKSizing.columnPadding16,
        Expanded(child: _buildList(Application.allCharacters)),
      ],
    );
  }

  Widget _buildCarrousel(List<CharacterModel> popularCharacters) {
    return Swiper(
      itemCount: popularCharacters.length,
      itemBuilder: (context, index) {
        final character = popularCharacters[index];
        return CharacterCard(
          name: character.name,
          thumbnail: character.thumbnail,
          description: character.description,
          comics: character.comics,
          id: character.id,
        );
      },
      control: const SwiperControl(
        padding: EdgeInsets.all(16),
        color: Colors.white,
      ),
      viewportFraction: 0.8,
      scale: 0.9,
    );
  }

  Widget _buildList(List<CharacterModel> allCharacters) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: allCharacters.length + 1,
      itemBuilder: (context, index) {
        if (index == allCharacters.length) {
          return _isLoadingMore ? const Center(child: CircularProgressIndicator()) : const SizedBox.shrink();
        }

        final character = allCharacters[index];
        return CharacterList(
          thumbnail: character.thumbnail,
          name: character.name,
          description: character.description,
          comics: character.comics,
          id: character.id,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _charactersCubit,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => Navigator.pushNamed(context, MWKRoutes.settingsPage),
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        body: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            if (state == CharactersState.failure) {
              return const ErrorPage();
            }

            return _buildBody();
          },
        ),
      ),
    );
  }
}
