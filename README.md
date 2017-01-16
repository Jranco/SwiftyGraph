# SwiftyGraph

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftyGraph.svg?style=flat)](https://img.shields.io/cocoapods/v/SwiftyGraph.svg?style=flat)
[![Platform](https://img.shields.io/cocoapods/p/SwiftGraph.svg?style=flat)](http://cocoadocs.org/docsets/SwiftyGraph)

SwiftyGraph is a flexible library written in Swift containing an initial representation of a Graph data structure along with a set of algorithms to support different kinds of operations.


## Installation

### CocoaPods

1. Add `pod 'SwiftyGraph'` to your Podfile
2. Run `pod install`
3. Add `import SwiftyGraph` inside the file you want to use the library

## Basic Components

This library provides two main types of Graphs, **GraphUnweighted** and **GraphUnweighted** representing unweighted and weighted Graphs respectively. Both of these share the same codebase along with the required abstraction and can be initialised as **Directed** or **Undirected** during initialisation.

### Graph

#### Weighted



```swift
let myWeightedGraph = GraphWeighted.init(direction: .directed)
```

or

```swift
let myWeightedGraph = GraphWeighted.init(direction: .undirected)
```

#### Unweighted



```swift
let myUnweightedGraph = GraphWeighted.init(direction: .directed)
```

or

```swift
let myUnweightedGraph = GraphWeighted.init(direction: .undirected)
```

### Vertice

A Vertice in SwiftyGraph is represented as an enum, supporting the following two cases:

#### Default

This is a simple Vertice, containing only an *id* as associated value.

```swift
let verticeDefault = Vertice<Any>.default(id: "12")
```


#### Custom

A Custom Vertice, apart from the *id*, it contains additional data which take the type of the generic parameter T. The following code snippet shows how to create a custom Vertice representing a point on a map, containing a *CLLocation* object as additional data.

```swift
let location        = CLLocation.init(latitude: 52.5243700, longitude: 13.4105300)
let verticeLocation = Vertice<CLLocation>.custom(id: "18", data: location)
```

### Edge

#### Unweighted 

```swift
     myUnweightedGraph.addEdge(verticeA: v1, verticeB: v2)
```

#### Weighted 

A Weight assigned to the Edge in SwiftyGraph is represented as an enum, supporting the following two cases:

#### Default

```swift
myWeightedGraph.addEdge(verticeA: v1, verticeB: v2, weight: Weight.default(value: 7))
```

#### Custom

Lets take as an example a Graph where apart from the Weight value, we want to add also the distance between two locations:

```swift
let locationA = CLLocation.init(latitude: 52.5243700, longitude: 13.4105300)
let locationB = CLLocation.init(latitude: 54.5243700, longitude: 13.8105300)
let distanceA_B = locationA.distance(from: locationB)
```

A Custom Weight, apart from the *value*, it contains additional data which take a value of *'Any'* type. The following code snippet shows how to create a custom Vertice representing a point on a map, containing a *CLLocation* object as additional data.

```swift
myWeightedGraph.addEdge(verticeA: vA, verticeB: vB, weight: Weight.custom(value: 34, data: distanceA_B))
```

## Operations

## Built in Algorithms

