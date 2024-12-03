# File Structure

## lib/app/
Contains global configurations, routes, and the root widget of the application.

## config/
Holds application settings and theme configurations.

## navigation/
Manages route definitions and navigation settings.

## app.dart
The main widget of the application.

## lib/core/
Common providers, helper classes, and constants used throughout the application.

## lib/features/
Features or modules of the application. Each feature is divided into:
- **presentation/**: Widgets, Pages, and UI components.
- **application/**: State Notifiers, Providers, and business logic.
- **domain/**: Entities, Use Cases, and core business rules.
- **infrastructure/**: Repository Implementations, Data Sources, and external service integrations.

## lib/main.dart
Entry point of the application.