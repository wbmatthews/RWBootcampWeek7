//
//  PostView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostView: View {
  let post: MediaPost
  @Environment(\.verticalSizeClass) var verticalSizeClass
  
  var body: some View {
    ZStack {
      if verticalSizeClass == .compact {
        HStack(alignment: .top) {
          TextPostView(post: post)
          if post.uiImage != nil {
            Image(uiImage: post.uiImage!)
              .resizable()
              .scaledToFit()
              .frame(maxWidth: .infinity, maxHeight: 200, alignment: .center)
          }
        }
      } else {
        VStack(alignment: .leading) {
          TextPostView(post: post)
          if post.uiImage != nil {
            Image(uiImage: post.uiImage!)
              .resizable()
              .scaledToFit()
              .frame(maxWidth: .infinity, maxHeight: 200, alignment: .center)
          }
        }
      }
      
    }
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostView(post: MediaPost(textBody: "Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]",
      userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
      uiImage: UIImage(named: "octopus")))
  }
}

struct HeaderView: View {
  var post: MediaPost
  
  var body: some View {
    HStack {
      LogoView()
      VStack(alignment: .leading) {
        Text(post.userName)
          .bold()
        Text("TimeStamp")
          .foregroundColor(.secondary)
      }
    }
  }
}

struct LogoView: View {
  
  var body: some View {
    Image("mascot_swift-badge")
      .resizable()
      .scaledToFit()
      .frame(width: 40, height: 40, alignment: .center)
  }
}

struct TextPostView: View {
  
  var post: MediaPost
  
  var body: some View {
    VStack(alignment: .leading) {
      HeaderView(post: post)
      Text(post.textBody!).lineLimit(nil)
    }
  }
}
