//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Ooi Kok Sing on 1/8/20.
//  Copyright © 2020 ECM. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        // Ensure that we have a video
        guard self.video != nil else {
            
            return
        }
        
        // Set the title
        self.titleLabel.text = video?.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        // Set the thumbnail
        guard self.video?.thumbnail != "" else {
            
            return
        }
        
        //Check cache before downloading the data
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            //Set the thumbnial imageview
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        // Download the thumbnial data
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL Session object
        let session = URLSession.shared
        
        //Create a data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                //Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data: data)
                
                //Check that the downloaded url matches the video thumbnial url that this cell is currently set to display
                if url?.absoluteString != self.video?.thumbnail {
                    
                    // Video cell has been recycled for antoher video and no longer matches the thumbnial that was downloaded
                    return
                    
                }
                //Create the image object
                let image = UIImage(data: data!)
                
                //Set the imageview
                DispatchQueue.main.async {
                    
                    self.thumbnailImageView.image = image
                    
                }
            }
        }
        
        //Start data task
        dataTask.resume()
    }

}
