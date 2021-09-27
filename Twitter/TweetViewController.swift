//
//  TweetViewController.swift
//  Twitter
//
//  Created by Ilya Zlatkin on 26.09.2021.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var TweetText: UITextView!
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func Tweet(_ sender: Any) {
        if(!TweetText.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: TweetText.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TweetText.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
