import 'package:undraw/illustrations.g.dart';

final fuks = FuksService();

const _patrickImage =
    'https://media.licdn.com/dms/image/D5603AQFN_mG7il0cLQ/profile-displayphoto-shrink_400_400/0/1661528784896?e=1701907200&v=beta&t=cHWdG-4Vy_any8hqdnwSrnuKuOpp9VpiDpeuz0uYDyE';
const _leonImage =
    'https://media.licdn.com/dms/image/C5603AQEi5v7AKQo4Sg/profile-displayphoto-shrink_800_800/0/1610125447745?e=1701907200&v=beta&t=WsBnLBomNHqfe35PW1Z03xCDhllqz4JT7F5AYeNbGyw';
const _niklasImage =
    'https://media.licdn.com/dms/image/D4E03AQG13yn0qCIuIw/profile-displayphoto-shrink_800_800/0/1676229815392?e=1701907200&v=beta&t=rb9Y1ODsOfOEuW7M4t1gkX3-WTqWqEV2FmkqAfey3wg';
const _konstantinImage =
    'https://media.licdn.com/dms/image/D4E03AQHT7xyC5spfMA/profile-displayphoto-shrink_800_800/0/1684668187664?e=1701907200&v=beta&t=S1X9Tggacl0Aoi3_Mc4WiR6-q-MkLgw0Q32F4wG2cWE';
const _didemImage =
    'https://media.licdn.com/dms/image/C4E03AQFwnYiDMJ4SNA/profile-displayphoto-shrink_800_800/0/1654071665281?e=1701907200&v=beta&t=2CyzdJrrwNpp4GNMOuD1Vj8wCPVsIY3yLNHgFyjHf3o';
const _dominikImage =
    'https://media.licdn.com/dms/image/C5603AQFfFXyk8r7JzA/profile-displayphoto-shrink_800_800/0/1619775711272?e=1701907200&v=beta&t=2-XhHGkuIzMFrGdI1nKXQWcHP5Q5eWdC1XQLHwxuU-A';
const _claraImage =
    'https://media.licdn.com/dms/image/D4E03AQG3Jupbukiadw/profile-displayphoto-shrink_800_800/0/1689078858601?e=1701907200&v=beta&t=H524lqOjkN1Fav5uV8h-UH1XrJHFBNSyjIeofWvK420';
const _ninaImage =
    'https://media.licdn.com/dms/image/D4E03AQF41UzsZ2mFnA/profile-displayphoto-shrink_800_800/0/1683558057709?e=1701907200&v=beta&t=nbr0Q8bGQ9VOWhq4ExwoZbc-CCJyBYOV6wF8vNeOjr4';
const _jeanImage =
    'https://fuks.org/wp-content/uploads/2023/07/JeanGBLKT_sqaure-Benutzerdefiniert-modified-300x300.png';
const _karinImage =
    'https://fuks.org/wp-content/uploads/2023/07/KarinGBLCK_square-Benutzerdefiniert-modified-300x300.png';

class FuksService {
  Future<Events> getEvents() async {
    return Events(items: [
      Event(
        title: 'GBB Treffen',
        subtitle: 'Das treffen für Beratung und Bewerbungen',
        contactName: 'Dominik Müller',
        contactEMail: 'dominik.mueller@fuks.org',
        contactImageUrl: _dominikImage,
        date: DateTime(2023, 10, 17, 19, 30),
        location: 'Waldhornstraße 27, 76131 Karlsruhe',
      ),
      Event(
        title: 'KT-Treffen',
        subtitle: 'Redaktionstreffen für den Karlsruher Transfer',
        contactName: 'Jean Weber',
        contactEMail: 'jean.weber@fuks.org',
        contactImageUrl: _jeanImage,
        date: DateTime(2023, 10, 18, 20, 00),
        location: 'Waldhornstraße 27, 76131 Karlsruhe',
      ),
    ]);
  }

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
        title: 'KT 62 – Nichts',
        subtitle:
            'In der aktuellen Ausgabe dreht sich alles um das Thema "Nichts". Die Autoren zeigen, dass "Nichts" oft mehr zu bieten hat, als es auf den ersten Blick scheint',
        imageUrl: 'https://fuks.org/wp-content/uploads/2022/11/Cover-62.png',
        pdfUrl: 'https://fuks.org/wp-content/uploads/2022/12/KT62.pdf',
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
        imageUrl:
            'https://images.unsplash.com/photo-1579621970795-87facc2f976d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=3270&q=80',
        illustration: UnDrawIllustration.calculator,
        label: 'Jetzt bewerben!',
        title: 'Erstellung Kostenkalkulation',
        subtitle:
            'Ziel des Projektes ist die Erstellung einer Kostenkalkulation, das Aufsetzen eines Wissensmanagementsystems und die Unterstützung des Projektmanagements, bei der unsere externe Sichtweise und Erfahrung gefragt sind',
        managerName: 'Niklas Hübschle',
        managerEmail: 'niklas.huebschle@fuks.org',
        managerImageUrl: _niklasImage,
        details: '''# Erstellung Kostenkalkulation

![Image](https://images.unsplash.com/photo-1579621970795-87facc2f976d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA==&auto=format&fit=crop&w=3270&q=80)

Jetzt bewerben bei [Niklas Hübschle](mailto:niklas.huebschle@fuks.org)

## Ausgangssituation
Unser Kunde ist ein bekanntes, größeres Unternehmen aus der Region und gerade dabei, ein neues Anwendungszentrum für die eigene Forschung zu bauen. Während die Aufgaben grundsätzlich klar und verteilt sind, fehlt eine zentrale koordinierende Hand, bei der alle Fäden zusammenlaufen - hier kommen wir ins Spiel.

## Projektaufgaben
Ziel des Projektes ist die Erstellung einer Kostenkalkulation, das Aufsetzen eines Wissensmanagementsystems und die Unterstützung des Projektmanagements, bei der unsere externe Sichtweise und Erfahrung gefragt sind.

## Projektdauer & Umfang
Das Projekt ist für drei Monate angesetzt und wird voraussichtlich Mitte Januar beendet werden. Der Projektumfang beträgt 15-18 Beratertage. Folgeprojekte sind möglich.

## Projektstellen
Für die Stelle als Projektmitglied sind keine expliziten Vorkenntnisse erforderlich, Erfahrung bei Kostenkalkulation und Grundkenntnisse in MS Excel sind ein Plus aber lasst Euch nicht abschrecken. Eigenständiges Arbeiten und ein hohes Maß an Lernbereitschaft sind allerdings wichtig.

## Eure Bewerbung
Bitte bewerbt Euch bis **Sonntag, 08.10.2023 12:00** bei mir und Alexander Böhle (in CC) **per E-Mail** mit folgendem
- Lebenslauf
- 2-3 Sätze zu Deiner Motivation
- Excel mit Bewerberinformationen (siehe Anhang)
- Deine zeitliche Verfügbarkeit bis Ende Januar''',
      ),
      Project(
        illustration: UnDrawIllustration.web_development,
        title: 'Website Relaunch',
        subtitle: 'Die fuks Website wird neu gestaltet',
        managerName: 'Leon Kitzmann',
        managerEmail: 'leon.kitzmann@fuks.org',
        managerImageUrl: _leonImage,
        details: '',
      ),
      Project(
        illustration: UnDrawIllustration.mobile_development,
        title: 'App Development',
        subtitle: 'Das fuks App team braucht deine Unterstützung!',
        managerName: 'Patrick Zierahn',
        managerEmail: 'patrick.zierahn@fuks.org',
        managerImageUrl: _patrickImage,
        details: '',
      ),
    ]);
  }
}

class Events {
  Events({
    required this.items,
  });

  final List<Event> items;
}

class Event {
  Event({
    this.label,
    required this.title,
    required this.subtitle,
    this.contactName,
    this.contactEMail,
    this.contactImageUrl,
    this.date,
    this.location,
    this.details,
  });

  final String? label;
  final String title;
  final String subtitle;
  final String? contactName;
  final String? contactEMail;
  final String? contactImageUrl;

  final DateTime? date;
  final String? location;

  final String? details;

  bool get hasContact => contactName != null && contactEMail != null;
}

class Projects {
  Projects({
    required this.items,
  });

  final List<Project> items;
}

class Project {
  Project({
    this.illustration,
    this.imageUrl,
    this.label,
    required this.title,
    required this.subtitle,
    required this.managerName,
    required this.managerEmail,
    this.managerImageUrl,
    required this.details,
  });

  final UnDrawIllustration? illustration;
  final String? imageUrl;
  final String? label;
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
