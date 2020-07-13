//
//  PostListView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostListView: View {
  
  var postViewModel: PostViewModel
  
  var body: some View {
    VStack {
      ZStack {
        HStack {
          LogoView()
            .padding(.horizontal, 10)
          Spacer()
        }
        Text("Home")
          .font(.largeTitle)
        
      }
      List(postViewModel.posts) { post in
        PostView(post: post)
      }
    }
  }
}

struct PostListView_Previews: PreviewProvider {
  static var previews: some View {
    PostListView(postViewModel: PostViewModel.demoPosts)
  }
}
