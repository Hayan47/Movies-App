# Movio

Movio is an Android application built with BLoC state management that allows users to browse trending movies, search for any movie and view its details, and add it to their favorites list. The application is powered by the TMDB API, which provides access to a vast collection of movies and TV shows.

## Getting Started

To get started with Movio, you will need to follow these steps:

1. Clone this repository to your local machine.
2. Add your TMDB API key to the `lib/services/api_service.dart` file.
3. Run `flutter packages get` to install the dependencies.
4. Run `flutter run` to start the application.

## Features

- Browse trending movies: Users can browse a list of currently trending movies and view their details.
- Search for movies: Users can search for any movie by entering its title in the search bar. The search results are displayed in a list with movie posters and titles.
- View movie details: Users can view detailed information about a movie, including its title, description, release date, runtime, and rating.
- Add movies to favorites: Users can add movies to their favorites list and view them later.

## Architecture

Movio is built with BLoC state management, which provides a scalable and testable architecture for building complex applications. The BLoC pattern separates the business logic of an application from its presentation, making it easier to manage and scale over time.

The application is divided into three main layers:

- Presentation layer: This layer is responsible for rendering the UI and handling user interactions. The presentation layer communicates with the BLoC layer to retrieve data and update the UI based on the current state.
- BLoC layer: This layer contains the business logic of the application and manages the state of the application. The BLoC layer communicates with the data layer to retrieve data and emits new states based on the current state and user actions.
- Data layer: This layer is responsible for retrieving data from external APIs or local storage. In the case of Movio, the data layer communicates with the TMDB API to retrieve movie data.

## Technologies Used

- Flutter: Flutter is a mobile app SDK for building high-performance, high-fidelity, apps for iOS, Android, and web, from a single codebase.
- BLoC state management: The BLoC pattern is a state management pattern for Flutter that separates the business logic of an application from its presentation.
- TMDB API: The TMDB API provides access to a vast collection of movies and TV shows.

## Screenshots

<p float="left">
<img src="https://github.com/Hayan47/Hayan47/blob/main/movie1.jpg" width="200" height="400" />
  $~~~~~~~~~~$
<img src="https://github.com/Hayan47/Hayan47/blob/main/movie2.jpg" width="200" height="400" />
  $~~~~~~~~~~$
<img src="https://github.com/Hayan47/Hayan47/blob/main/movie3.jpg" width="200" height="400" />
</p>

## Conclusion

Movio is a powerful and easy-to-use Android application that allows users to browse trending movies, search for any movie, view its details, and add it to their favorites list. The application is built with BLoC state management, which provides a scalable and testable architecture for building complex applications. The TMDB API provides access to a vast collection of movies and TV shows, making it easy to find and discover new movies.
