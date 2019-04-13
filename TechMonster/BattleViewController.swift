//
//  BattleViewController.swift
//  TechMonster
//
//  Created by Rika Sumitomo on 2019/04/13.
//  Copyright © 2019 Rika Sumitomo. All rights reserved.
//

import UIKit

class BattleViewController: UIViewController {

    var enemy: Enemy!
    var player: Player!
    
    @IBOutlet weak var backGroundImageView: UIImageView!
    @IBOutlet weak var attackButton: UIButton!
    
    @IBOutlet weak var enemyImageView: UIImageView!
    @IBOutlet weak var playerImageView: UIImageView!
    
    @IBOutlet weak var enemyHPBar: UIProgressView!
    @IBOutlet weak var playerHPBar: UIProgressView!
    
    @IBOutlet weak var enemyNameLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
