import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals_app_v2/components/switch_filter_tile.component.dart';
import 'package:meals_app_v2/providers/filters.provider.dart';

class FiltersPage extends ConsumerWidget {
  const FiltersPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      body: Column(
        children: [
          SwitchFilterTile(
            title: 'Gluten-free',
            subtitle: 'Only include gluten-free meals',
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
            },
            value: activeFilters[Filter.glutenFree]!,
          ),
          SwitchFilterTile(
            title: 'Lactose-free',
            subtitle: 'Only include lactose-free meals',
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
            },
            value: activeFilters[Filter.lactoseFree]!,
          ),
          SwitchFilterTile(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegetarian, isChecked);
            },
            value: activeFilters[Filter.vegetarian]!,
          ),
          SwitchFilterTile(
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            onChanged: (isChecked) {
              ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
            },
            value: activeFilters[Filter.vegan]!,
          ),
        ],
      ),
    );
  }
}
