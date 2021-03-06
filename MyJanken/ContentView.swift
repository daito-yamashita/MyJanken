//
//  ContentView.swift
//  MyJanken
//
//  Created by daito yamashita on 2021/03/15.
//

import SwiftUI

struct ContentView: View {
    
    @State var answerNumber = 0
    
    var body: some View {
        
        VStack {
            
            // スペースを追加
            Spacer()
            
            // じゃんけんの数字が0だったら
            if answerNumber == 0 {
                // 初期画面のテキスト表示
                Text("これからじゃんけんをします")
                
                    // 可変に余白を設定
                    .padding(.bottom)
            } else if answerNumber == 1 {
                // じゃんけんの数字が１だったら、グー画像を指定
                Image("gu")
                    // リサイズを指定
                    .resizable()
                    //画面内に収まるように、アスペクト比（縦横比）を維持する指定
                    .aspectRatio(contentMode: .fit)
                
                // スペースを追加
                Spacer()
                
                //ジャンケンの種類を指定
                Text("グー")
                    // 可変に余白を設定
                    .padding(.bottom)
            } else if answerNumber == 2 {
                // じゃんけんの数字が２だったら、チョキ画像を指定
                Image("choki")
                    // リサイズを指定
                    .resizable()
                    //画面内に収まるように、アスペクト比（縦横比）を維持する指定
                    .aspectRatio(contentMode: .fit)
                
                // スペースを追加
                Spacer()
                
                //ジャンケンの種類を指定
                Text("チョキ")
                    // 可変に余白を設定
                    .padding(.bottom)
            } else {
                // じゃんけんの数字が３だったら、パー画像を指定
                Image("pa")
                    // リサイズを指定
                    .resizable()
                    //画面内に収まるように、アスペクト比（縦横比）を維持する指定
                    .aspectRatio(contentMode: .fit)
                
                // スペースを追加
                Spacer()
                
                //ジャンケンの種類を指定
                Text("パー")
                    // 可変に余白を設定
                    .padding(.bottom)
            }
            
            Button(action: {
                // 新しいじゃんけんの結果を一時的に格納する変数を設ける
                var newAnswerNunmer = 0
                
                // ランダムに結果を出すが、前回の結果と異なる場合のみ採用
                // repeatは繰り返しを意味する
                repeat {
                    // １、２、３の変数をランダムに算出（乱数）
                    newAnswerNunmer = Int.random(in: 1...3)
                    
                    // 前回と同じ結果のときは、再度ランダムに数値を出す
                    // 異なる結果のときは、repeatを抜ける
                } while answerNumber == newAnswerNunmer
                
                // 新しいじゃんけんの結果を格納
                answerNumber = newAnswerNunmer
            }) {
                // Buttonに表示する文字を指定
                Text("じゃんけんをする！")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
