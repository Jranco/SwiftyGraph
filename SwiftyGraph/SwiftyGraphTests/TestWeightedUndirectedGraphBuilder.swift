//
//  TestWeightedGraphBuilder.swift
//  SwiftyGraph
//
//  Created by Thomas Segkoulis on 13/01/17.
//  Copyright © 2017 Thomas Segkoulis. All rights reserved.
//

import XCTest
import SwiftyGraph

class TestWeightedUndirectedGraphBuilder: XCTestCase
{
    // MARK: - Graph -
    
    var undirectedGraph: GraphWeighted!

    // MARK: - Vertices -
    
    var verticeA: Vertice<Any>!
    var verticeB: Vertice<Any>!
    var verticeC: Vertice<Any>!
    var verticeD: Vertice<Any>!
    var verticeE: Vertice<Any>!
    
    var localVerticeArray: [VerticeProtocol] = []

    // MARK: - Setup -

    override func setUp()
    {
        super.setUp()

        /**
         Init Graph
         */
        
        undirectedGraph = GraphWeighted.init(direction: .undirected)


        /**
         Init Vertices
         */
        
        verticeA = Vertice<Any>.default(id: "A")
        verticeB = Vertice<Any>.default(id: "B")
        verticeC = Vertice<Any>.default(id: "C")
        verticeD = Vertice<Any>.default(id: "D")
        verticeE = Vertice<Any>.default(id: "E")
        
        localVerticeArray = [verticeA, verticeB, verticeC, verticeD, verticeE]
        
        /**
         Add edges in Graph
         */
        
        let unweightedGraph = GraphUnweighted.init(direction: .undirected)
        
        unweightedGraph.addEdge(verticeA: verticeC, verticeB: verticeB)
        
        undirectedGraph?.addEdge(verticeA: verticeA!, verticeB: verticeB!, weight: Weight<Any>.default(value: 3))
        undirectedGraph?.addEdge(verticeA: verticeA!, verticeB: verticeD!, weight: Weight<Any>.default(value: 7))
        undirectedGraph?.addEdge(verticeA: verticeB!, verticeB: verticeD!, weight: Weight<Any>.default(value: 2))
        undirectedGraph?.addEdge(verticeA: verticeB, verticeB: verticeC!, weight: Weight<Any>.default(value: 4))
        undirectedGraph?.addEdge(verticeA: verticeD, verticeB: verticeC, weight: Weight<Any>.default(value: 5))
        undirectedGraph?.addEdge(verticeA: verticeD, verticeB: verticeE, weight: Weight<Any>.default(value: 4))
        undirectedGraph?.addEdge(verticeA: verticeC, verticeB: verticeE, weight: Weight<Any>.default(value: 6))
    }
    
    // MARK: - TearDown -

    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Tests -

    func testExistenceOfInverseEdge()
    {
        for (verticeA, nearby) in (undirectedGraph?.adjacency)!
        {
            
            for (verticeB, _) in nearby
            {
                
                if(undirectedGraph?.adjacency[verticeB]?[verticeA] == nil)
                {
                    XCTAssert(false, "Error: Inverse edge doesn't exist")
                }
            }
        }
    }
    
    func testCorrectAssignmentOfEdges()
    {
        if (undirectedGraph.existsEdge(from: verticeA, to: verticeB) &&
            undirectedGraph.existsEdge(from: verticeA, to: verticeD) &&
            undirectedGraph.existsEdge(from: verticeB, to: verticeD) &&
            undirectedGraph.existsEdge(from: verticeB, to: verticeC) &&
            undirectedGraph.existsEdge(from: verticeD, to: verticeC) &&
            undirectedGraph.existsEdge(from: verticeD, to: verticeE) &&
            undirectedGraph.existsEdge(from: verticeC, to: verticeE))
        {
            if (!undirectedGraph.existsEdge(from: verticeA, to: verticeC) &&
                !undirectedGraph.existsEdge(from: verticeA, to: verticeE) &&
                !undirectedGraph.existsEdge(from: verticeB, to: verticeE) &&
                !undirectedGraph.existsEdge(from: verticeC, to: verticeA))
            {
                XCTAssert(true)
            }
            else
            {
                XCTAssert(false, "Error: Edge doesn't exist")
            }
        }
        else
        {
            XCTAssert(false, "Error: Edge doesn't exist")
        }
    }
    
    func testCorrectAssignmentOfVertices()
    {
        // Check if 'existsVertice' function is working correctly, checking existence of vertice inside verticeDictionary
        for vertice in localVerticeArray
        {
            if(!undirectedGraph.existsVertice(vertice: vertice))
            {
                XCTAssert(false, "Error: Vertice doesn't exist")
            }
        }
        
        // Check if 'verticeArray' contains all vertices
        
        guard localVerticeArray.count == undirectedGraph.verticeArray.count else {
            XCTAssert(false, "Error: Vertice doesn't exist")
            return
        }

        // TODO compare two arrays
        
        XCTAssert(true)

    }
    
    func testDijkstraCorrectPath()
    {
    }
    
    func testPerformanceExample()
    {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
