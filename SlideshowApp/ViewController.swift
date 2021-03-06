//
//  ViewController.swift
//  PhotoApp2
//
//  Created by 家城苑佳 on 2020/10/21.
//  Copyright © 2020 sonoka.yashiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let images : [UIImage] = [UIImage(named: "IMG_7715.jpeg")!, UIImage(named:"IMG_7716.jpeg")!, UIImage(named:"IMG_7718.jpeg")!]
    var index : Int = 0
    var timer: Timer!
    
    @IBOutlet weak var imageboard: UIImageView!

    //画像をタップしたときの処理
    @IBAction func tap(_ sender: Any) {
        performSegue(withIdentifier: "enlargedimage", sender: nil)
        if timer != nil{
            timer.invalidate()
            timer = nil
        }
        
    
    }
    //画像をタップしてデータを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultviewcontroller : ResultViewController = segue.destination as! ResultViewController
        
        // 遷移先のResultViewControllerで宣言しているXに値を代入
        resultviewcontroller.index = index
    }
    
    //backボタンを押したときの処理
    @IBOutlet weak var backbutton: UIButton!
    @IBAction func back(_ sender: Any) {
        index -= 1
        if index == -1{
            index = 2
        }
        imageboard.image = images[index]
    }

    //nextボタンを押したときの処理
    @IBOutlet weak var nextbutton: UIButton!
    @IBAction func next(_ sender: Any) {
        index += 1
        if index == 3{
         index = 0
        }
        imageboard.image = images[index]
    }
    
    //startstopボタンを押したときの処理
    @IBOutlet weak var startstopbutton: UIButton!
    @IBAction func startstop(_ sender: Any) {
        
        if (timer == nil){
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeimage), userInfo: nil, repeats: true)
            nextbutton.isEnabled = false
            backbutton.isEnabled = false
            startstopbutton.setTitle("停止", for: .normal)
        }else{
            timer.invalidate()
            timer = nil
            nextbutton.isEnabled = true
            backbutton.isEnabled = true
            startstopbutton.setTitle("再生", for: .normal)
        }
    }
    @objc func changeimage (){
        index += 1
        if index == 3{
            index = 0
        }
        imageboard.image = images[index]
    }
    
    // 他の画面から segue を使って戻ってきた時に呼ばれる
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        startstopbutton.setTitle("再生", for: .normal)
        nextbutton.isEnabled = true
        backbutton.isEnabled = true
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   

}

