//
//  Spottunes
//
//  Created by Xie kesong on 4/15/17.
//  Copyright © 2017 ___Spottunes___. All rights reserved.
//

import Foundation
import Parse


//the value is the same as the actual key for Spotify
fileprivate let IdKey = "id"
fileprivate let ImagesKey = "images"
fileprivate let NameKey = "name"
fileprivate let OwnerKey = "owner"
fileprivate let TracksKey = "tracks"

class Playlist: PFObject {
    
    var owner: User?
    
    var spot: Spot?
    
    var spotifyId: String!{
        return self.dict[IdKey] as! String
    }
    
    private var images: [Image]?{
        guard let imagesDict = self.dict[ImagesKey] as? [[String: Any]] else{
            return nil
        }
        let images = imagesDict.map { (imageDict) -> Image in
            return Image(dict: imageDict)
        }
        return images
    }
    
    var name: String?{
        return self.dict[NameKey] as? String
    }
    
    var tracks: Tracks?{
        guard let tracksDict = self.dict[TracksKey] as? [String: Any] else{
            return nil
        }
        return Tracks(dict: tracksDict)
    }
    
    //the spotify representation
    var dict: [String: Any]!
    
    init(dict: [String: Any]) {
        super.init()
        self.dict = dict
    }
    
    func savePlaylist(){
        if let id = self.spotifyId{
            self[IdKey] = id
            self.saveInBackground { (succeed, error) in
                print("saved \(succeed)")
            }
        }else{
            print("id is nil")
        }
    }
    
    func getCoverImage(withSize size: CoverSize) -> Image?{
        if let coverImage = self.images?[size.hashValue] {
            return coverImage
        }else{
            return self.images?.first
        }
    }
    
    
}

    
extension Playlist: PFSubclassing {
    static func parseClassName() -> String {
        return "Playlist"
    }
}
