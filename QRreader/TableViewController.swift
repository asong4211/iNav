//
//  ViewController.swift
//  QRreader
//
//  Created by Marcus Aurelius on 9/15/18.
//  Copyright © 2018 Aiden Song. All rights reserved.
//

import UIKit
import AVFoundation

// this class is primarily used for the segue between the qr code and the
class TableViewController: UIViewController {
    @IBOutlet weak var locationToGo: UILabel!
    
    @IBOutlet weak var washImg: UIImageView!
    @IBOutlet weak var quietImg: UIImageView!
    @IBOutlet weak var room1427Img: UIImageView!
    @IBOutlet weak var elevatorImg: UIImageView!
    
    //let vc = ARViewController()
    var data = [String : [Double]]()
    
    @IBAction func washAction(_ sender: UIButton) {
        
        self.data = [
            "x":[0.134249121,0.449385971,0.55,0.55,0.70,1.50,1.8,1.23434155,-1.68046713,-6.16991758,-12.7871971,-17.5291958,],
            "y":[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,],
            "z":[-0.579975545,-3.65786052,-6.56569815,-10.5181684,-13.2360897,-18.7201805,-21.5751476,-24.181345,-25.7771645,-26.8030167,-27.9402733,-29.1691208]
        ]
        self.performSegue(withIdentifier: "toAR", sender: sender)
    }
    @IBAction func quietAction(_ sender: UIButton) {
        self.data = [ "x":[0.0554516427,-0.259707272,-0.635170102,-1.8860302,-4.88668489,-9.13678741,],
                      "y": [-1,-1,-1,-1,-1,-1,],
                      "z":[-0.034866605,-3.71154475,-6.62841034,-7.96071243,-11.4951572,-13.9266825,],
        ]
        self.performSegue(withIdentifier: "toAR", sender: sender)
    }
    
    @IBAction func room1427Action(_ sender: UIButton) {
        self.data = [
            "x":[0.10811504,0.449724793,1.048051,1.59280097,2.6155026,3.00964284,2.30475688,1.32738507,1.46840477],
            "y":[-1,-1,-1,-1,-1,-1,-1,-1,-1],
            "z":[-1.02556896,-3.23727584,-6.81792784,-10.4435196,-16.0189724,-19.213522,-27.7247982,-33.6011658,-37.5411949]
        ]
        self.performSegue(withIdentifier: "toAR", sender: sender)
    }
    @IBAction func elevatorAction(_ sender: UIButton) {
        self.data  = [
        "x":[0.134249121,0.449385971,0.55,0.55,0.70,1.50,1.8,1.23434155,-1.68046713,-6.16991758,-12.7871971,],
        "y":[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,],
        "z":[-0.579975545,-3.65786052,-6.56569815,-10.5181684,-13.2360897,-18.7201805,-21.5751476,-24.181345,-25.7771645,-26.8030167,-27.9402733,]
        ]
        self.performSegue(withIdentifier: "toAR", sender: sender)
    }
    
    
    
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "toAR") {
            if let vc: ARViewController = segue.destination as? ARViewController {
                vc.data = self.data
            }
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }
    
    
    
}

/*
 
 // this is the data for room 1249
 let arr = [
 "x":[0.10811504,0.449724793,1.048051,1.59280097,2.6155026,3.00964284,2.30475688,1.32738507,1.46840477],
 "y":[-1,-1,-1,-1,-1,-1,-1,-1,-1],
 "z":[-1.02556896,-3.23727584,-6.81792784,-10.4435196,-16.0189724,-19.213522,-27.7247982,-33.6011658,-37.5411949]
 ]
 */


/*
 
 //this is for the bathrooms
 let arr = [
 "x":[0.134249121,0.449385971,0.55,0.55,0.70,1.50,1.8,1.23434155,-1.68046713,-6.16991758,-12.7871971,-17.5291958,],
 "y":[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,],
 "z":[-0.579975545,-3.65786052,-6.56569815,-10.5181684,-13.2360897,-18.7201805,-21.5751476,-24.181345,-25.7771645,-26.8030167,-27.9402733,-29.1691208]
 ]
 
 */

/*
 // this is for the elevator
 let arr = [
 "x":[0.134249121,0.449385971,0.55,0.55,0.70,1.50,1.8,1.23434155,-1.68046713,-6.16991758,-12.7871971,],
 "y":[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,],
 "z":[-0.579975545,-3.65786052,-6.56569815,-10.5181684,-13.2360897,-18.7201805,-21.5751476,-24.181345,-25.7771645,-26.8030167,-27.9402733,]
 ]
 
 */

/*
 
 // this is for the quiet study room
 let arr = [ "x":[0.0554516427,-0.259707272,-0.635170102,-1.8860302,-4.88668489,-9.13678741,],
 "y": [-1,-1,-1,-1,-1,-1,],
 "z":[-0.034866605,-3.71154475,-6.62841034,-7.96071243,-11.4951572,-13.9266825,],
 ]
 */

