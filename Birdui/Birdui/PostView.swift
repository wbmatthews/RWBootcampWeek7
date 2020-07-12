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
  let maxSize: CGFloat = 200
  
  var body: some View {
    ZStack {
      if verticalSizeClass == .compact {
        HStack(alignment: .top) {
          TextPostView(post: post)
          Spacer()
          if post.uiImage != nil {
            PostImageView(image: post.uiImage!, width: maxSize, height: maxSize)
          }
        }
      } else {
        VStack(alignment: .leading) {
          TextPostView(post: post)
          if post.uiImage != nil {
            PostImageView(image: post.uiImage!, width: .infinity, height: maxSize)
          }
        }
      }
      
    }
  }
}

struct LogoView: View {
  
  var body: some View {
    Image("mascot_swift-badge")
      .resizable()
      .frame(width: 45, height: 45, alignment: .center)
  }
}

struct HeaderView: View {
  
  let post: MediaPost
  
  var body: some View {
    HStack(alignment: .top) {
      LogoView()
      VStack(alignment: .leading) {
        Text(post.userName)
          .bold()
        Text("\(post.timestamp, formatter: PostViewModel.dateFormatter)")
          .foregroundColor(.secondary)
      }
    }
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

struct PostImageView: View {
  
  var image: UIImage
  var width: CGFloat?
  var height: CGFloat?
  
  var body: some View {
    Image(uiImage: image)
      .resizable()
      .scaledToFit()
      .frame(maxWidth: width, maxHeight: height)
  }
}


struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostView(post: MediaPost(textBody: "Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]Went to the Aquarium today :]",
      userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
      uiImage: UIImage(named: "octopus")))
  }
}
