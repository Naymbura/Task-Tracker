# Task Tracker

A minimal SwiftUI project that demonstrates how to model and persist simple to-dos using **SwiftData**. The project focuses on the core persistence flow—from defining a model to storing, querying, and updating data—without the manual Core Data boilerplate.

## Overview

Task Tracker is a small, learning-oriented project designed to demonstrate local data persistence with SwiftUI and SwiftData.

The intentionally limited scope makes it easy to understand how SwiftData works end-to-end while providing a foundation that can be extended with additional UI and features.

### What This Project Demonstrates

* Defining a persistent model using SwiftData's `@Model`
* Automatic local persistence
* Automatic model identity and change tracking
* Configuring a `ModelContainer` at app launch
* Accessing a `ModelContext` from SwiftUI views
* Inserting, updating, and deleting model instances
* Querying persisted data with `@Query`
* Automatic UI updates when queried data changes

## Architecture

Task Tracker uses three core SwiftData components:

### `@Model`

The `Task` model is annotated with SwiftData's `@Model` attribute. This makes the model persistable and provides automatic identity and change tracking.

The current model contains:

* `title` — the task's text
* `isDone` — a Boolean indicating whether the task is completed

Conceptually, the model looks like:

```swift
@Model
final class Task {
    var title: String
    var isDone: Bool

    init(title: String, isDone: Bool = false) {
        self.title = title
        self.isDone = isDone
    }
}
```

### `ModelContainer`

The `ModelContainer` describes which SwiftData models the application persists.

In a SwiftUI application, it is typically attached to the app's scene using:

```swift
.modelContainer(for: Task.self)
```

This makes the persistence container available throughout the SwiftUI view hierarchy.

### `ModelContext`

`ModelContext` is the environment-backed context used by views to work with persisted model instances.

Views can use it to:

* Insert tasks
* Modify tasks
* Delete tasks
* Persist changes through SwiftData

For example:

```swift
@Environment(\.modelContext) private var modelContext
```

### `@Query`

`@Query` provides a SwiftUI-friendly way to fetch persisted models.

Because queries are reactive, the view automatically refreshes when the underlying data changes.

For example:

```swift
@Query private var tasks: [Task]
```

## Data Flow

The persistence flow is intentionally straightforward:

1. The application creates a `ModelContainer` for the `Task` model at launch.
2. SwiftUI makes a `ModelContext` available to views through the environment.
3. Views use the `ModelContext` to insert, modify, or delete `Task` instances.
4. Views use `@Query` to fetch persisted tasks.
5. SwiftData tracks changes to the models.
6. SwiftUI automatically refreshes views when queried data changes.

This creates a simple flow:

**Model → ModelContainer → ModelContext → @Query → SwiftUI UI**

## Current Scope

The project currently keeps the task model and feature set intentionally small.

A task contains:

| Property | Type     | Description                         |
| -------- | -------- | ----------------------------------- |
| `title`  | `String` | The task's title or description     |
| `isDone` | `Bool`   | Whether the task has been completed |

The project does not currently include:

* External dependencies
* Complex networking
* Manual Core Data configuration
* Advanced task metadata
* iCloud synchronization

## Requirements

* **Xcode 15 or later**
* **iOS 17 or later**
* **Swift 5.9 or later**

SwiftData is available starting with iOS 17.

## Technologies

* **Swift** — Programming language
* **SwiftUI** — UI framework
* **SwiftData** — Local persistence and data modeling

## Project Goals

The primary goal of Task Tracker is to provide a clear, minimal example of SwiftData integration in a SwiftUI application.

Rather than introducing a large architecture or extensive feature set, the project focuses on understanding:

* How a SwiftData model is defined
* How persistence is configured
* How views access a model context
* How data is queried
* How changes propagate automatically to the UI

## Possible Extensions

The project can be expanded incrementally as requirements grow. Possible next steps include:

* Task list UI
* Create and edit task forms
* Delete and swipe actions
* Sorting and filtering
* Search
* Task categories or priorities
* Due dates and reminders
* Completed-task management
* Widgets
* iCloud synchronization
* More advanced SwiftData relationships

## Summary

Task Tracker provides a small, focused example of using **SwiftUI + SwiftData** to build a locally persisted task application.

The core architecture consists of a `Task` model powered by `@Model`, a `ModelContainer` configured at application launch, a `ModelContext` used for data operations, and `@Query` for live-updating data in SwiftUI.

It is intended to be simple enough for learning while providing a solid foundation for adding more functionality over time.
