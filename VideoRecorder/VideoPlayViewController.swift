//
//  VideoPlayViewController.swift
//  VideoRecorder
//
//  Created by 1 on 2022/10/11.
//

import UIKit
import AVKit
import AVFoundation


class VideoPlayViewController: UIViewController, AVPlayerViewControllerDelegate {

    var playerLayer = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
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
