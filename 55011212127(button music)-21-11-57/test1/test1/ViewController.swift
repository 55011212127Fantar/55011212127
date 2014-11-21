import UIKit
import CoreMotion
import AVFoundation

class ViewController: UIViewController {
    
    var t1 = 0,t2=0 ,t3=0
    
    
    @IBAction func Test1(sender: AnyObject) {
        
        audioPlayer1.play()
    }
    
    @IBAction func Test2(sender: AnyObject) {
        
        audioPlayer1.stop()
    }
    
  /*  @IBAction func Test3(sender: AnyObject) {
        
        
    }*/
    var audiPlayer = AVAudioPlayer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coreAdio()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    var audioPlayer1 = AVAudioPlayer()
    
    func coreAdio(){
        var url1 = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("test1", ofType: "mp3")!)
        
        var error:NSError?
        audioPlayer1 = AVAudioPlayer(contentsOfURL: url1, error: &error)
        audioPlayer1.prepareToPlay()
        
        
        
        
    }}