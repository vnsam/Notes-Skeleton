# Notes-Skeleton
Simple blueprint for a note taking application.

**Architecture Used:**

MVVM.

Chose this architecture since the navigation is between 2 screens only. i.e - between master and detail only.

**UI Design Choice:**

`UISplitViewController` is used since the nature of the application falls on this category of `Master -> Detail` flow.

Using `SplitViewController` also gives us the flexibility of running the app in `Portait, Landscape` mode and the system will handle the `screen layout` automatically. If we choose to run the app in `iPad` the layout is configured automatically by the system.

**Highlights:**

1. Used `CoreData` to support out of the box for `UITableView` UI.
2. Used the `viewContext` while creating new objects to be persisted.
3. `Save` is only called when the app goes to background or it's about to be purged from memory by the system. (Could save on demand as well in background thread.)
4. All the view controllers are driven by `ViewModel` objects. The state displayed in the UI could be unit tested if the `ViewModels` are tested for state.
5. We can mock the `ViewModel` objects and perform unit tests.
6. Code generation in Core Data is automatic.
7. Callback to ViewModel on data change is driven by `NSFetchedResultsControllerDelegate` - Delegate pattern used.
8. Dependencies are injected as properties for them to be mocked in unit tests.

**Note:**
All code is written with zero implementation as advised. This is just a blueprint for the code.

