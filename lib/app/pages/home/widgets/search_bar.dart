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
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Insets.tiniest.top,
            ),
            child: Row(
              children: [
                Spacing.small,
                Expanded(
                  child: BlocSelector<HomeBloc, HomeState, bool>(
                    selector: (state) => state.isInSearchMode,
                    builder: (context, isInSearchMode) {
                      return SizedBox(
                        height: 56,
                        child: TextField(
                          enabled: !isInSearchMode,
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: '${LocaleKeys.pages_home_search_by_author_label.tr()}...',
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            enabledBorder: _border,
                            errorBorder: _border,
                            focusedBorder: _border,
                            border: _border,
                            disabledBorder: _border,
                            focusedErrorBorder: _border,
                          ),
                          onChanged: bloc.onAuthorQueryChanged,
                        ),
                      );
                    },
                  ),
                ),
                Spacing.small,
                BlocSelector<HomeBloc, HomeState, bool>(
                  selector: (state) => state.isInSearchMode,
                  builder: (context, isInSearchMode) {
                    return ElevatedButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (isInSearchMode) {
                          _controller.text = '';
                          bloc.onSearchCancelled();
                        } else {
                          bloc.onSearchStarted();
                        }
                      },
                      child: isInSearchMode
                          ? Text(LocaleKeys.pages_home_return_button_label.tr())
                          : Text(LocaleKeys.pages_home_search_button_label.tr()),
                    );
                  },
                ),
                Spacing.small,
              ],
            ),
          ),
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
