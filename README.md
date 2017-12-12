# Modular

[![CircleCI](https://img.shields.io/circleci/project/github/manGoweb/Modular/master.svg?style=plastic)](https://circleci.com/gh/manGoweb/Modular)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/Modular.svg?style=flat)](http://cocoapods.org/pods/Modular)
[![License](https://img.shields.io/cocoapods/l/Modular.svg?style=flat)](http://cocoapods.org/pods/Modular)
[![Platform](https://img.shields.io/cocoapods/p/Modular.svg?style=flat)](http://cocoapods.org/pods/Modular)
[![Twitter](https://img.shields.io/badge/twitter-@rafiki270-blue.svg?style=flat)](http://twitter.com/rafiki270)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

SnapKit, yes, we didn't try to reinvent the wheel, we just want to make your life a bit easier if possible while using it!

## Installation

Modular is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Modular'
```

For Carthage do:

```ruby
github 'manGoweb/Modular'
```

## Usage

```Swift
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Make a view and fill all space with it
        let canvas1 = RandomView()
        canvas1.place.on(andFill: view)

        let view1 = RandomView()
        view1.place.on(canvas1, height: 20).with.topMargin().and.sideToSide()

        let label1 = RandomLabel()
        label1.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nUt eu viverra orci. Morbi nulla diam, ornare sit amet bibendum aliquet, lacinia et purus. Ut lacinia bibendum dapibus."
        label1.place.below(view1).with.sideMargins()

        // Make a square view and place it to the left
        let view2 = RandomView()
        view2.place.below(label1).make.square(side: 40).add.leftMargin()

        // Make a circle and place it next to the previous view
        let circle1 = RandomView()
        circle1.place.next(to: view2).make.circle(radius: 30)

        // View will be placed below the one that is lowest
        let view3 = RandomView()
        view3.place.below([view2, circle1], height: 40).with.sideMargins()

        // Two views on sides with one filling space in the middle
        let canvas2 = RandomView()
        canvas2.place.below(view3).sideMargins()

        let leftView1 = RandomView()
        leftView1.place.on(canvas2).add.topMargin().make.rectangle(width: 30, height: 30).with.leftMargin().and.minBottomMargin()

        let rightView1 = RandomView()
        rightView1.place.on(canvas2).add.topMargin().make.rectangle(width: 30, height: 10).with.rightMargin().minBottomMargin()

        let middleView1 = RandomView()
        middleView1.place.between(leftView1, and: rightView1, height: 50).with.minBottomMargin()

        // Making a horizontal stack view
        let views = [
            RandomView().make.square().width(30).view,
            RandomView().make.circle(radius: 10).view,
            RandomView().make.rectangle(width: 20, height: 30).view,
            RandomView().make.circle(radius: 30).view,
            RandomView().make.square(side: 10).view
        ]
        let stackView1 = views.make.horizontalStackView()
        stackView1.place.below(canvas2, height: 30).with.sideMargins()
    }

}
```

## Debugging views & constraints

Using modular you can also get a high level idea why are your views now showing for example.

```Swift
// Print constraint info about the stack view
view2.debug.constraints()
// or for full "Apple" debug info on all involved constraints
view2.debug.constraints(debugType: .full)
```

The default debug version will print out something similar to this:
```text
Modular:
View memory address: 0x7fc57fe074b0
Current constraints:
    - left
    - height
    - bottom
    - right
    - top
    - Internally width relates to height
```

## Author

Ondrej Rafaj, developers@mangoweb.cz

## License

Modular is available under the MIT license. See the LICENSE file for more info.
