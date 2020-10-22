//
//  ResultViewController.swift
//  PhotoApp2
//
//  Created by 家城苑佳 on 2020/10/21.
//  Copyright © 2020 sonoka.yashiro. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultimageboard: UIImageView!
    
    let img : [UIImage] = [UIImage(named: "IMG_7715.jpeg")!, UIImage(named:"IMG_7716.jpeg")!, UIImage(named:"IMG_7718.jpeg")!]
    var X : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultimageboard.image = img[X]

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
