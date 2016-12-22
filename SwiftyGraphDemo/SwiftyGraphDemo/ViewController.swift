//
//  ViewController.swift
//  SwiftyGraphDemo
//
//  Created by Thomas Segkoulis on 12/12/16.
//  Copyright © 2016 Thomas Segkoulis. All rights reserved.
//

import UIKit
import SwiftyGraph

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        let myWeightedGraph = GraphWeighted.init(direction: .directed)
        
        let vZero = Vertice.vDefault(id: "zero")
        let vOne = Vertice.vDefault(id: "one")
        let vTwo = Vertice.vDefault(id: "two")
        
        myWeightedGraph.addEdge(origin: vZero, destination: vOne, weight: Weight.weightDefault(value: 1))
        myWeightedGraph.addEdge(origin: vTwo, destination: vOne, weight: Weight.weightDefault(value: 1))
        myWeightedGraph.addEdge(origin: vZero, destination: vTwo, weight: Weight.weightDefault(value: 8))
  
        let myUnweightedGraph = GraphUnweighted.init(direction: .directed)
        
        let uvZero = Vertice.vDefault(id: "zero")
        let uvOne  = Vertice.vDefault(id: "one")
        let uvTwo  = Vertice.vDefault(id: "two")

        myUnweightedGraph.addEdge(origin: uvZero, destination: uvTwo)

        myUnweightedGraph.printGraph()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

