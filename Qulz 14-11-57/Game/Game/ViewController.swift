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
        square = UIView(frame: CGRect(x:150,y:20,width:30,height:30 ));
        square.backgroundColor=UIColor.whiteColor()
        view.addSubview(square)
        
        // Add Gravity
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items:[square])
        animator.addBehavior(gravity)
        
        //Add Barrier Item
        let barrier = UIView(frame: CGRect(x: 90 ,y: 150, width: 150, height: 10))
        barrier.backgroundColor = UIColor.yellowColor()
        view.addSubview(barrier)
       let barrier2 = UIView(frame: CGRect(x: 0 ,y: 220, width: 150, height: 10))
        barrier2.backgroundColor = UIColor.greenColor()
        view.addSubview(barrier2)
        let barrier3 = UIView(frame: CGRect(x: 120 ,y: 280, width: 280, height: 10))
        barrier3.backgroundColor = UIColor.blueColor()
        view.addSubview(barrier3)
        let barrier4 = UIView(frame: CGRect(x: 0 ,y: 330, width: 250, height: 10))
        barrier4.backgroundColor = UIColor.redColor()
        view.addSubview(barrier4)
        
        let barrier5 = UIView(frame: CGRect(x: 90 ,y: 380, width: 10, height: 100))
        barrier5.backgroundColor = UIColor.redColor()
        view.addSubview(barrier5)
        let barrier6 = UIView(frame: CGRect(x: 140 ,y: 380, width: 10, height: 100))
        barrier6.backgroundColor = UIColor.redColor()
        view.addSubview(barrier6)
        let barrier7 = UIView(frame: CGRect(x: 190 ,y: 380, width: 10, height: 100))
        barrier7.backgroundColor = UIColor.redColor()
        view.addSubview(barrier7)
        let barrier8 = UIView(frame: CGRect(x: 200 ,y: 380, width: 10, height: 100))
        barrier8.backgroundColor = UIColor.redColor()
        view.addSubview(barrier8)

        let barrier9 = UIView(frame: CGRect(x: 40 ,y: 380, width: 10, height: 100))
        barrier9.backgroundColor = UIColor.redColor()
        view.addSubview(barrier9)

        let barrier10 = UIView(frame: CGRect(x: 250 ,y: 380, width: 10, height: 100))
        barrier10.backgroundColor = UIColor.redColor()
        view.addSubview(barrier10)

        
        
        //Add Collision
        collision = UICollisionBehavior(items: [square])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
        //add a boundary that has the same frame as the barier
        collision.addBoundaryWithIdentifier("barrier", forPath:UIBezierPath(rect: barrier.frame))
        collision.addBoundaryWithIdentifier("barrier2", forPath:UIBezierPath(rect: barrier2.frame))
        collision.addBoundaryWithIdentifier("barrier3", forPath:UIBezierPath(rect: barrier3.frame))
        collision.addBoundaryWithIdentifier("barrier4", forPath:UIBezierPath(rect: barrier4.frame))
        collision.addBoundaryWithIdentifier("barrier5", forPath:UIBezierPath(rect: barrier5.frame))
        collision.addBoundaryWithIdentifier("barrier6", forPath:UIBezierPath(rect: barrier6.frame))
        collision.addBoundaryWithIdentifier("barrier7", forPath:UIBezierPath(rect: barrier7.frame))
        collision.addBoundaryWithIdentifier("barrier8", forPath:UIBezierPath(rect: barrier8.frame))
        collision.addBoundaryWithIdentifier("barrier9", forPath:UIBezierPath(rect: barrier9.frame))
        collision.addBoundaryWithIdentifier("barrier10", forPath:UIBezierPath(rect: barrier10.frame))
        
        
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

