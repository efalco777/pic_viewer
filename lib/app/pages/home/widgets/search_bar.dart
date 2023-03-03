part of '../home_page.dart';

class _SearchBar extends StatefulWidget {
  final String initialText;

  const _SearchBar({required this.initialText});

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacing.small,
          SizedBox(
            height: 56,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacing.small,
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: '${LocaleKeys.pages_home_search_by_author_label.tr()}...',
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      filled: true,
                      enabledBorder: _border,
                      errorBorder: _border,
                      focusedBorder: _border,
                      border: _border,
                      disabledBorder: _border,
                      focusedErrorBorder: _border,
                      suffixIcon: _controller.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                _controller.text = '';
                                bloc.onSearchCancelled();
                              },
                            )
                          : null,
                    ),
                    onChanged: bloc.onAuthorQueryChanged,
                  ),
                ),
                Spacing.small,
                GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    bloc.onSearchStarted();
                  },
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 30,
                    ),
                  ),
                ),
                Spacing.small,
              ],
            ),
          ),
          Spacing.small,
          Divider(color: Colors.grey.withOpacity(0.1), height: 1, thickness: 1)
        ],
      ),
    );
  }

  InputBorder get _border => const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      );
}
