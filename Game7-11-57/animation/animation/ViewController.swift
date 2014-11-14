//
//  ViewController.swift
//  animation
//
//  Created by student on 11/7/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollisionBehaviorDelegate
{
    var square:UIView!
    var animator : UIDynamicAnimator!
    var gravity : UIGravityBehavior!
    var collision : UICollisionBehavior!
    var firstContact = false
    var snap :UISnapBehavior!
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
       
        
        //Square Item
        square = UIView(frame: CGRect(x:100,y:100,width:75,height:75 ));
        square.backgroundColor=UIColor.grayColor()
        view.addSubview(square)
        
        // Add Gravity
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items:[square])
        animator.addBehavior(gravity)
        
        //Add Barrier Item
        let barrier = UIView(frame: CGRect(x: 0 ,y: 300, width: 130, height: 20))
        barrier.backgroundColor = UIColor.redColor()
        view.addSubview(barrier)

        //Add Collision
        collision = UICollisionBehavior(items: [square])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        //add a boundary that has the same frame as the barier
        collision.addBoundaryWithIdentifier("barrier", forPath:UIBezierPath(rect: barrier.frame))
        
            collision.action =
            {
                println("\(NSStringFromCGAffineTransform(self.square.transform))\(NSStringFromCGPoint(self.square.center))")
            }
        collision.collisionDelegate = self//define default
        
        //Add elasticity
        let itemBehaviour = UIDynamicItemBehavior(items: [square])
        itemBehaviour.elasticity = 1
        animator.addBehavior(itemBehaviour)
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func collisionBehavior(behavior: UICollisionBehavior!, beganContactForItem item: UIDynamicItem!, withBoundaryIdentifier identifier: NSCopying!, atPoint p: CGPoint)
    {
        println("Boundary contact occurred - \(identifier)")
        let collidingView = item as UIView
        collidingView.backgroundColor = UIColor.yellowColor()
        UIView.animateWithDuration(2)
            {
                collidingView.backgroundColor = UIColor.cyanColor()
            }
        if(!firstContact)
        {
                //let square = UIView(frame: CGRect(x: 30,y: 0, width :20,height:20))
            
                let square = UIView(frame: CGRect(x:self.view.frame.origin.x + self.square.frame.origin.x, y: self.view.frame.origin.y + self.square.frame.origin.y,width:10,height:10))
                square.backgroundColor = UIColor.grayColor()

  
                view.addSubview(square)
            
                collision.addItem(square)
                gravity.addItem(square)

            
                let attach = UIAttachmentBehavior(item:collidingView,attachedToItem:square)
                animator.addBehavior(attach)
            
                //firstContact = true;
            
            
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
          }
    
    override func touchesEnded(touches : NSSet, withEvent event : UIEvent)
    {
        if(snap != nil)
        {
            animator.removeBehavior(snap)
        }
        
        let touch = touches.anyObject() as UITouch
        snap = UISnapBehavior(item: square, snapToPoint: touch.locationInView(view))
        animator.addBehavior(snap)
    }


}

