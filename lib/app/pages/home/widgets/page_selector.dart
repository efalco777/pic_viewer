part of '../home_page.dart';

class _PageSelector extends StatelessWidget {
  final ValueChanged<int> onPageChanged;

  const _PageSelector({
    Key? key,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, int>(
      selector: (state) => state.selectedPage,
      builder: (context, selectedPage) {
        return Column(
          children: [
            const Divider(color: Colors.grey, height: 1, thickness: 1),
            Padding(
              padding: Insets.normal.copyWith(
                top: Insets.tiny.top,
                bottom: Insets.tiny.bottom,
              ),
              child: Row(
                children: [
                  Text(LocaleKeys.pages_home_page_label.tr()),
                  const Spacer(),
                  if (selectedPage > 1) ...[
                    BlocSelector<HomeBloc, HomeState, bool>(
                      selector: (state) => state.isChangingPage,
                      builder: (context, isChangingPage) {
                        return AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.decelerate,
                          opacity: !isChangingPage ? 1.0 : 0.4,
                          child: IgnorePointer(
                            ignoring: isChangingPage,
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: const Text('<<'),
                                  onTap: () => onPageChanged(selectedPage - 1),
                                ),
                                Spacing.tiniest,
                                TogglableButtonChip<int>(
                                  valueChanged: onPageChanged,
                                  value: (selectedPage - 1),
                                  groupValue: selectedPage,
                                  shape: BoxShape.rectangle,
                                  size: 24,
                                  fontSize: 12,
                                  label: '${selectedPage - 1}',
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                  Spacing.tiny,
                  TogglableButtonChip<int>(
                    label: selectedPage.toString(),
                    value: selectedPage,
                    shape: BoxShape.rectangle,
                    groupValue: selectedPage,
                    size: 30,
                    valueChanged: onPageChanged,
                  ),
                  Spacing.tiny,
                  BlocSelector<HomeBloc, HomeState, bool>(
                    selector: (state) => state.pageData.isNextPageAvailable && !state.isChangingPage,
                    builder: (context, canMoveToNextPage) {
                      return AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.decelerate,
                        opacity: canMoveToNextPage ? 1.0 : 0.4,
                        child: IgnorePointer(
                          ignoring: !canMoveToNextPage,
                          child: Row(
                            children: [
                              TogglableButtonChip<int>(
                                label: '${selectedPage + 1}',
                                value: selectedPage + 1,
                                shape: BoxShape.rectangle,
                                groupValue: selectedPage,
                                size: 24,
                                fontSize: 12,
                                valueChanged: onPageChanged,
                              ),
                              Spacing.tiniest,
                              GestureDetector(
                                onTap: () => onPageChanged(selectedPage + 1),
                                child: const SizedBox(width: 24, child: Text('>>')),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
