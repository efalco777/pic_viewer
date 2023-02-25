part of '../home_page.dart';

class _SearchBar extends StatefulWidget {
  final ValueChanged<String> onSearch;
  final VoidCallback onCancelSearch;

  const _SearchBar({
    required this.onSearch,
    required this.onCancelSearch,
  });

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (_, current) => _controller.text != current.authorQuery,
      listener: (context, state) {
        _controller = TextEditingController(text: state.authorQuery);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.symmetric(vertical: Insets.tiny.top, horizontal: Insets.normal.left),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: '${LocaleKeys.pages_home_search_by_author_label.tr()}...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashRadius: null,
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();

                    widget.onCancelSearch();
                    _controller.text = '';
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              onChanged: widget.onSearch,
            ),
          ),
          Divider(color: Colors.grey.withOpacity(0.1), height: 1, thickness: 1)
        ],
      ),
    );
  }
}
