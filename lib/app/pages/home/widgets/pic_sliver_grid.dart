part of '../home_page.dart';

class _PicSliverGrid extends StatelessWidget {
  static const int _crossAxisCount = 2;

  const _PicSliverGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, List<Pic>>(
      selector: (state) => state.pics,
      builder: (context, pics) {
        if (pics.isEmpty) {
          return const SliverToBoxAdapter(
            child: _EmptyContent(),
          );
        }

        return SliverGrid.builder(
          itemCount: pics.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            crossAxisCount: _crossAxisCount,
          ),
          itemBuilder: (_, index) {
            return _PicCard(
              pic: pics[index],
              onTap: () => rootRouter.push(PicDetailsRoute(pic: pics[index])),
            );
          },
        );
      },
    );
  }
}

class _EmptyContent extends StatelessWidget {
  const _EmptyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = BlocProvider.of(context);

    return BlocSelector<HomeBloc, HomeState, bool>(
      selector: (state) => state.isInSearchMode,
      builder: (context, isInSearchMode) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isInSearchMode) ...[
              Icon(
                Icons.question_mark_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 42,
              ),
              Spacing.small,
              Text(
                LocaleKeys.pages_home_empty_search_message.tr(),
                textAlign: TextAlign.center,
              ),
            ] else ...[
              Icon(
                Icons.error_outline_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 42,
              ),
              Spacing.small,
              Text(
                LocaleKeys.pages_home_empty_message.tr(),
                textAlign: TextAlign.center,
              ),
              Spacing.normal,
              ElevatedButton.icon(
                onPressed: bloc.refresh,
                icon: const Icon(Icons.refresh),
                label: Text(
                  LocaleKeys.pages_home_refresh_button_label.tr(),
                ),
              ),
              Spacing.big,
            ]
          ],
        );
      },
    );
  }
}

class _PicCard extends StatelessWidget {
  static const double _cardBorderRadius = 12;

  final Pic pic;
  final VoidCallback onTap;

  const _PicCard({
    required this.pic,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_cardBorderRadius),
            topRight: Radius.circular(_cardBorderRadius),
            bottomLeft: Radius.circular(_cardBorderRadius / 2),
            bottomRight: Radius.circular(_cardBorderRadius / 2),
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(_cardBorderRadius),
                topRight: Radius.circular(_cardBorderRadius),
              ),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 10,
                    child: CachedNetworkImage(
                      fit: pic.height > pic.width ? BoxFit.fitWidth : BoxFit.fill,
                      imageUrl: pic.thumbnailUrl,
                      placeholder: (_, __) => const ImagePlaceholder(),
                      errorWidget: (_, __, ___) => Container(
                        alignment: Alignment.center,
                        child: const Icon(Icons.hide_image_outlined),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        pic.id,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 1, height: 1, color: Colors.black),
            Expanded(
              child: Center(
                child: Text(
                  pic.author,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
