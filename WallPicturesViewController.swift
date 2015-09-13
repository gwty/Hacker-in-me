//
//  WallPicturesViewController.swift
//  ParseTutorial
//
//  Created by Ron Kliffer on 3/6/15.
//  Copyright (c) 2015 Ron Kliffer. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class WallPicturesViewController: UIViewController {

    @IBOutlet weak var wallScroll: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //Clean the scroll view
        cleanWall()
        
        //Reload the wall
        getWallImages()
    }
    
    // MARK: - Wall
    func cleanWall()
    {
      // for viewToRemove in wallScroll.subviews {
    //        if let viewToRemove = viewToRemove as? UIView {
   // //            viewToRemove.removeFromSuperview()
   //         }
   //     }
    }
    
    func getWallImages() {
        var query = PFQuery(className: "UserImages")
     ////   var messages = query.findObjects() as!  [PFObject]
     //   var images = query.whereKey("Username", equalTo: PFUser.currentUser()!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                if let objects = objects as? [PFObject] {
                    let object = objects.last as PFObject?
                    if let file = object?.objectForKey("imageFile") as? PFFile {
                        file.getDataInBackgroundWithBlock {
                            (imageData: NSData?, error: NSError?) -> Void in
                            if error == nil {
                                if let imageData = imageData {
                                 //   let imagea = UIImage(data:imageData)
                                 //   if imagea==nil
                                 //   {
                                 ///        var dummy=1
                                //    }
                                //    else
                                //    {
                                //    self.imageView.image=imagea

                   
                                   // self.wallScroll = UIScrollView(frame: self.view.bounds)
                                 //   self.wallScroll.backgroundColor = UIColor.blackColor()
                                  //  self.wallScroll.contentSize = self.imageView.bounds.size
                               //     self.wallScroll.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
                                     //   }
                               //                                 }
                            
                        }
                    }
                    
                }
            }
        }
            } }
    
    }
     ///   for image in images
     //   {
      //      let imagedata = image as! PFFile
      //      imagedata.
       
       //         imageView.file = imagedata
       //         imageView.loadInBackground()
       //
       //         wallScroll = UIScrollView(frame: view.bounds)
      //          wallScroll.backgroundColor = UIColor.blackColor()
       //         wallScroll.contentSize = imageView.bounds.size
       //         wallScroll.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
                
       //         wallScroll.addSubview(imageView)
       //         view.addSubview(wallScroll)
            
      //  }
    
    //}
    
    // MARK: - Actions
    @IBAction func logOutPressed(sender: AnyObject) {
        //TODO
        //If logout succesful:
        navigationController?.popToRootViewControllerAnimated(true)
    }
}