//
//  ViewController.swift
//  QRreader
//
//  Created by Marcus Aurelius on 9/15/18.
//  Copyright © 2018 Aiden Song. All rights reserved.
//

import UIKit
import AVFoundation

struct trip:Decodable{
    let curr: String
    let dest: String
    let names: String
}

class ViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate {
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var square: UIImageView!
    var video = AVCaptureVideoPreviewLayer()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // creating a session
        let session = AVCaptureSession()
        
        // define capture
        let captureDevice = AVCaptureDevice.default(for: .video)
        
        do{
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        }catch{
            print("Error, no device")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        self.view.bringSubview(toFront: square)
//        self.view.bringSubview(toFront: myLabel)
        session.startRunning()
    }
    
    func metadataOutput(_ output:AVCaptureMetadataOutput, didOutput metadataObjects:[AVMetadataObject],from connection: AVCaptureConnection){
        if  metadataObjects.count != 0 {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject{
                if object.type == AVMetadataObject.ObjectType.qr{
                    
                    // read in the json code
//                    let jsonUrlString = "https://asong4211.github.io/Hack-The-North-JSON/" + object.stringValue! + ".json"
//
//                    let urlObject = URL(string:jsonUrlString)
//                    URLSession.shared.dataTask(with: urlObject!) {
//                        (data, response,error) in
//                        do{
//                            var trips = try JSONDecoder().decode([trip].self,from:data!)
//                            for trip in trips{
//                                print(trip.curr)
//                            }
//                        }catch{
//                            print("we got an error here")
//                        }
//                    }.resume()
                  
                    
                    
                    self.performSegue(withIdentifier: "toHome", sender: Any?.self)

                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

