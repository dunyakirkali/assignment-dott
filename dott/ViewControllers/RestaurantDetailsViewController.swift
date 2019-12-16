//
//  RestaurantDetailsViewController.swift
//  dott
//
//  Created by Dunya Kirkali on 16/12/2019.
//  Copyright © 2019 Dunya Kirkali. All rights reserved.
//

import Reusable
import ReSwift
import Kingfisher

import dottDataKit

class RestaurantDetailsViewController: UIViewController, StoryboardBased {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
}

// MARK: - View Lifecycle
extension RestaurantDetailsViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        mainStore.subscribe(self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        mainStore.unsubscribe(self)
    }
}

// MARK: - StoreSubscriber
extension RestaurantDetailsViewController: StoreSubscriber {
    func newState(state: AppState) {
        if let venue = state.venue {
            reloadData(for: venue)
        }
    }
}

private extension RestaurantDetailsViewController {
    func reloadData(for venue: FSVenue) {
        let url = URL(string: venue.imageURL)
        imageView.kf.setImage(with: url)
        nameLabel.text = venue.name
    }
}
