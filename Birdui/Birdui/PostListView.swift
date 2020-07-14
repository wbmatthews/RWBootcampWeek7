//
//  PostListView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostListView: View {
  
  @ObservedObject var postViewModel: PostViewModel
  @State var showingNewPostView = false
  @State var isLikedPostsOnly = false
  
  var body: some View {
    VStack(alignment: .leading) {
      
      VStack(alignment: .leading) {
        TitleBarView()
        
        Button("Create New Post") {
          self.showingNewPostView.toggle()
        }
        .sheet(isPresented: $showingNewPostView) {
          NewPostView(postHandler: self.postViewModel)
        }
        
        Toggle(isOn: $isLikedPostsOnly) {
          Text("Liked Posts Only")
        }
        
        Divider()
      }
      .padding(.horizontal, 12)
      
      List {
        
        ForEach(postViewModel.posts.indices, id:\.self) { postIndex in
          Group {
            if !self.isLikedPostsOnly || self.postViewModel.posts[postIndex].isLiked {
              PostView(post: self.$postViewModel.posts[postIndex])
            }
          }
        }
      }
    }
  }
}

struct TitleBarView: View {
  var body: some View {
    ZStack(alignment: .center) {
      HStack {
        LogoView()
        Spacer()
      }
      Text("Home")
        .font(.largeTitle)
    }
  }
}

struct PostListView_Previews: PreviewProvider {
  static var previews: some View {
    PostListView(postViewModel: PostViewModel.demoPosts)
  }
}
