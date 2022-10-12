//
//  FirstViewControllerRoutable.swift
//  VideoRecorder
//
//  Created by pablo.jee on 2022/10/13.
//

import Foundation
import UIKit

protocol FirstViewControllerRoutable: Routable, FirstViewControllerSceneBuildable {
    
}

extension FirstViewControllerRoutable where Self: FirstViewController {
    func route(to Scene: SceneCategory) {
        switch Scene {
        case .main(let mainScene):
            break
        case .detail(let detailScene):
            break
        case .close:
            break
        case .closeWithAction(_):
            break
        case .alert:
            let nextScene = buildScene(scene: Scene)
            guard let nextVC = nextScene as? UIViewController else { return }
            self.present(nextVC, animated: true)
        }
    }
}

protocol FirstViewControllerSceneBuildable: SceneBuildable { }

extension FirstViewControllerSceneBuildable {
    
    // TODO: 2,3번째 뷰컨트롤러 빌드
    func buildSecondScene() {
        
    }
    
    func buildAlert(context: AlertDependency) -> Scenable {
        let nextScene: Scenable
        
        let alert = AlertFactory(dependency: context).createAlert()
        nextScene = alert
        return nextScene
    }
}

extension FirstViewControllerSceneBuildable {
    func buildScene(scene: SceneCategory) -> Scenable? {
        var nextScene: Scenable?
        switch scene {
        case .main(.firstViewController(let context)):
             break
        case .detail:
            break
        case .close:
            break
        case .closeWithAction(_):
            break
        case .alert(let context):
           nextScene = buildAlert(context: context)
        }
        
        return nextScene
    }
}
