# FactBook
FactBook will present you interesting facts which you may not know already. Yes it is amazing.

It is compatible with iOS (11.0 - 13.5)

Steps:

1. Initial Step up:
1.1 By Default the project is setup for iOS 13. For making it compatible for iOS 11 i gave the @available check on scene delegate. It made it compatible for iOS 13 but for iOS 11 we have to initialize UIWindow on the App Delegate too. Step 1.1 included these two changes.
1.2 Removed Main.storyboard and Default view controller to make the project storyboard free. We'll work without any xib or storyboard.
1.3 Added gitignore

2. Architecture:
2.1 I am choosing MVVM architecture and for that i have done the folder structuring and rearranged some of the default files. 
2.2 Added FactsViewController to launch the first screen of the project i.e also the main screen. You can run the code at this stage. you'll see a white screen
2.3 Added AppHelper and a function to setup the root window with the root view controller
2.4 Added constants file for theme configuration

3. At this stage we are ready to create our models for the project.
3.1 Created Fact Model to capture all the facts that are coming in the response. Used encapsulation so that no data is changed at runtime if there is some attack.
3.2 Created FactInfo Model to capture all the details related to facts that are coming in the response. Used encapsulation so that no data is changed at runtime if there is some attack.
3.3 Created DynamicValue Model to add observers to listen to the data changes (Observer Pattern)
3.4 Created GenericDataSource and Generic delegate to give the ownership of the model to viewModel and view to UIViewController

4. Worked on the Data Layer. Build the Network class, Service class, Request manager, network result handler.
Switched branches before this can a breaking functionality in the stable code we are having.
RequestService - Get the response from the server in the form of data
Request handler - Parse the data and stores it into the generic type for passing it to the service class.
FactsService - Interprets the generic type as FactsInfo and finally viewModel utilizes it. My next task is making Presentation Layer
Added reachability Library

5. Worked on the Presentation Layer
5.1 FactsViewController - Owner of the FactsViewModel , dataSource and delegate
      *Set up view, container view, data listeners in this class
5.2 FactListContainer - Owner of the tableView in which the fact list will be presented
5.3 FactsViewModel - Owner of the data model, responsible for calling the facts service, responsible for updating view and error handling
5.4 FactsDataSource - Responsible for showing data to the list 
5.5 FactsDelegate - Responsible for listening to the touch event on the tableviewcell
5.6 FactTableViewCell - Fact cell Responsible for displaying the cell
5.7 Many extensions have been created to help reuse most of the things

6. Wrote Test cases:
6.1. ViewModelTests : 
6.1.1 No Service Test
6.1.2 Fetching Facts success test
6.1.3 No Facts on return test

6.2 DataSource Test:
6.2.1 Empty Value Test
6.2.2 Correct value test
6.2.3 UITableViewCell return test

6.3 ServiceTests:
6.3.1 Cancel request test

6.4 ParserTests:
6.4.1 No Data Test
6.4.2 Wrong Data Test

- Generic value given a more sensible name


