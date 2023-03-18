//
//  AsyncLearning.swift
//  sample
//
//  Created by Kesavan Panchabakesan on 17/03/23.
//

import SwiftUI
class AsyncLearningImageLoader {
    let url = URL(string: "https://picsum.photos/200")!
    func handleResponse(data: Data?, response: URLResponse?) -> UIImage? {
        guard let data = data,
              let image = UIImage(data: data),
              let response = response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            return nil
        }
        return image
    }
    
    func downloadWithAsync() async throws -> UIImage? {
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            return handleResponse(data: data, response: response)
        } catch let error {
            throw error
        }
    }
}



class AsyncLearningViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let loader = AsyncLearningImageLoader()
    
    init(){
        Task{
            await fetchImage()
        }
    }
    
    func fetchImage() async {
        self.image = try? await loader.downloadWithAsync()
    }
}

struct AsyncLearning: View {
    @StateObject var viewModel = AsyncLearningViewModel()
    var body: some View {
        ZStack{
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
            
        }
    }
}

struct AsyncLearning_Previews: PreviewProvider {
    static var previews: some View {
        AsyncLearning()
    }
}
