//
//  ContentView.swift yang di rename jadi videolistview
//  Shared
//
//  Created by Luthfi Khan on 16/05/22.
//  Dynamic Data

import SwiftUI

struct VideoListView: View {
    
    //Dibikin array soalnya videonya banya
    var videos: [Video] = VideoList.topTen
    var body: some View {
        NavigationView{
            List(videos, id: \.id){ video in
                //buat ngelink listnya masuk ke detail view
                NavigationLink(destination: VideoDetailView(video: video)
                               ,label: {
                    VideoCell(video: video)
                })
            }
            .navigationTitle("Top 10 Videos")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

struct VideoCell: View {
    var video: Video
    var body: some View {
        
        HStack{
            //Thumbnail
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 70)
                .cornerRadius(4)
                .padding(.vertical, 5)
            
            VStack(alignment: .leading, spacing: 5){
                //Title
                Text(video.title)
                    .fontWeight(.medium)
                //Buat ngelimit line yang tertulis
                    .lineLimit(2)
                //Buat ngecilin text kalo kepanjangan kalo 1 g bakal kecil sendiri
                    .minimumScaleFactor(0.5)
                
                //Waktu Upload
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
