//
//  PostData.swift
//  Instagram_1
//
//  Created by 木村太郎 on 2020/09/07.
//  Copyright © 2020 taro.kimura. All rights reserved.
//

import UIKit
import Firebase

class PostData: NSObject {
    var id: String
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    var isComment: Bool = false
    var comment: [String] = []
    
    
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let postDic = document.data()

        self.name = postDic["name"] as? String

        self.caption = postDic["caption"] as? String
        
        if let comments = postDic["comment"] as? [String] {
            self.comment = comments
        }

        let timestamp = postDic["date"] as? Timestamp
        self.date = timestamp?.dateValue()

        if let likes = postDic["likes"] as? [String] {
            self.likes = likes
        }
        if let myid = Auth.auth().currentUser?.uid {
            // likesの配列の中にmyidが含まれているかチェックすることで、自分がいいねを押しているかを判断
            if self.likes.firstIndex(of: myid) != nil {
                // myidがあれば、いいねを押していると認識する。
                self.isLiked = true
            }
            // commentの配列の中にmyidが含まれているかチェックすることで、自分がコメントを押しているかを判断
            if self.comment.firstIndex(of: myid) != nil {
                // myidがあれば、いいねを押していると認識する。
                self.isComment = true
                
                
        
        }
    }
}
}
