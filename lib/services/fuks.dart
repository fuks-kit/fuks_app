final fuks = FuksService();

const _niklasImage =
    'https://media.licdn.com/dms/image/D4E03AQG13yn0qCIuIw/profile-displayphoto-shrink_800_800/0/1676229815392?e=1701907200&v=beta&t=rb9Y1ODsOfOEuW7M4t1gkX3-WTqWqEV2FmkqAfey3wg';
const _leonImage =
    'https://media.licdn.com/dms/image/C5603AQEi5v7AKQo4Sg/profile-displayphoto-shrink_800_800/0/1610125447745?e=1701907200&v=beta&t=WsBnLBomNHqfe35PW1Z03xCDhllqz4JT7F5AYeNbGyw';

class FuksService {
  Future<KarlsruherTransferEditions> getKarlsruherTransfers() async {
    return KarlsruherTransferEditions(items: [
      KarlsruherTransferEdition(
        title: 'KT 63 – Erinnerungen',
        subtitle:
            'In der aktuellen Ausgabe geht es um das Thema "Erinnerungen" und wie sie in verschiedenen Lebensbereichen eine Rolle spielen',
        imageUrl:
            'https://fuks.org/wp-content/uploads/2023/07/Screenshot-2023-07-03-191711.png',
        pdfUrl:
            'https://fuks.org/wp-content/uploads/2023/07/KT_63-fuer-Online.pdf',
      ),
      KarlsruherTransferEdition(
        title: 'KT 61 – Zufall',
        subtitle:
            'Die Autoren erkunden das Unberechenbare und Unerklärliche, das oft als Zufall wahrgenommen wird. Sie betonen jedoch, dass viele scheinbar zufällige Ereignisse durch Logik und Wissenschaft erklärt werden können',
        imageUrl:
            'https://fuks.org/wp-content/uploads/2022/09/KT61xxxxxxxx-6.jpg',
        pdfUrl: 'https://fuks.org/wp-content/uploads/2022/09/KT61-Zufall.pdf',
      ),
    ]);
  }

  Future<Projects> getProjects() async {
    return Projects(items: [
      Project(
        title: 'Website Relaunch',
        subtitle: 'Die fuks Website wird neu gestaltet',
        managerName: 'Leon Kitzmann',
        managerEmail: 'leon.kitzmann@fuks.org',
        managerImageUrl: _leonImage,
        details: '',
      ),
      Project(
        title: 'Erstellung Kostenkalkulation',
        subtitle:
            'Ziel des Projektes ist die Erstellung einer Kostenkalkulation, das Aufsetzen eines Wissensmanagementsystems und die Unterstützung des Projektmanagements, bei der unsere externe Sichtweise und Erfahrung gefragt sind',
        managerName: 'Niklas Hübschle',
        managerEmail: 'niklas.huebschle@fuks.org',
        managerImageUrl: _niklasImage,
        details: '',
      ),
    ]);
  }
}

class Projects {
  Projects({
    required this.items,
  });

  final List<Project> items;
}

class Project {
  Project({
    required this.title,
    required this.subtitle,
    required this.managerName,
    required this.managerEmail,
    this.managerImageUrl,
    required this.details,
  });

  final String title;
  final String subtitle;
  final String managerName;
  final String managerEmail;
  final String? managerImageUrl;
  final String details;
}

class KarlsruherTransferEditions {
  KarlsruherTransferEditions({
    required this.items,
  });

  final List<KarlsruherTransferEdition> items;
}

class KarlsruherTransferEdition {
  KarlsruherTransferEdition({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.pdfUrl,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
  final String pdfUrl;
}
