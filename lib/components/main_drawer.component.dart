import 'package:flutter/material.dart';
import 'package:meals_app_v2/components/drawer_tile.component.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier)   onSelectScreen;
  const MainDrawer({Key? key, required this.onSelectScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.8),
                ],
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ),
          ),
          DrawerTile(
            label: 'Meals',
            icon: Icons.restaurant,
            onTap: () {
             onSelectScreen('meals');
            },
          ),
          DrawerTile(
            label: 'Filters',
            icon: Icons.settings,
            onTap: () {
              onSelectScreen('filters');
            },
          ),
        ],
      ),
    );
  }
}
