//
//  TweetsCell.swift
//  Twitter
//
//  Created by Ilya Zlatkin on 19.09.2021.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetsCell: UITableViewCell {
    
    var favorite:Bool = false
    var reTweeted:Bool = false
    var tweetId:Int = -1
    
    @IBOutlet weak var tweetImage: UIImageView!
    @IBOutlet weak var userNameLable: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
    
    @IBOutlet weak var favorButtom: UIButton!
    @IBOutlet weak var reTweetButton: UIButton!
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorite
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (Error) in
                print("Favorite did not succed: \(Error)")
            })
        } else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (Error) in
                print("Favorite did not succed: \(Error)")
            })
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetId: tweetId, success: {
            self.setReTweeted(true)
        }, failure: { (Error) in
            print("Retweet did not succed: \(Error)")
        })
    }
    
    func setFavorite(_ isFavorite:Bool) {
        favorite = isFavorite
        if (favorite){
            favorButtom.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        } else{
            favorButtom.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setReTweeted(_ isReTweeted:Bool) {
        if (reTweeted){
            reTweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            reTweetButton.isEnabled = false
        } else{
            reTweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            reTweetButton.isEnabled = true
        }
    }
    
     
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
