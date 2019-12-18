# assignment-dott

[Dunya Kirkali](https://github.com/dunyakirkali)'s assignment for [dott](https://ridedott.com/).

## Intro

This assignment is a simple FourSquare API client which displays restaurants on a map and allows the user to tap on any restaurant in order to get more information.

## Getting Started

0- In order to run the app you'll first need [Ruby](https://www.ruby-lang.org/en/) 2.4.1 or higher with the [bundler](https://bundler.io/) gem installed.
1- Then you can run `bundle install` on the root of the project in order to get the ruby dependencies installed.
2- Once the needed gems are installed then you can run `pod install` in order to get the app's dependencies.
3- Configure the API KEY and API SECRET located in the [Release.xcconfig](https://github.com/dunyakirkali/assignment-dott/blob/master/dott/Configuration/Release.xcconfig) and replace the values with a key that doesn't have any quota limitations.
4- And finally open `dott.xcworkspace`
5-
  a- Run the tests
  b- Run the app

## Tech

### Architecture

This app uses a Redux architecture as it's backbone which allows one to decouple the state of the app from the components that are used to build the app.

### Dependencies

#### [ReSwift](https://github.com/ReSwift/ReSwift)

This library is the core of the architecture that I've experimented with during this assignment.
It borrows a couple of essential concepts from functional languages and applies it to iOS/MacOS.

#### [Kingfisher](https://github.com/onevcat/Kingfisher)

Is a well known library to deal with the fetching of remote images and caching them.

#### [Reusable](https://github.com/AliSoftware/Reusable)

A handy library simplifying the loading of views  from storyboards and/or xib's.

#### [Moya](https://github.com/Moya/Moya)

A wrapper around Alamofire that allows a declerative way of defining an API client.
