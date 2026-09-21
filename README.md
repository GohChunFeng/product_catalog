# product_catalog

List of product catalog using json data from API

## Platform
This is created with Flutter. 

## How to run
- You need to have the Flutter installed in your machine.
- Run command `flutter pub get` to get the package installed.
- Run command `dart run build_runner build` to rebuilt all the generated files to ensure no conflicts.
- `main.dart` is the entry files for this app. Other entry files can be found in the environments folder, but it won't affect anything.
- For example, can run command like `flutter run lib/app_base/environments/prod_env.dart` to run the app in production environment.

## Content
- This app contains only TWO screens.
    - Product Catalog view
      - This page will show the list of products get from API response with a 0.5 second debounce of the search function.
      - You can pull to refresh the page to get the latest data.
      - If you reach the end of the list, the app will load more product from the API response until all product loaded.
      - Each product can be clicked to navigate to the detail page.
    - Product Detail view
      - This is the page where it will show the details of the product you just selected
      - Can click on the back button to go back to the product catalog view.

## Technical Stuff
- Handling State
  - This app use Bloc for state management.
  - the Cubit code can be found in the respective feature folder.
- Refresh
  - This app use `EasyRefresh` package to handle the refresh and load more items.
- Placeholder
  - this app use `Skeletonizer` package to handle the UI when the items are loading.
- Search
  - This app has a file that contain a chunk of code to handle the timing to trigger API call. The file can be found in `utils/debounce_helper.dart`
- Switching between views
  - This app has a file that contain a chunk of code to handle the which view/state to be shown in the page. Can refer `utils/load_state.dart`. This file basically write down the scenario that the app can hit when loading data from the API to reduce boilerplate code.
- File structure
  - The main folders in this app/structure is the `features` and `services`.
  - features folder will contain the business logic and the view
    - normally will have 3 folders
      - cubit - this is for the Bloc
      - model - this is list out the response or request model, but in this case only use response
      - view - contains all the UI
    - sometime will have widgets folder, to store some custom widget that only use in specific feature, else will put into under `lib/widgets`
  - services folder will handle the data
    - normally will have 2 folders
      - repositories - this is use for doing some modification on data, or saving data to local storage etc
      - api - this is use for list down the API url