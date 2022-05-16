//
//  VideoDetailView.swift
//  ListTest
//
//  Created by Luthfi Khan on 16/05/22.
//

import SwiftUI

struct VideoDetailView: View {
    //OOP di swift kek gini buat reference data dati video
    var video: Video
    var body: some View {
        VStack(spacing: 20){
            
            Spacer()
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .cornerRadius(12)
            
            Text(video.title)
                .font(.title2)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing: 40){
                //kalo pake sistem image harus pake yang di sf symbol
                //buat ngeparse data pake "\(text)"
                Label("\(video.viewCount)", systemImage: "eye.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Text(video.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            //Buat bikin link yang bisa di pencet ke video
            Link(destination: video.url, label: {
                UrlButton(title: "Watch Now")
            })
            
        }
    }
}

struct VideoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //Buat ngambil data dari video
        //harus pake (!) biar bisa di unwrap
        VideoDetailView(video: VideoList.topTen.first!)
    }
}

struct UrlButton: View {
    var title: String
    var body: some View {
        Text(title)
            .bold()
            .font(.title2)
            .frame(width: 280, height: 50)
            .background(Color(.systemRed))
            .foregroundColor(.white)
            .cornerRadius(15
            )
    }
}
