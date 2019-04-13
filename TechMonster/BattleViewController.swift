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
        
        //太く拡大
        enemyHPBar.transform = CGAffineTransform(scaleX: 1.0, y: 4.0)
        playerHPBar.transform = CGAffineTransform(scaleX: 1.0, y: 4.0)
        
        //プレイやーでーたせっと
        playerNameLabel.text = player.name
        playerImageView.image = player.image
        playerHPBar.progress = player.currentHP / player.maxHP

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startButtle()
    }
    
    func startButtle() {
        TechDraUtil.playBGM(fileName: "BGM_battle001")
        
        enemy = Enemy()
        
        //敵のデータセット
        enemyNameLabel.text = enemy.name
        enemyImageView.image = enemy.image
        enemyHPBar.progress = enemy.currentHP / enemy.maxHP
        //攻撃ボタン
        attackButton.isHidden = false
        
    }
    //攻撃ボタン
    @IBAction func playerAttack() {
        TechDraUtil.animateDamage(enemyImageView)
        TechDraUtil.playSE(fileName: "SE_attack")
        
        enemy.currentHP = enemy.currentHP - player.attackPower
        enemyHPBar.setProgress(enemy.currentHP / enemy.maxHP, animated: true)
        
        if enemy.currentHP <= 0 {
            TechDraUtil.animateVanish(enemyImageView)
            finichBattle(winPlayer: true)
        }
    }
    //バトル終了
    func finichBattle(winPlayer: Bool) {
        TechDraUtil.stopBGM()
        
        attackButton.isHidden = true //攻撃ボタン隠す
        
        let finishedMessage: String
        if winPlayer == true {
            TechDraUtil.playSE(fileName: "SE_fanfare")
            finishedMessage = "プレイヤーの勝利！"
        } else {
            TechDraUtil.playSE(fileName: "SE_gameover")
            finishedMessage = "プレイヤーの敗北..."
        }
        
        let alert = UIAlertController(title: "バトル終了！", message: finishedMessage, preferredStyle: UIAlertController.Style.alert)
        //OKけすとLobbyViewControllerに戻る
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in self.dismiss(animated: true, completion: nil)})
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    //敵を自動で攻撃
    @objc func enemyAttack() {
        TechDraUtil.animateDamage(playerImageView)
        TechDraUtil.playSE(fileName: "SE_attack")
        
        //HP更新
        player.currentHP = player.currentHP - player.attackPower
        playerHPBar.setProgress(player.currentHP / player.maxHP, animated: true)
        
        //プレイヤー負け
        if player.currentHP <= 0 {
            TechDraUtil.animateVanish(playerImageView)
            finichBattle(winPlayer: false)
        }
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
