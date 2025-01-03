import 'package:flutter/material.dart';

class FilterModalScreen extends StatefulWidget {
  const FilterModalScreen({super.key});

  @override
  State<FilterModalScreen> createState() => _FilterModalScreenState();
}

class _FilterModalScreenState extends State<FilterModalScreen> {
  String selectedFilter = 'Location';
  List<String> selectedItems = [];

  final List<String> locations = ['Location 1', 'Location 2', 'Location 3'];
  final List<String> trainings = ['Training 1', 'Training 2', 'Training 3'];
  final List<String> trainers = ['Trainer 1', 'Trainer 2', 'Trainer 3'];

  List<String> _getAvailableOptions() {
    switch (selectedFilter) {
      case 'Location':
        return locations;
      case 'Training Name':
        return trainings;
      case 'Trainer Name':
        return trainers;
      default:
        return [];
    }
  }

  Widget _buildFilterOption(String title) {
    return selectedFilter == title
        ? _selectedWidget(title)
        : _unSelectedWidget(title);
  }

  Widget _unSelectedWidget(String title, {bool isFilter = true}) {
    return InkWell(
      onTap: isFilter
          ? () {
              setState(() {
                selectedFilter = title;
              });
            }
          : null,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8),
              child: SizedBox(
                width: 5, // Width of the red band
                height: double
                    .infinity, // Make it take the maximum height of the parent
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectedWidget(String title) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                color: Theme.of(context).primaryColor, // Red color for the band
                width: 5, // Width of the red band
                height: double
                    .infinity, // Make it take the maximum height of the parent
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                title,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _heading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Sort and Filters',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              color: Theme.of(context).disabledColor,
            ),
            onPressed: () => Navigator.pop(context), // Close the modal
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: screenHeight * 0.75, // 75% of the screen height
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Header with Filter and Close Icon
          _heading(context),
          Container(
            height: 1,
            width: double.infinity,
            color: Theme.of(context).disabledColor,
          ),

          // Filter options (Location, Training Name, Trainer Name)
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Theme.of(context).canvasColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _unSelectedWidget('Sort by', isFilter: false),
                      // Location Filter
                      _buildFilterOption(
                        'Location',
                      ),
                      // Training Name Filter
                      _buildFilterOption(
                        'Training Name',
                      ),
                      // Trainer Name Filter
                      _buildFilterOption(
                        'Trainer Name',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Search TextField
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Search',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _getAvailableOptions()
                            .map((option) => CheckboxListTile(
                                  title: Text(option),
                                  value: selectedItems.contains(option),
                                  onChanged: (isSelected) {
                                    setState(() {
                                      if (isSelected ?? false) {
                                        selectedItems.add(option);
                                      } else {
                                        selectedItems.remove(option);
                                      }
                                    });
                                  },
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
