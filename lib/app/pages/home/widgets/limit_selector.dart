part of '../home_page.dart';

class _LimitSelector extends StatelessWidget {
  final ValueChanged<int> onLimitChanged;

  const _LimitSelector({
    Key? key,
    required this.onLimitChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          padding: EdgeInsets.symmetric(vertical: Insets.tiny.top),
          child: BlocSelector<HomeBloc, HomeState, int>(
            selector: (state) => state.selectedLimit,
            builder: (context, selectedLimit) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacing.normal,
                  Text(
                    LocaleKeys.pages_home_limit_label.tr(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const Spacer(),
                  for (int limit = Pic.minLimit; limit <= Pic.maxLimit; limit += 25) ...[
                    TogglableButtonChip<int>(
                      label: limit.toString(),
                      valueChanged: onLimitChanged,
                      value: limit,
                      groupValue: selectedLimit,
                    ),
                    Spacing.tiny,
                  ],
                  Spacing.normal,
                ],
              );
            },
          ),
        ),
         Divider(color: Colors.grey.withOpacity(0.1), height: 1, thickness: 1)
      ],
    );
  }
}
