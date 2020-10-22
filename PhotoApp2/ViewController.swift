//
//  ViewController.swift
//  PhotoApp2
//
//  Created by 家城苑佳 on 2020/10/21.
//  Copyright © 2020 sonoka.yashiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let img : [UIImage] = [UIImage(named: "IMG_7715.jpeg")!, UIImage(named:"IMG_7716.jpeg")!, UIImage(named:"IMG_7718.jpeg")!]
    var X : Int = 0
    var timer: Timer!
    
    @IBOutlet weak var imageboard: UIImageView!

    //画像をタップしたときの処理
    @IBAction func tap(_ sender: Any) {
        performSegue(withIdentifier: "enlargedimage", sender: nil)
    }
    //画像をタップしてデータを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultviewcontroller : ResultViewController = segue.destination as! ResultViewController
        
        // 遷移先のResultViewControllerで宣言しているXに値を代入
        resultviewcontroller.X = X
    }
    
    //backボタンを押したときの処理
    @IBOutlet weak var backbutton: UIButton!
    @IBAction func back(_ sender: Any) {
        X -= 1
        if X == -1{
            X = 2
        }
        imageboard.image = img[X]
    }

    //nextボタンを押したときの処理
    @IBOutlet weak var nextbutton: UIButton!
    @IBAction func next(_ sender: Any) {
        X += 1
        if X == 3{
         X = 0
        }
        imageboard.image = img[X]
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
        X += 1
        if X == 3{
            X = 0
        }
        imageboard.image = img[X]
    }
    
    // 他の画面から segue を使って戻ってきた時に呼ばれる
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   

}

