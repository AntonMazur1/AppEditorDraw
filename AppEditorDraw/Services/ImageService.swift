//
//  ImageService.swift
//  AppEditorDraw
//
//  Created by Клоун on 10.10.2022.
//

import Photos

class ImageService {
    static func getPhotosFromLibrary(completion: @escaping([Data]) -> Void) {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                completion(convertPhotos())
            }
        }
    }
    
    static private func convertPhotos() -> [Data] {
        let assets = PHAsset.fetchAssets(with: .image, options: nil)
        var imageData = [Data]()
        assets.enumerateObjects { (object, _, _) in
            let asset = object
            let manager = PHImageManager.default()
            manager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: nil) { image, _ in
                imageData.append(image?.pngData() ?? Data())
            }
        }
        return imageData
    }
}
