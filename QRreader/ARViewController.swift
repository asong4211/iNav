//
//  ARViewController.swift
//  QRreader
//
//  Created by Adi Bhatia on 2018-09-15.
//  Copyright © 2018 Aiden Song. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ARViewController: UIViewController, ARSCNViewDelegate {
    var temp = false
    @IBAction func Record(_ sender: UIButton) {
        temp = true
    }
    
    var data = [String : [Double]]()
    
    @IBOutlet var sceneView: ARSCNView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // use json to parse the location
        //let arr = data
        // this is the data for room 1249
        let arr = data
        //Creating a new scene
        print(arr)
        let lenthArr = (arr["x"]?.count)! - 1
        for i in 0...lenthArr{
            let sphere = SCNSphere(radius:0.1)
            let material = SCNMaterial()
            material.diffuse.contents = UIColor.white
            sphere.materials = [material]
            let node = SCNNode()
            node.position = SCNVector3(x:Float(arr["x"]![i]), y:Float(arr["y"]![i]),z:Float(arr["z"]![i]))
            node.geometry = sphere
            sceneView.scene.rootNode.addChildNode(node)
            // the below line is only used for debugging
            //self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints,ARSCNDebugOptions.showWorldOrigin]
            sceneView.autoenablesDefaultLighting = true
        }

        
    }
    
  
    func addTwo(lhv:SCNVector3, rhv:SCNVector3) -> SCNVector3 {
        return SCNVector3(lhv.x + rhv.x, lhv.y + rhv.y, lhv.z + rhv.z)
    }
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        
        guard let pointOfView = sceneView.pointOfView else { return }
        let transform = pointOfView.transform
        //let orientation = SCNVector3(-transform.m31, -transform.m32, transform.m33)
        let location = SCNVector3(transform.m41, transform.m42, transform.m43)
        let currentPositionOfCamera  = location
        if temp == true{
            print(currentPositionOfCamera)
            temp = false;
        }
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}



