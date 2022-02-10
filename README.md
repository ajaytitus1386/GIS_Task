# Bulk and Block Deals Viewer

A task made for Go India Stocks, with data provided by GIS API service

- [Bulk and Block Deals Viewer](#bulk-and-block-deals-viewer)
  - [:rocket: Getting Started](#rocket-getting-started)
  - [:ledger: Architecture](#ledger-architecture)
    - [:file_folder: Data Layer](#file_folder-data-layer)
    - [:briefcase: Domain Layer](#briefcase-domain-layer)
    - [:iphone: Presentation Layer](#iphone-presentation-layer)
  - [The User Interface Flow](#the-user-interface-flow)
    - [Basic Overview](#basic-overview)
    - [Bulk Deals](#bulk-deals)
    - [Block Deals](#block-deals)
    - [Search by Client Name](#search-by-client-name)

## :rocket: Getting Started

1.  Install Flutter by following the official instruction at [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
    &nbsp;

2.  Clone this repo using the link in an empty directory

    ```shell
    git clone https://github.com/ajaytitus1386/GIS_Task.git
    ```

3.  Go to the root of the project and install the dependencies
    ```shell
    flutter pub get
    ```
4.  Next, run the app on a connected device such as an Android phone via USB or an [Android Virtual Device](https://docs.flutter.dev/get-started/install/windows#set-up-your-android-device)
    ```shell
    flutter run
    ```

## :ledger: Architecture

The architecture is sub-divided into three tiers : Data, Domain and Presentation

### :file_folder: Data Layer

This layer contains implementations for remote data calls and data models

- **datasources** : Remote data source to communicate with API endpoints
- **models** : Models of Data Objects and conversion logic to and from JSON
- **repo** : Contains the implementation of the repositories contracts in the domain layer.

### :briefcase: Domain Layer

- **entities** : The abstract class of the main data objects used in the business logic
- **repos** : Repository contracts of the intended methods to be implemented
- **usecases** : Intermediaries class where the business logic in the repos is executed.

### :iphone: Presentation Layer

Focuses on Flutter layout and the Widget Tree. Anything and everything to do with the UI is structured here

- **bloc** : contains the Events and States and a BLoC file to manage state based on triggered events
- **pages** : The individual views of the UI
- **widgets** : Reusuable and Extractable widget components
- **styling** : Constants for Colors, TextStyles, Sizes and so on

## The User Interface Flow

### Basic Overview

1. The app loads through the splash screen and into the home page which triggers an event to fetch particular data from the API.
2. The **Bussines Logic Controller** is listening for these events and when triggered it runs the corresponding implementation via the domain layer to the data layer.
3. Any data that needs to be passed back to the presentation layer is held in a particular **State** accessible to the Widget Tree.

### Bulk Deals

The initial view of the app after the splash screen which displays all the bulk deals after fetching data from the API
The three tiles **All, Buy, Sell** can be used to fetch bulk deals that fall under the specified DealType.

<img src="screenshots\bulk_deals.PNG" alt="Bulk Deals View">

### Block Deals

Effectively the same as the Bulk deals page however, this one fetches from the API using different query parameters for Block Deals.

<img src="screenshots\block_deals.PNG" alt="Block Deals View">

### Search by Client Name

Tapping on the Search Client Name bar will bring up the device keyboard and based on the input will filter the fetched data in the state by the **ClientName** attribute. This will instantly re-render the list to only show matching results or if none match, it displays a message to convey as such.

<img src="screenshots\search_by_client_name.PNG" alt="Search Bar Client Name">
