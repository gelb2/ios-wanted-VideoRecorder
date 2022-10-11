//
//  VideoPlayViewController.swift
//  VideoRecorder
//
//  Created by 1 on 2022/10/11.
//

import UIKit
import AVKit
import AVFoundation
import Photos


class VideoPlayViewController: UIViewController, AVPlayerViewControllerDelegate {
    
    var playerLayer = AVPlayerViewController()
//    var allPhotos: PHFetchResult<PHAsset>?
    
    lazy var rightNavButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "⌾", style: .plain, target: self, action: #selector(add))
        return button
    }()
    lazy var leftNavButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "〈", style: .plain, target: self, action: #selector(back))
        return button
    }()
    @objc func add(_ sender: Any) {
    }
    @objc func back(_ sender: Any) {
        //        let firstView = firstViewController() // 첫번째 화면 푸시
        //        self.navigationController?.pushViewController(firstView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.rightBarButtonItem = self.rightNavButton
        self.navigationItem.leftBarButtonItem = self.leftNavButton
        title = "네비바 제목"
        playVideo()
//        self.allPhotos = PHAsset.fetchAssets(with: nil)
        
//        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Sim", ofType: "mp4")!))
//
//        let vc = AVPlayerViewController()
//        vc.player = player
//        present(vc, animated: true)
    }
    
    func playVideo() {
        guard let videoURl = URL(string:  "https://wolverine.raywenderlich.com/content/ios/tutorials/video_streaming/foxVillage.mp4") else { return }
        let player = AVPlayer(url: videoURl)
        playerLayer = AVPlayerViewController()
        playerLayer.player = player
        playerLayer.allowsPictureInPicturePlayback = true
        playerLayer.delegate = self
        playerLayer.player?.play()

        self.present(playerLayer, animated: true, completion: nil)
    }

    
}






