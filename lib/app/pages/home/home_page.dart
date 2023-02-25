import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:pic_viewer/app/app.dart';
import 'package:pic_viewer/app/common/debouncer.dart';
import 'package:pic_viewer/app/di/di.dart';
import 'package:pic_viewer/app/model/pic/entity/pic.dart';
import 'package:pic_viewer/app/pages/home/home_bloc.dart';
import 'package:pic_viewer/app/pages/home/home_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pic_viewer/app/router/router.dart';
import 'package:pic_viewer/app/theming/dimens.dart';
import 'package:pic_viewer/app/widgets/image_placeholder.dart';
import 'package:pic_viewer/app/widgets/simple_sliver_persistent_header_delegate.dart';
import 'package:pic_viewer/app/widgets/spacing.dart';
import 'package:pic_viewer/app/widgets/togglable_button_chip.dart';
import 'package:pic_viewer/generated/locale_keys.g.dart';

part 'widgets/pic_sliver_grid.dart';
part 'widgets/page_selector.dart';
part 'widgets/limit_selector.dart';
part 'widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => inject<HomeBloc>()..refresh(),
      child: const _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.pages_home_app_bar_title.tr(),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocSelector<HomeBloc, HomeState, HomeContent>(
          selector: (state) => state.content,
          builder: (context, content) {
            return content.when(
              loading: () => const _Loading(),
              loaded: () => _Loaded(),
              error: () => const _Error(),
            );
          },
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class _Loaded extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final Debouncer _debouncer = Debouncer();

  _Loaded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverPersistentHeader(
                delegate: FixedHeaderDelegate(
                  extend: 60,
                  child: _LimitSelector(
                    onLimitChanged: (value) => _debouncer.debounce(
                      tag: 'limit_selection_debounce',
                      duration: const Duration(milliseconds: 200),
                      callback: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        bloc.onLimitChanged(value);
                      },
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: FixedHeaderDelegate(
                  extend: 80,
                  child: _SearchBar(
                    onCancelSearch: bloc.onSearchCancelled,
                    onSearch: bloc.onSearchByAuthor,
                  ),
                ),
                floating: true,
                pinned: false,
              ),
              SliverPadding(
                padding: Insets.normal.copyWith(top: Insets.small.top),
                sliver: const _PicSliverGrid(),
              ),
            ],
          ),
        ),
        _PageSelector(
          onPageChanged: (value) {
            FocusManager.instance.primaryFocus?.unfocus();
            bloc.onPageChanged(value);
          },
        ),
      ],
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = BlocProvider.of(context);

    return Padding(
      padding: Insets.normal,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_outlined,
              color: Theme.of(context).colorScheme.error,
              size: 42,
            ),
            Spacing.small,
            Text(
              LocaleKeys.pages_home_error_message.tr(),
              textAlign: TextAlign.center,
            ),
            Spacing.normal,
            ElevatedButton.icon(
              onPressed: () => bloc.refresh(reset: true),
              icon: const Icon(Icons.refresh),
              label: Text(LocaleKeys.pages_home_refresh_button_label.tr()),
            )
          ],
        ),
      ),
    );
  }
}
