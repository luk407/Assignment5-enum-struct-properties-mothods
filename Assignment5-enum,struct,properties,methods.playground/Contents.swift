// 1. შექმენით enum-ი სახელით DayOfWeek შესაბამისი ქეისებით. დაწერეთ function რომელიც იღებს ამ ენამის ტიპს. function-მა უნდა და-print-ოს, გადაწოდებული დღე კვირის დღეა თუ დასვენების
print("Task1:")
enum DayOfTheWeek {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

func dayChecker(dayInput: DayOfTheWeek) {
    switch dayInput {
    case .monday, .tuesday, .wednesday, .thursday, .friday:
        print("It's a weekday.")
    case .saturday, .sunday:
        print("It's a weekend.")
    }
}

dayChecker(dayInput: .monday)
print("")

// 2. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.
print("Task2:")
enum Weather {
    case sunny(celsius: Double)
    case cloudy(celsius: Double)
    case rainy(celsius: Double)
    case snowy(celsius: Double)
}

func recommendedOutfit(weatherType: Weather) {
    switch weatherType {
    case let .sunny(celsius: Double):
        if Double > 25 {
            print("It's hot, sunny weather. You can wear shirt and shorts.")
        } else {
            print("It's sunny, but cold weather. It's better to wear a sweater.")
        }
    case let .cloudy(celsius: Double):
        if Double > 20 {
            print("It's warm cloudy weather. It's better to wear a shirt and pants.")
        } else {
            print("It's cold cloudy weather. You should wear a jacket and pants.")
        }
    case let .rainy(celsius: Double):
        if Double > 10 {
            print("It's rainy weather. It's better to wear a hoodie.")
        } else {
            print("It's cold rainy weather. Please wear a warm jacket and pants. Oh and don't forget to take an umbrella.")
        }
    case let .snowy(celsius: Double):
        if Double > -5 {
            print("It's snowy weather. You should wear a coat, gloves and a scarf.")
        } else {
            print("It's freezing snowy weather. Wear as warm clothes as possible. Or just stay at home :)")
        }
    }
}

recommendedOutfit(weatherType: .sunny(celsius: 30))
recommendedOutfit(weatherType: .rainy(celsius: 20))
recommendedOutfit(weatherType: .snowy(celsius: 0))
print("")

// 3. შექმენით struct-ი Book, with properties როგორიცაა: title, author, publicationYear. ამის შემდეგ შექმენით array-ი Book-ის ტიპის, შექმენით რამოდენიმე Book-ის ობიექტი, და შეავსეთ array ამ წიგნებით. დაწერეთ function რომელიც მიიღებს ამ წიგნების array-ს და მიიღებს წელს. function-მა უნდა დაგვიბრუნოს ყველა წიგნი რომელიც გამოშვებულია ამ წლის შემდეგ. დავ-print-ოთ ეს წიგნები.
print("Task3:")
struct Book {
    var title: String
    var author: String
    var publicationYear: Int
}

var arrayOfBooks: [Book] = []

var book1 = Book(title: "Fire & Blood", author: "George R. R. Martin", publicationYear: 2018)
var book2 = Book(title: "The Hunger Games", author: "Suzanne Collins", publicationYear: 2008)
var book3 = Book(title: "The Fellowship of the Ring", author: "J. R. R. Tolkien", publicationYear: 1954)
var book4 = Book(title: "Dune", author: "Frank Herbert", publicationYear: 1965)
var book5 = Book(title: "The Eye of the World", author: "Robert Jordan", publicationYear: 1990)

arrayOfBooks.append(book1)
arrayOfBooks.append(book2)
arrayOfBooks.append(book3)
arrayOfBooks.append(book4)
arrayOfBooks.append(book5)

func booksReleasedSince(booksArray: [Book], releaseYear: Int) -> Array<Book> {
    return booksArray.filter { $0.publicationYear > releaseYear }
}

print("Book(s) released after specified year are: ")
for element in booksReleasedSince(booksArray: arrayOfBooks, releaseYear: 1985) {
    print(element.title, terminator: "; ")
}
print("\n")

// 4. შექმენით struct BankAccount, with properties როგორიცაა: holderName, accountNumber, balance. ამ ობიექტში დაამატეთ methods, დეპოზიტისა და გატანის (withdraw), დაწერეთ შესაბამისი ლოგიკა და ეცადეთ გაითვალისწინოთ სხვადასხვა ეჯ-ქეისები (edge case). მაგ. თანხის გატანისას თუ თანხა იმაზე ნაკლებია ვიდრე გვაქვს, თანხას ვერ გავიტანთ და ასე შემდეგ. print-ის მეშვეობით გამოვიტანოთ შესაბამისი შეცდომები . ამის შემდეგ შექმენით BankAccount ობიექტი და გააკეთეთ ტრანზაქციების იმიტაცია თქვენს მიერ დაწერილი მეთოდებით.
print("Task4:")
struct BankAccount {
    var holderName: String
    var accountNumber: String
    var balance: Double
    
    mutating func depositMoney(moneyToDeposit: Double) {
        if moneyToDeposit < 0 {
            print("The amount of money you want to deposit can not be a negative number.")
        } else {
            balance += moneyToDeposit
            print("\(moneyToDeposit) GEL has been added to your balance. Your balance is: \(balance) GEL.")
        }
    }
    
    mutating func withdrawMoney(moneyToWithdraw: Double) {
        if moneyToWithdraw > balance {
            print("Your balance is less than \(moneyToWithdraw). Unfortunately, you can not withdraw money.")
        } else if moneyToWithdraw <= balance && moneyToWithdraw < 0 {
            print("The amount of money you want to withdraw can not be a negative number.")
        } else {
            balance -= moneyToWithdraw
            print("\(moneyToWithdraw) GEL has been withdrawn from your balance. Your balance is \(balance)")
        }
    }
}

var newAccount = BankAccount(holderName: "Luka Gazdeliani", accountNumber: "437509743857", balance: 543.12)

newAccount.withdrawMoney(moneyToWithdraw: 300.00)
newAccount.withdrawMoney(moneyToWithdraw: 400.00)
newAccount.depositMoney(moneyToDeposit: -300.00)
newAccount.withdrawMoney(moneyToWithdraw: -200.00)
newAccount.depositMoney(moneyToDeposit: 500.00)
newAccount.withdrawMoney(moneyToWithdraw: 700.00)
newAccount.withdrawMoney(moneyToWithdraw: 200.00)

print("")

// 5. შექმენით enum-ი Genre მუსიკის ჟანრის ქეისებით. ამის შემდეგ შექმენით struct Song, with properties: title, artist, duration, genre, description (computied propertie უნდა იყოს description) და publisher (lazy propertie-ად შექმენით publisher). შემდეგ შექმენით თქვენი playlist array რომელსაც Song-ებით შეავსებთ (ზოგ song-ს ჰქონდეს publisher, ზოგს არა). შექმენით function რომელსაც გადააწვდით თქვენს playlist-ს და ჟანრს, function-ს დააბრუნებინეთ მხოლოდ იმ Song-ების array, რომელიც ამ ჟანრის იქნება და შემდეგ დაა-print-ინეთ ეს Song-ები.
print("Task5:")
enum MusicGenre: String {
    case grunge = "Grunge"
    case postGrunge = "Post-grunge"
    case metalcore = "Metalcore"
    case progressiveMetal = "Progressive Metal"
    case alternativeMetal = "Alternative Metal"
    case heavyMetal = "Heavy Metal"
    case nuMetal = "Nu-Metal"
    case alternativeRock = "Alternative Rock"
    case hardRock = "Hard Rock"
}

struct Song {
    var title: String
    var artist: String
    var duration: String
    var genre: MusicGenre
    lazy var publisher = ""
    
    var description: String {
        return "\(title) is a \(genre.rawValue) song, written by \(artist). The song's duration is: \(duration)." //აქ ვერანაირად ვერ დავ-print-ე publisher. თუ უბრალოდ var ცვლადია პრინტავს, მაგრამ lazy-სთან ერთად არა.
    }
}

var playlistArray: [Song] = [
    Song(title: "Cosmic", artist: "Avenged Sevenfold", duration: "7:31", genre: .progressiveMetal),
    Song(title: "The Stage", artist: "Avenged Sevenfold", duration: "8:32", genre: .progressiveMetal),
    Song(title: "Change (In the House of Flies)", artist: "Deftones", duration: "4:59", genre: .alternativeMetal),
    Song(title: "Digital Bath", artist: "Deftones", duration: "4:15", genre: .nuMetal, publisher: "Maverick Records"),
    Song(title: "Leave Out All The Rest", artist: "Linkin Park", duration: "3:29", genre: .alternativeRock),
    Song(title: "Given Up", artist: "Linkin Park", duration: "3:29", genre: .nuMetal, publisher: "Warner Bros"),
    Song(title: "Snuff", artist: "Slipknot", duration: "4:36", genre: .alternativeRock),
    Song(title: "Phychosocial", artist: "Slipknot", duration: "4:44", genre: .nuMetal, publisher: "Roadrunner"),
    Song(title: "Dreamer", artist: "Ozzy Osbourne", duration: "4:45", genre: .hardRock),
    Song(title: "Crazy Train", artist: "Ozzy Osbourne", duration: "4:52", genre: .heavyMetal, publisher: "Jet Records"),
    Song(title: "Go to Hell, for Heaven's Sake", artist: "Bring Me The Horizon", duration: "4:02", genre: .metalcore, publisher: "Epitaph Records"),
    Song(title: "Hospital for Souls", artist: "Bring Me The Horizon", duration: "6:44", genre: .metalcore),
    Song(title: "Everlong", artist: "Foo Fighters", duration: "4:49", genre: .postGrunge, publisher: "Roswell Records"),
    Song(title: "The Sky Is a Neighborhood", artist: "Foo Fighters", duration: "4:04", genre: .alternativeRock),
    Song(title: "Jeremy", artist: "Pearl Jam", duration: "5:12", genre: .grunge),
    Song(title: "Even Flow", artist: "Pearl Jam", duration: "4:54", genre: .grunge),
    Song(title: "Nihilist", artist: "Architects", duration: "2:51", genre: .metalcore),
    Song(title: "Dying Is Absolutely Safe", artist: "Architects", duration: "4:38", genre: .alternativeRock)
] //მითითებული არ იყო რომ უნდა შეგვექმნა სიმღერები როგორც ობიექტები და ცალცალკე დაგვემატებინა ამ Array-ში (როგორც მე3 task-ში). ამიტომ პირდაპირ array-ში დავამატე :)

func findSongsByGenre(playlist: Array<Song>, selectedGenre: MusicGenre) -> Array<Song> {
    return playlist.filter { $0.genre == selectedGenre }
}

print("Here is a list of songs from selected genre(s): ")
print("\n")
for element in findSongsByGenre(playlist: playlistArray, selectedGenre: .alternativeRock) {
    print(element.description, terminator: "\n")
}

print("\n")
for element in findSongsByGenre(playlist: playlistArray, selectedGenre: .metalcore) {
    print(element.description, terminator: "\n")
}

print("\n")
for element in findSongsByGenre(playlist: playlistArray, selectedGenre: .hardRock) {
    print(element.description, terminator: "\n")
}
