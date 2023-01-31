class User {
  final String id;
  final String name;
  final String surname;
  final String imageUrl;

  const User({
    required this.id,
    required this.name,
    required this.surname,
    required this.imageUrl,
  });

  static const List<User> users = [
    User(
      id: '1',
      name: 'John',
      surname: 'Whitaker',
      imageUrl: 'https://images.unsplash.com/photo-1657299143322-934f44698807',
    ),
    User(
      id: '2',
      name: 'Alex',
      surname: 'Brown',
      imageUrl: 'https://images.unsplash.com/photo-1659661234411-1c3605f2cf3b',
    ),
    User(
      id: '3',
      name: 'Lisa',
      surname: 'Jones',
      imageUrl: 'https://images.unsplash.com/photo-1659798513836-be95d1321735',
    ),
    User(
      id: '4',
      name: 'Anthony',
      surname: 'Jones',
      imageUrl: 'https://images.unsplash.com/photo-1657299141984-dd9196274cde',
    ),
    User(
      id: '5',
      name: 'Kathy',
      surname: 'Ball',
      imageUrl: 'https://images.unsplash.com/photo-1659788496199-01c0436a16f4',
    ),
    User(
      id: '6',
      name: 'Mark',
      surname: 'Lost',
      imageUrl: 'https://images.unsplash.com/photo-1659763708148-71eaeee1101e',
    ),
  ];
}
