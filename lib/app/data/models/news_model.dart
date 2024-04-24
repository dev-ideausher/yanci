class News {
  final String title;
  final String description;
  final DateTime postedDate;
  final String category;
  final String imageUrl;

  News({
    required this.title,
    required this.description,
    required this.postedDate,
    required this.category,
    required this.imageUrl,
  });
}

// some random data
List<News> sampleNews = [
  News(
    title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    postedDate: DateTime(2023, 6, 22),
    category: 'GSE',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  News(
    title: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    description: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    postedDate: DateTime(2024, 4, 2),
    category: 'African Financials',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  News(
    title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    postedDate: DateTime(2024, 3, 3),
    category: 'GSE',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  News(
    title: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    description: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    postedDate: DateTime(2024, 4, 24, 10),
    category: 'GSE',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  News(
    title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    postedDate: DateTime(2024, 4, 24, 14, 10),
    category: 'African Financials',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  News(
    title: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    description: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    postedDate: DateTime(2024, 4, 24, 14, 11),
    category: 'GSE',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  News(
    title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    postedDate: DateTime(
      2024,
      4,
      20,
    ),
    category: 'African Financials',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  News(
    title: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    description: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    postedDate: DateTime(2020, 4, 8),
    category: 'African Financials',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  News(
    title: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    postedDate: DateTime(2024, 1, 9),
    category: 'GSE',
    imageUrl: 'https://via.placeholder.com/150',
  ),
  News(
    title: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    description: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    postedDate: DateTime(2024, 2, 10),
    category: 'African Financials',
    imageUrl: 'https://via.placeholder.com/150',
  ),
];
