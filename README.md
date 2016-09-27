# SwiftRevealViewController

Code based side menu controller based on [Joan Lluch](https://github.com/John-Lluch) [SWRevealViewController](https://github.com/John-Lluch/SWRevealViewController).

This side menu is implemented in code opposed to SWRevealViewController and some other that are based on using storyboards and seague.

## Requirements

* xCode 8 and Swift3.
* iOS 10.0 or later.
* ARC memory management.

## Usage

Add `SWRevealViewController.h` and `SWRevealViewController.m` files by drag-and-drop to your Xcode project. It is recommended checking out "Copy items..." and selecting "Create groups...".
Copying this files will automatically create bridging header where you need to add `#import "SWRevealViewController.h"`

After that you need to create and copy code for extension classes `UIApplication.swift`, `UIViewController.swift`, `UIPanGestureRecognizer.swift` and `ContainerSWRevealViewController.swift`

Last thing is to add some code in `AppDelegate.swift` (just copy createMenuView() method and call it inside AppDelegate `didFinishLaunchingWithOptions` method)

Use `setNavigationBarItem()`, `setNavigationBarItemLeft()` or `setNavigationBarItemRight()` in `viewWillAppear(_ animated: Bool)` for showing both, left or right menu.

Use `removeNavigationBarItem()`, `removeNavigationBarItemLeft()` or `removeNavigationBarItemRight()` in `viewWillAppear(_ animated: Bool)` for removing both, left or right menu.

## Special Mention

A Special Thank to [Joan Lluch](https://github.com/John-Lluch).

This code uses his class [SWRevealViewController](https://github.com/John-Lluch/SWRevealViewController), it just adds a bridging to Swift3 and it is implemented in code instead of using storyboards.

## License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is furnished
to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

