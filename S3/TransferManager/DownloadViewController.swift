//
//  DownloadViewController.swift
//  AWS S3 Example
//
//  Created by Ameenah Burhan on 8/27/17.
//  Copyright © 2017 Ameenah Burhan. All rights reserved.
//

import UIKit
import AWSS3
import AWSCognito
import AWSCore

class DownloadViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let transferManager = AWSS3TransferManager.default()
        
        let downloadingFileURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("temp.jpg")
        
        if let downloadRequest = AWSS3TransferManagerDownloadRequest(){
            downloadRequest.bucket = "codebean-s3-sample"
            downloadRequest.key = "impossibly-cute-puppy-21.jpg"
            downloadRequest.downloadingFileURL = downloadingFileURL
            
            transferManager.download(downloadRequest).continueWith(executor: AWSExecutor.default(), block: { (task: AWSTask<AnyObject>) -> Any? in
                if( task.error != nil){
                    print(task.error!.localizedDescription)
                    return nil
                }
            
                print(task.result!)
                
                if let data = NSData(contentsOf: downloadingFileURL){
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.image.image = UIImage(data: data as Data)
                    })
                }
            return nil
            })
        }
    }


}

