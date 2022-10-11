//
//  ImageService.swift
//  AppEditorDraw
//
//  Created by Клоун on 10.10.2022.
//

import Photos

class ImageService {
    static let shared = ImageService()
    
    private init() {}
    
    func requestPermissionAndConvertPhoto(completion: @escaping([Data]) -> Void) {
        PHPhotoLibrary.requestAuthorization { [unowned self] status in
            if status == .authorized {
                completion(getPhotosFromLibrary())
            }
        }
    }
    
    private func getPhotosFromLibrary() -> [Data] {
        let assets = PHAsset.fetchAssets(with: .image, options: nil)
        let imageData = convertPhotos(from: assets)
        return imageData
    }
    
    private func convertPhotos(from assets: PHFetchResult<PHAsset>) -> [Data] {
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
