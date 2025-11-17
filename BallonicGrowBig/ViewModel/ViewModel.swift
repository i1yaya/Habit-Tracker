import SwiftUI
import Combine

class ViewModel: ObservableObject {
    let habitTasks: [[String]] = [
        ["Meditate together online",
         "Take a calm walk and chat",
         "Read aloud together for relaxation",
         "Call a friend for support and calm",
         "Do breathing exercises together"],
        
        ["Work on a task together with a colleague",
         "Ask someone to review your work for better focus",
         "Organize a joint study session",
         "Discuss project plans and concentrate on tasks",
         "Keep a shared progress journal"],
        
        ["Write a letter to a friend with an inspiring quote",
         "Have a joint brainstorming session",
         "Share an interesting idea on social media",
         "Organize a small meetup to exchange experiences",
         "Create something artistic together with a friend"],
        
        ["Do a dynamic warm-up followed by breathing exercises",
         "Alternate active and calm work blocks",
         "Take a walk with varying pace",
         "Practice yoga with gentle energetic movements",
         "Do meditative dance or stretching"],
        
        ["Do a quick warm-up before starting work",
         "Use Pomodoro technique with energetic breaks",
         "Do brain-activating exercises before focus",
         "Take short physical breaks between work blocks",
         "Listen to rhythmic music for productivity"],
        
        ["Start the day with an energetic creative exercise",
         "Move to music to boost inspiration",
         "Do a workout with visualization",
         "Perform active exercises to energize the brain",
         "Make a list of ideas for an energetic day"],
        
        ["Tidy up your workspace",
         "Make a calm plan for the day",
         "Sort items into categories for peace of mind",
         "Organize your to-do list without rush",
         "Create a cozy environment for work and rest"],
        
        ["Create a precise work plan",
         "Break a project into smaller steps",
         "Organize your workspace for concentration",
         "Make a daily checklist",
         "Use a timer for structured work"],
        
        ["Make a beautiful and structured daily plan",
         "Organize an inspiring workspace",
         "Create a systematic collection of ideas",
         "Sort inspiration sources by topic",
         "Develop a checklist of creative actions"]
    ]

    let habitExplanations: [[String]] = [
        ["Meditating together not only deepens your sense of connection but also creates a shared moment of calm presence and understanding, helping both people slow down and reset emotionally.",
         "Calm walks with someone you care about strengthen relationships through quiet companionship and gentle movement, giving space for reflection and natural conversation.",
         "Reading aloud with a friend or partner transforms simple time together into a comforting ritual that builds emotional warmth and shared focus.",
         "Supportive calls can reduce stress by reminding you that you’re not alone — even a short conversation can shift your emotional balance toward peace and safety.",
         "Doing simple breathing exercises together can ground both people, calm the mind, and silently reinforce the feeling of trust and mutual understanding."],
        
        ["Working together improves concentration because shared focus naturally increases accountability and motivation — two minds anchored to one goal stay more present and productive.",
         "Having someone review your work encourages sharper focus and attention to detail, while also building a supportive feedback loop that enhances learning.",
         "Joint study sessions not only boost productivity but also transform a solitary task into a shared effort where you inspire and remind each other to stay on track.",
         "Discussing goals with another person helps organize your thoughts, clarify priorities, and maintain steady concentration through shared understanding.",
         "Keeping a shared progress journal reinforces accountability, encourages self-reflection, and helps both people celebrate milestones as a team."],
        
        ["Strengthening relationships through mutual motivation allows you to see yourself and your goals through another’s eyes, creating a sense of purpose and emotional support.",
         "Joint discussions of ideas spark creativity by combining perspectives, encouraging spontaneous thinking, and helping you refine concepts you might overlook alone.",
         "Sharing your ideas with others broadens your world — new insights, feedback, and reactions often transform your initial thoughts into something stronger.",
         "Casual meetups and idea exchanges create energy and inspiration, while offering a chance to build trust and genuine connection through shared curiosity.",
         "Collaborative creative activities unite people — when you make something together, you strengthen your emotional bond while learning from each other."],
        
        ["Combining movement with breathing creates balance between body and mind, releasing tension and fostering awareness of physical and emotional flow.",
         "Alternating between activity and rest keeps your inner rhythm stable, teaching you to listen to your energy levels and avoid burnout.",
         "Walking at different paces helps regulate both body and mood — brisk steps wake up your senses, while slow moments ground and restore calm.",
         "Yoga is a natural way to bring energy and peace into harmony, engaging the body while soothing the nervous system and quieting thoughts.",
         "A meditative dance or slow-flow stretch calms the spirit, releases blocked energy, and leaves you feeling both centered and alive."],
        
        ["A quick warm-up activates not just your body but also your brain, waking up your focus, coordination, and readiness to tackle challenges ahead.",
         "Using the Pomodoro technique with mindful breaks helps you stay productive — bursts of focus followed by short rests keep your mind fresh and alert.",
         "Incorporating light physical exercise into your routine sharpens concentration by improving blood flow, posture, and mental clarity.",
         "Taking small, active breaks between work blocks resets your attention, prevents fatigue, and gives your mind space to breathe before diving back in.",
         "Listening to rhythmic music while working can boost motivation, enhance focus, and help you slip into a steady, productive flow state."],
        
        ["An energetic start to the day stimulates creativity by waking up both body and imagination, setting the tone for inspired action throughout the day.",
         "Moving to music helps channel emotions into motion — it fuels motivation and encourages spontaneous creative thinking.",
         "A short workout paired with visualization exercises prepares your mind and body for success, turning energy into focused creative drive.",
         "Active exercises throughout the day refresh your body and mind, keeping ideas flowing and your enthusiasm alive.",
         "Keeping a running list of energetic ideas guides your attention toward action, helping you turn inspiration into movement and tangible progress."],
        
        ["A tidy space soothes the mind by removing visual noise and creating a sense of control, which naturally allows you to focus and breathe easier.",
         "Careful, intentional planning helps reduce stress because it turns uncertainty into structure, allowing you to move calmly through the day.",
         "Sorting your environment brings both mental and physical clarity — it’s an act of self-organization that signals your brain it’s time to focus.",
         "Keeping organized to-do lists helps you act calmly, turning overwhelming tasks into small, approachable steps you can handle with ease.",
         "Designing a cozy, intentional environment enhances focus and comfort, reminding you that peace and productivity can coexist beautifully."],
        
        ["Well-crafted plans help distribute your attention evenly and make it easier to stay focused on what truly matters during the day.",
         "Breaking tasks into smaller, structured steps removes the feeling of overwhelm and keeps your workflow steady and efficient.",
         "An organized workspace helps your mind concentrate by minimizing distractions and signaling that it’s time to work with purpose.",
         "Maintaining clear checklists ensures that your attention stays aligned with your priorities, providing calm clarity throughout your tasks.",
         "Using timers or focus intervals structures your work rhythm, helping you maintain deep focus without losing energy or motivation."],
        
        ["Intentional planning turns scattered creativity into a guided process — structure gives your imagination the space it needs to grow.",
         "An organized workspace doesn’t just boost inspiration; it invites creativity by providing a visual sense of order and calm energy.",
         "Collecting and systematizing your ideas makes creativity easier and faster, ensuring that flashes of inspiration never get lost.",
         "Sorting your inspiration sources into categories helps you quickly find what you need and see patterns in your creative process.",
         "Turning abstract ideas into checklists converts inspiration into action, bridging the gap between vision and tangible results."]
    ]
    
    let habitSlogans: [String] = [
        "Connect & Relax",
        "Connect & Focus",
        "Connect & Inspire",
        "Energize & Relax",
        "Focus & Energize",    
        "Inspire & Energize",
        "Organize & Relax",
        "Focus & Organize",
        "Inspire & Organize"
    ]
    
    // MARK: - Menu:
    @Published var tabBarPage: Int = 0
    
    @Published var currentScore: Int = 0
    @Published var numberOfLevel: Int = 0
    @Published var todayCreated: Int = 0
    @Published var targets: [Int] = [
        40,
        110,
        210,
        350,
        540,
        790,
        1110,
        1510,
        2000,
        2000
    ]
    
    @Published var taskDay: String = ""
    @Published var taskNumber: Int = 0
    @Published var taskDate: Int = 0
    @Published var taskActive: Bool = true
    @Published var titles: [String] = [
        "Daily Seed",
        "Double Start",
        "Triple Set",
        "Rhytm Pack",
        "Focus Five",
        "Solid Six",
        "Expand Eight",
        "Top Ten",
        "Dozen Design",
        "Maker's Fifteen"
    ]
    @Published var tasks: [String] = [
        "Generate 1 new habit today.",
        "Generate 2 new habit's today.",
        "Generate 3 new habit's today.",
        "Generate 4 new habit's today.",
        "Generate 5 new habit's today.",
        "Generate 6 new habit's today.",
        "Generate 8 new habit's today.",
        "Generate 10 new habit's today.",
        "Generate 12 new habit's today.",
        "Generate 15 new habit's today."
    ]
    @Published var rewards: [Int] = [
        25,
        45,
        65,
        85,
        105,
        125,
        160,
        200,
        240,
        300
    ]
    
    // MARK: - Welcome:
    @Published var isWelcome: Bool = false
    @Published var pageWelcome: Int = 0
    @Published var dateWelcome: Int = 0
    
    // MARK: - Task:
    @Published var isTask: Bool = false
    @Published var typeTask: Int = 0
    @Published var pageTask: Int = 0
    
    // MARK: - Dayline:
    @Published var isCreate: Bool = false
    @Published var createEntry: DaylineEntry = DaylineEntry(id: 0, time: 0, location: 0, type0: 0, type1: 3, hands: "", intention: "", isDone: false)
    @Published var loadingProgress: Int = 0
    @Published var isOnLoading: Bool = false
    @Published var isLoading: Bool = false
    @Published var daylines: [Dayline] = []
    @Published var daylinePercentage: Int = 0
    @Published var daylineField: Int = 9
    
    func updateDaylineStats() {
        guard !daylines.isEmpty else {
            daylinePercentage = 0
            daylineField = 9
            return
        }
        
        var typeCount: [Int: Int] = [:]
        
        for dayline in daylines {
            typeCount[dayline.type0, default: 0] += 1
            typeCount[dayline.type1, default: 0] += 1
        }
        
        if let (mostCommonType, count) = typeCount.max(by: { $0.value < $1.value }) {
            let totalTypes = daylines.count * 2
            let percentage = Int(Double(count) / Double(totalTypes) * 100)
            
            daylinePercentage = percentage
            daylineField = mostCommonType
        } else {
            daylinePercentage = 0
            daylineField = 9
        }
    }
    
    public func setupCreate() {
        createEntry = DaylineEntry(id: 0, time: 0, location: 0, type0: 0, type1: 3, hands: "", intention: "", isDone: false)
        loadingProgress = 0
        isOnLoading = false
        isLoading = false
        
        withAnimation() {
            isCreate = true
        }
    }
    
    func saveDaylines() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(daylines)
            UserDefaults.standard.set(data, forKey: "daylinesKey")
        } catch {
            print("❌ Failed to save daylines: \(error.localizedDescription)")
        }
    }
    
    func loadDaylines() {
        guard let data = UserDefaults.standard.data(forKey: "daylinesKey") else { return }
        do {
            let decoder = JSONDecoder()
            let saved = try decoder.decode([Dayline].self, from: data)
            self.daylines = saved
        } catch {
            print("❌ Failed to load daylines: \(error.localizedDescription)")
        }
    }
    
    public func getIndexFromMixHabits(_ type0: Int, _ type1: Int) -> Int {
        switch type0 {
        case 0:
            switch type1 {
            case 3:
                return 0
            case 4:
                return 1
            case 5:
                return 2
            default:
                return 0
            }
        case 1:
            switch type1 {
            case 3:
                return 3
            case 4:
                return 4
            case 5:
                return 5
            default:
                return 0
            }
        case 2:
            switch type1 {
            case 3:
                return 6
            case 4:
                return 7
            case 5:
                return 8
            default:
                return 0
            }
        default:
            return 0
        }
    }
    
    public func convertationScoreToLevel() {
        var currentLevelTemp: Int = 0
        
        for index in 0...targets.count - 1 {
            if currentScore < targets[index] {
                currentLevelTemp = index
                break
            }
        }
        
        if currentLevelTemp <= 9 {
            numberOfLevel = currentLevelTemp
        } else {
            numberOfLevel = 9
        }
    }
    
    public func setupDailyTask() {
        if taskDay == "" {
            taskDate = 0
            taskActive = true
        } else {
            if taskDay == getTodayDayString() {
                if taskDate == 2 {
                    taskActive = false
                } else {
                    taskDate = 0
                    taskActive = true
                }
            } else {
                if taskNumber < 9 {
                    taskNumber += 1
                }
                
                taskDate = 0
                taskActive = true
            }
        }
        
        saveUserDefaults()
    }
    
    public func checkDailyTask() {
        switch taskNumber {
        case 0:
            if todayCreated >= 1 {
                completeDailyTask()
            }
        case 1:
            if todayCreated >= 2 {
                completeDailyTask()
            }
        case 2:
            if todayCreated >= 3 {
                completeDailyTask()
            }
        case 3:
            if todayCreated >= 4 {
                completeDailyTask()
            }
        case 4:
            if todayCreated >= 5 {
                completeDailyTask()
            }
        case 5:
            if todayCreated >= 6 {
                completeDailyTask()
            }
        case 6:
            if todayCreated >= 8 {
                completeDailyTask()
            }
        case 7:
            if todayCreated >= 10 {
                completeDailyTask()
            }
        case 8:
            if todayCreated >= 12 {
                completeDailyTask()
            }
        case 9:
            if todayCreated >= 15 {
                completeDailyTask()
            }
        default:
            print("Error: unowned")
        }
    }
    
    public func completeDailyTask() {
        withAnimation() {
            taskDate = 2
            taskActive = false
            taskDay = getTodayDayString()
            
            currentScore += rewards[taskNumber]
            convertationScoreToLevel()
            
            saveUserDefaults()
        }
    }
    
    func getTodayDayString() -> String {
        let today = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: today)
        return String(day)
    }
    
    func currentWeekdayName() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "EEEE"
        return formatter.string(from: date)
    }
    
    public func saveUserDefaults() {
        UserDefaults.standard.set(dateWelcome, forKey: "dateWelcome")
        UserDefaults.standard.set(currentScore, forKey: "currentScore")
        UserDefaults.standard.set(taskNumber, forKey: "taskNumber")
        UserDefaults.standard.set(todayCreated, forKey: "todayCreated")
        UserDefaults.standard.set(taskDate, forKey: "taskDate")
        UserDefaults.standard.set(taskDay, forKey: "taskDay")
    }
    
    public func loadUserDefaults() {
        dateWelcome = UserDefaults.standard.integer(forKey: "dateWelcome")
        currentScore = UserDefaults.standard.integer(forKey: "currentScore")
        taskNumber = UserDefaults.standard.integer(forKey: "taskNumber")
        todayCreated = UserDefaults.standard.integer(forKey: "todayCreated")
        taskDate = UserDefaults.standard.integer(forKey: "taskDate")
        taskDay = UserDefaults.standard.string(forKey: "taskDay") ?? ""
    }
}
