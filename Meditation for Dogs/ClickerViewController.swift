//
//  ClickerViewController.swift
//  Meditation for Dogs
//
//  Created by Whitney Powell on 4/11/16.
//  Copyright © 2016 Whitney Powell. All rights reserved.
//

import UIKit
import AVFoundation

class ClickerViewController: UIViewController {
    var clickerClick:AVAudioPlayer?
    let clickerClickFileName = "clickerClick"
    let clickerClickFileType = "wav"

    @IBAction func clickerClicked(sender: UIButton) {
        dispatch_async(dispatch_get_main_queue(), {(self.clickerClick?.play())})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup clickerClick sound
        clickerClick = SoundHelper.getAnAVAudioOptionalInstance(clickerClickFileName,fileType:clickerClickFileType)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
