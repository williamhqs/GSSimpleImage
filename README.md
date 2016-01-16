# GSSimpleImage

[![CI Status](http://img.shields.io/travis/William Hu/GSSimpleImage.svg?style=flat)](https://travis-ci.org/William Hu/GSSimpleImage)
[![Version](https://img.shields.io/cocoapods/v/GSSimpleImage.svg?style=flat)](http://cocoapods.org/pods/GSSimpleImage)
[![License](https://img.shields.io/cocoapods/l/GSSimpleImage.svg?style=flat)](http://cocoapods.org/pods/GSSimpleImage)
[![Platform](https://img.shields.io/cocoapods/p/GSSimpleImage.svg?style=flat)](http://cocoapods.org/pods/GSSimpleImage)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

**GSSimpleImageView** add full screen when you tap UIImageView, and tap again to exit full screen.

```
let imageView = GSSimpleImageView(frame: CGRectMake(20, 100, 200, 200))
imageView.image = UIImage(named: "test2.png")
self.view.addSubview(imageView)
```
## Requirements

## Installation

GSSimpleImage is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "GSSimpleImage"
```

## Author

William Hu, william.hqs@gmail.com

## License

GSSimpleImage is available under the MIT license. See the LICENSE file for more info.
