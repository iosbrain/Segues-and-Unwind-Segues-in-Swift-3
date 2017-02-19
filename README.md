# Segues and Unwind Segues in Swift 3
A project (Xcode 8.2.1) demonstrating segues and unwind segues in iOS 10 with Swift 3. This project demonstrates transitions -- segues -- from one source storyboard scene to another destination scene, and unwind segues leading back from destination to source. Segues don't exist in a vacuum. I've introduced a UINavigationController into the mix. Of course, you'll see the UIViewController. I've also used a UITableView and managed its complexity by breaking it into logical pieces by using Swift "extensions."

## Xcode 8.2.1 project settings
**To get this project running on the Simulator or a physical device (iPhone, iPad)**, go to the following locations in Xcode and make the suggested changes:

1. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Signing
- [ ] Tick the "Automatically manage signing" box
- [ ] Select a valid name from the "Team" dropdown
  
2. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Identity
- [ ] Change the "com.yourDomainNameHere" portion of the value in the "Bundle Identifier" text field to your real reverse domain name (i.e., "com.yourRealDomainName.Project-Name").
