
/*
 This is where you will be getting your data from a different source.
 */

import UIKit

class Data {
    
    static func getData(completion: @escaping ([Model]) -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            var data = [Model]()
            var image = UIImage(named: "sun")
            data.append(Model(title: "28°C", subTitle: "Wed-19/07/2017", image:image, data1: "Sunny day", data2: "Let go out and enjoy the sunshine"))
            image = UIImage(named: "storm")
            data.append(Model(title: "24°C", subTitle: "Thu-20/07/2017", image:image, data1: "ThunderStorm", data2: "Take carefully when go out"))
            image = UIImage(named: "rain")
            data.append(Model(title: "19°C", subTitle: "Fri-21/07/2017", image:image, data1: "Rainy day", data2: "Don't forget to bring an umbrella"))
            DispatchQueue.main.async {
                completion(data)
            }
        }
    }
}
