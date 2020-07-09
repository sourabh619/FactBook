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

3. At this stage we'll switch to the development branch as we are ready to create our models for the project.
Branch factbook-dev
3.1 Created Fact Model to capture all the facts that are coming in the response. Used encapsulation so that no data is changed at runtime if there is some attack.
3.2 Created FactInfo Model to capture all the details related to facts that are coming in the response. Used encapsulation so that no data is changed at runtime if there is some attack.
3.3 Created DynamicValue Model to add observers to listen to the data changes (Observer Pattern)
3.4 Created GenericDataSource and Generic delegate to give the ownership of the model to viewModel and view to UIViewController

4.0 Worked on the Data Layer. Build the Network class, Service class, Request manager, network result handler.
Switched branches before this can a breaking functionality in the stable code we are having.
RequestService - Get the response from the server in the form of data
Request handler - Parse the data and stores it into the generic type for passing it to the service class.
FactsService - Interprets the generic type as FactsInfo and finally viewModel utilizes it. My next task is making Presentation Layer
Added reachability Library
