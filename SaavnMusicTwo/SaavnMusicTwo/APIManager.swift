import Foundation

struct APIManager {
    static func fetchTrending(completion: @escaping ([TrendingItem]) -> Void) {
        guard let url = URL(string: "https://www.saavn.com/api.php?app_version=9.14.0&v=1006&device_type=iPhone_Simulator&_marker=false&_format=json&ctx=iphoneapp&api_version=4&dolby_support=false&is_jio_user=false&r_device=false&network_type=WIFI&network_subtype=wifi&cc=91&__call=content.getTrending&n=24&type=more&p=1&tz=Asia/Kolkata") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode([TrendingItem].self, from: data)
                    completion(response)
                } catch {
                    print("Decoding Error: \(error)")
                }
            } else if let error = error {
                print("Network Error: \(error)")
            }
        }.resume()
    }
}

