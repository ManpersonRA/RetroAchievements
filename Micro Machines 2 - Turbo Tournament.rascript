// Micro Machines 2 - Turbo Tournament
// #ID = 3246

//Additional Notes
//Hubs
//Game Mechanic: Time-Attack
//Meta - Set Partially Allows Multiplayer
//Perspective - Top Down
//Regional - Europer Exclusive - SNES ( I seen this one is not very used )
//Theme - Honey I Shrunk the Games
// * * * * * * * * * * * * * * * * * * * * GLOBAL VARIABLES * * * * * * * * * * * * * * * * * * * * 
game_state = byte(0x1FE)
game_state_backup = byte(0x1FA)
//game state variables
challenge_race = 0xef
challenge_podium = 0xf9
challenge_course = 0xe9
challenge_won = 0xc1
time_trial_race = 0xd8
head_to_head_race = 0x70
head_to_head_podium = 0x73
head_to_head_won = 0x82

course_image = byte(0x2C9)

player_character = byte(0x2B9)

first_place = byte(0x2C1)

race_number = byte(0x7CD)

laps_left = byte(0x12D6)

progress = byte(0x12a0)

//in head to head
points = byte(0x10EC)


//Timer, updates at the end of a lap / race to the cumulative time
minutes = byte(0x19DA)
tens = byte(0x19DB)
seconds = byte(0x19DC)
tenths = byte(0x19DD)
hundredths = byte(0x19DE)

//3 lap or 1 lap
lap_mode = byte(0x12de)

//only for red car
laps_left = byte(0x12d6)

//for bonus stage
micro_machines = byte(0x1AAC)

// is 1 if Super Lap, 0 otherwise
super_lap = byte(0x90C)

lives = byte(0x2e5)

car_x = word(0x11A4)
car_y = word(0x11B6)


// * * * * * * * * * * * * * * * * * * * * ARRAYS * * * * * * * * * * * * * * * * * * * * 

characters = {
    0x00: "Spider",
    0x01: "Bruno",
    0x02: "Dwayne",
    0x03: "Cherry",
    0x04: "Jethro",
    0x05: "Maria",
    0x06: "Violet",
    0x07: "Edina",
    0x08: "Svelee",
    0x09: "Jeremy",
    0x0a: "Walter",
    0x0b: "Lisa",
    0x0c: "Emile",
    0x0d: "Davey",
    0x0e: "Delora",
    0x0f: "Chen"
}
challenge_races = {
    0: "Bonus Course",
    1: "Training Camp",
    2: "Toolbox Terror",
    3: "Sand Castles",
    4: "Pinball Pursuit",
    5: "Cob Challenge",
    6: "Ceiling Circuits",
    7: "Garage Games",
    8: "Atv Action",
    9: "Lights Out!",
    10: "Ball Bonanza",
    11: "Whine On!",
    12: "Roller Coaster",
    13: "Bury My Body",
    14: "Piano Panic",
    15: "Bathtub Burnoff",
    16: "Banked Oval",
    17: "Treehouse Tiles",
    18: "Vice Squad",
    19: "Musical Hits",
    20: "Toaster Trouble",
    21: "Ball Chase",
    22: "Crossing Chaos",
    23: "Ups n Downs",
    24: "Bricks n Trees",
    25: "Windy Willows"
}

super_league_races = {
    0x05: "Tiny Treehouse",
    0x0d: "Garden Jumps",
    0x28: "Rim Runners",
    0x31: "Chainsaw Chase!",
    0x15: "Cue Capers",
    0x2b: "Rapid Results",
    0x18: "In a Spin",
    0x03: "Step on It",
    0x26: "Attic Antics",
    0x0a: "Jelly Jitters",
    0x1c: "Picnic Problems",
    0x06: "Plate Hop",
    0x1f: "Turbo Blast",
    0x2d: "Pipe Patience",
    0x02: "Pinball Panic",
    0x00: "Raining Champ"

}

super_league_division = {
    0x05: "4",
    0x0d: "4",
    0x28: "4",
    0x31: "4",
    0x14: "3",
    0x2b: "3",
    0x18: "3",
    0x03: "3",
    0x26: "2",
    0x0a: "2",
    0x1c: "2",
    0x06: "2",
    0x1f: "1",
    0x2d: "1",
    0x02: "1",
    0x00: "1"

}
time_trials = {
    1: ["Roller Coaster", 2600, 8000, "26.00", "80.00"],
    2: ["Tiny Treehouse", 1195, 3890, "11.95", "38.90"],
    3: ["Ferry Fiasco", 2470, 7840, "24.70", "1:18.40"],
    4: ["Basement Bumps", 1985, 6293, "19.85", "1:02.93"],
    5: ["Spill Thrills", 4020, 12628, "40.20", "2:06.28"],
    6: ["Chainsaw Chase!", 1960, 6171, "19.60", "1:01.71"],
    7: ["Garage Games", 1610, 4697, "16.10", "46.97"],
    8: ["Water Chase", 2053, 6305, "20.53", "1:03.05"],
    9: ["Turbo Turns", 1404, 4585, "14.04", "45.85"],
    10: ["Pool Slalom", 2792, 8752, "27.92", "1:27.52"],
    11: ["Bathtub Burnoff", 1772, 5500, "17.72", "55.00"],
    12: ["Dervish Danger", 2689, 8715, "26.49", "1:26.15"],
    13: ["Frosty Reception", 2405, 7681, "24.05", "1:16.81"],
    14: ["Pinball Panic", 2327, 7868, "23.27", "1:18.68"],
    15: ["Pipe Patience", 1700, 5200, "17.00", "52.00"],
    16: ["Banked Oval", 1412, 4236, "14.12", "42.16"],
    17: ["Ups N Downs", 4630, 15543, "46.30", "2:35.43"],
    18: ["Ball Chase", 2665, 8475, "26.65", "8475"],
    19: ["Musical Hits", 2084, 6549, "20.84", "65.49"],
    20: ["Step on It", 2705, 8969, "27.05", "1:29.69"],
    21: ["Crossing Chaos", 2463, 7839, "24.63", "78.39"],
    22: ["Vice Squad", 1385, 4321, "13.85", "43.21"],
    23: ["Stream Struggle", 3807, 12222, "38.07", "2:02.22"],
    24: ["Rim Runners", 600, 1839, "6.00", "18.39"],
    25: ["Treehouse Tiles", 3222, 10250, "32.22", "1:42.50"],
    26: ["Garden Jumps", 3188, 9978, "31.88", "1:39.78"],
    27: ["Toolbox Terror", 17.17, 51.51, "17.17", "51.51"]
    
}

time_trials_races = {
    1: "Roller Coaster",
    2: "Tiny Treehouse",
    3: "Ferry Fiasco",
    4: "Basement Bumps",
    5: "Spill Thrills",
    6: "Chainsaw Chase!",
    7: "Garage Games",
    8: "Water Chase",
    9: "Turbo turns",
    10: "Pool Slalom",
    11: "Bathtub Burnoff",
    12: "Dervish Danger",
    13: "Frosty Reception",
    14: "Pinball Panic",
    15: "Pipe Patience",
    16: "Banked Oval",
    17: "Ups n Downs",
    18: "Ball Chase",
    19: "Musical Hits",
    20: "Step on It",
    21: "Crossing Chaos",
    22: "Vice Squad",
    23: "Stream Struggle",
    24: "Rim Runners",
    25: "Treehouse Tiles",
    26: "Garden Jumps",
    27: "Toolbox Terror",
    
}

// * * * * * * * * * * * * * * * * * * * * BASIC FUNCTIONS * * * * * * * * * * * * * * * * * * * * 

function DemoMode() => byte(0x1fe) == 0x2c

function IsSuperLeague() => game_state == 0x95

function PlayerWon() => player_character == first_place

function BonusWon() => micro_machines == 30

function ChallengeTransition(){
    return game_state == challenge_podium && prev(game_state) == challenge_race
}

function SpecialChallengeTransition(){
    return game_state == challenge_course && prev(game_state) == challenge_race
}

function IsSuperLap(){
    return super_lap == 1 && prev(super_lap) == 0

} 

function SLTrophyTransition(){
    return game_state_backup == 0xb9 && prev(game_state_backup) == 0x9c
}
//Converts this game's time format to centiseconds
function TimeConverter()
{
    return minutes * 6000 + tens * 1000 + seconds * 100 + tenths * 10 + hundredths
}



//FUNCTION CALLS TO ACHIEVEMENT CREATION FUNCTIONS
// * * * * * * * * * * * * * * * * * * * * Super League 16 Pts * * * * * * * * * * * * * * * * * * * * 
//These bytes are the expected player location, and the number of points they have respectively, for each division
//Status: UNTESTED
function PlayerHas16Points(player_location, player_points)
{
    return player_location == player_character && 
            player_points == 16 &&
            prev(player_points) == 12
}

function SuperLeaguePoints(player_location, division_num, player_points)
{
    achievement(
        title = "Division " + division_num + " Champ",
        description = "In Super League division " + division_num + ", score a perfect 16 points",
        points = 10,
        trigger = IsSuperLeague() && PlayerHas16Points(player_location, player_points)
    )
}

SuperLeaguePoints(byte(0x798), 1, byte(0x7A8))
SuperLeaguePoints(byte(0x79C), 2, byte(0x7AC))
SuperLeaguePoints(byte(0x7A0), 3, byte(0x7B0))
SuperLeaguePoints(byte(0x7A4), 4, byte(0x7B4))

//  * * * * * * * * * * * * * * * * * * * * Time Trials * * * * * * * * * * * * * * * * * * * * 
//STATUS: UNFINISHED

//Time Trials are 100% compatible with multiplayer, don't even need to add anything else to make it work
function TimeTrialCheevo(one_lap_val, one_lap_time, three_lap_val, three_lap_time, course_num, course_name)
{
    achievement(
        title = course_name + " Time Trial",
        description = "In Time Trial mode, get a 1-lap time of under " + one_lap_time
            + " or a 3-lap time of under " + three_lap_time + " on course " 
            + course_num + ", " + course_name,
        points = 5,
        trigger = game_state == 0xd8 && race_number == course_num &&
        laps_left == 0 && prev(laps_left) == 1 && 
        (
            (TimeConverter() <= one_lap_val && lap_mode == 1) ||
            (TimeConverter() <= three_lap_val && lap_mode == 3)
        )
    )
}

for key in time_trials
    TimeTrialCheevo(time_trials[key][1], time_trials[key][3] , time_trials[key][2], time_trials[key][4], key, time_trials[key][0])


// * * * * * * * * * * * * * * * * * * * * Progression Functions * * * * * * * * * * * * * * * * * * * * 
// STATUS: COMPLETE

//Gamemode: 1 = Challenge, 2 = Head to Head
//For Challenge and Head to Head progression (except final)
function Progression(title, description, points, gamemode, progress)
{
    state = 0x00
    if (gamemode == 1)
        state = 0xE9
    else
        state = 0x6A
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = game_state == state &&
        race_number == progress + 1 && prev(race_number) == progress,
        type="progression"
    )
}

//For SuperLeague Progression (except final)
function ProgressionSL(title, description, points, before_position, after_position)
{
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = prev(game_state) == 0x95 &&
        (prev(before_position) == player_character) &&
        after_position == player_character &&
        prev(after_position)!=player_character,
        type="progression"
    )
    
    
}


// * * * * * * * * * * * * * * * * * * * * Challenge Mode progression * * * * * * * * * * * * * * * * * * * * 
//STATUS: UNTESTED

Progression("The Challenge Has Begun!", "Qualify on the first race in Challenge Mode", 3, 1, 1)
Progression("Challenged the Cob", "Qualify on Challenge Race 5, Cob Challenge", 10, 1, 5)
Progression("Pool Shark", "Qualify on Challenge Race 10, Ball Bonanza", 25, 1, 10)
Progression("Rinsed the Competition", "Qualify on Challenge Race 15, Bathtub Burnoff", 25, 1, 15)
Progression("Twas a Piece of... Toast", "Qualify on Challenge Race 20, Toaster Troble", 50, 1, 20)

//final one required different logic

achievement("Silver Trophy", 
            "Qualify on Challenge Race 25, Windy Willows, and complete Challenge Mode!",
            50,
            prev(game_state) == challenge_podium && game_state == challenge_won &&
            race_number == 0x19,
            type="progression"
)
// * * * * * * * * * * * * * * * * * * * * Head to Head progression * * * * * * * * * * * * * * * * * * * * 
//STATUS: UNTESTED

Progression("Head-to-Head Training", "Win the first race in Head-to-Head Mode", 3, 2, 1)
Progression("Difficult Dump Truck", "Win Head-to-Head Race 5, Cob Challenge", 10, 2, 5)
Progression("ATV Alliteration", "Win Head-to-Head Race 8, ATV Action", 10, 2, 8)
Progression("Very Difficult Dump Truck", "Win Head-to-Head Race 11, Whine On!", 50, 2, 11)
Progression("Banked Rectangle", "Win Head-to-Head Race 16, Banked Oval", 25, 2, 16)
Progression("Toasted Triumph", "Win Head-to-Head Race 20, Toaster Trouble", 25, 2, 20)
Progression("Feeling Up", "Win Head-to-Head Race 23, Ups n Downs", 25, 2, 23)

//final one required different logic

achievement("Bronze Trophy",
            "Complete Head-to-Head mode by winning Race 25, Windy Willows",
            50,
            prev(game_state) == head_to_head_podium && game_state == head_to_head_won &&
            race_number == 0x19,
            type="progression"
)

// * * * * * * * * * * * * * * * * * * * * Super League Progression * * * * * * * * * * * * * * * * * * * * 
//STAtUS: UNFINISHED
//(NEED SUPER LEAGUE WIN STATE)
//Here, the bytes represent the player's expected current location, 
//and the location they will be at upon the achievement triggering
//Needs the rest
ProgressionSL("Division 4 Complete", "Rank up to the 3rd division in Super League mode", 10, byte(0x7A4), byte(0x7A3))
ProgressionSL("Division 3 Complete", "Rank up to the 2nd division in Super League mode", 10, byte(0x7A0), byte(0x79F))
ProgressionSL("Division 2 Complete", "Rank up to the 1st division in Super League mode", 25, byte(0x79C), byte(0x79B))

achievement("Gold Trophy", "Earn a gold trophy by winning in the 1st division in SUper League mode", 25,
            game_state == 0x95 && race_number == 0x04 && SLTrophyTransition()
)

// * * * * * * * * * * * * * * * * * * * * Shutouts  * * * * * * * * * * * * * * * * * * * * 
//STATUS: UNTESTED

function ShutoutHelper(num){
    return game_state == 0x73 && prev(game_state) == 0x70 &&
            laps_left != 0 && points == 7 && race_number == num
}

//For calculating how many shutouts a player has
function Shutout(title, description, points, num)
{
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = measured(
            //thanks scatter
            tally_of(range(1, 25), num, r => once(ShutoutHelper(r)))
            
        ) && never(game_state == 0x0d)
    )
}

Shutout("All of the Lights", "In Head-to-Head mode, win by turning on all your lights", 1, 1)
Shutout("Shutout Pro", "In Head-to-Head mode, win by turning on all your lights 5 times in a single session", 5, 5)
Shutout("Shutout Master", "In Head-to-Head mode, win by turning on all your lights 15 times", 25, 15)

// * * * * * * * * * * * * * * * * * * * * Bonus stages * * * * * * * * * * * * * * * * * * * * 
// STATUS: UNTESTED

function Bonus(title, description, points, course){
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = game_state == 0x14 && 
        prev(micro_machines) == 29 && BonusWon() 
        && course_image == course
    )
}




Bonus("Extra Life", "In Challenge mode, Collect all 30 Micro Machines on Bonus Course 1", 5, 0x37)
Bonus("Sandy Life", "In Challenge mode, Collect all 30 Micro Machines on Bonus Course 2", 10, 0x38)
Bonus("Precise Life", "In Challenge mode, Collect all 30 Micro Machines on Bonus Course 3", 10, 0x39)
Bonus("Reverse Life", "In Challenge mode, Collect all 30 Micro Machines on Bonus Course 4", 10, 0x3a)
Bonus("Repeated Life", "In Challenge mode, Collect all 30 Micro Machines on Bonus Course 5", 10, 0x3b)
// * * * * * * * * * * * * * * * * * * * * Collectables * * * * * * * * * * * * * * * * * * * * 
//STATUS: UNTESTED

bonus_life = byte(0x910) == 1

achievement(
    title = "1-up Walter",
    description = "In challenge mode, collect the 1-up Walter on Roller Coaster that doesn't actually award you an extra life",
    points = 3,
    trigger = game_state == challenge_race && bonus_life && prev(!bonus_life) && course_image == 0x09
)

//unlike above, this collectable does not seem to be stored anywhere in memory. Must rely on the lap changing when the player is far enough left of the starting line that it wont trigger
achievement(
    "Free Lap",
    "In challenge mode, collect the free lap item in Musical Hits",
    3,
    game_state == challenge_race && course_image == 0x17 &&
    laps_left < prev(laps_left) && car_x <= 0x610 && car_y <= 0x240
)
// * * * * * * * * * * * * Turning on all lights on the first lap * * * * * * * * * * * * * *
//STATUS: COMPLETE
achievement(
    title = "Faster Than the Lights",
    description = "Win a Head-to-Head race by turning on all your lights in the first lap on any course except training camp or toolbox terror",
    points = 10,
    trigger = prev(game_state == head_to_head_race) && game_state == head_to_head_podium && 
               laps_left == 3 && points == 7 && race_number > 2
    
)
// * * * * * * * * * * * 3 races in a row being perfect in head to head * * * * * * * * * * * 
//STATUS: COMPLETE

achievement("All Your Lights Are Belong to Us", 
            "In Head-to-Head Mode, win 3 races in a row without having your opponent turn on any of their lights",
            5, 
            measured(tally(3,
                    game_state == head_to_head_podium && prev(game_state) == head_to_head_race && PlayerWon()
                )
            ) &&
            never(points < prev(points) && points != 0 && game_state == head_to_head_race)

)
// * * * * * * * * * * * * * * * * * * * * First places * * * * * * * * * * * * * * * * * * * * 
// STATUS: UNTESTED

function FirstPlace(title, description, points, num){
    achievement(title, description, points,
        measured(tally(num, PlayerWon() && (ChallengeTransition() || SpecialChallengeTransition())), course_image < 0x37) && never(game_state == 0x0d) // 0x0d is title screen
    )
}
//Needs the rest
FirstPlace("If You Ain't First, You're Last", "Win 5 times in Challenge mode in one session", 5, 5)
FirstPlace("Second Place Is First Loser", "Win 15 times in Challenge mode in one session", 10, 15)
FirstPlace("This Looks Familiar", "Win 18 times in Challenge mode in one session", 25, 18)

// * * * * * * * * * * * * * * * * * * * *  Auto Qualify * * * * * * * * * * * * * * * * * * * * 
// STATUS: UNFINISHED
pts = [3, 3, 5, 5, 5, 10, 25, 10, 10, 10]
function AutoQualify(i){
    achievement(challenge_races[i+1] + " Super Lap ", 
                "In Challenge mode, auto-qualify with a Super Lap on race " + i+1 + ", " + challenge_races[i+1], 
                pts[i],
                game_state == challenge_race && IsSuperLap() && race_number == i+1
    )
}

//14 seconds

for i in range(0, 9)
    AutoQualify(i)
//18 seconds?
//I don't know what the qualifying times are, actually
            
// * * * * * * * * * * * * * * * * * * * *  1-ups * * * * * * * * * * * * * * * * * * * * 
//STATUS: COMPLETE

achievement("Life Hoarder", "In Challenge Mode, have 7 lives at one time", 10,
                !DemoMode() && lives == 7 && prev(lives == 6)   
)

// * * * * * * * * * * * * * * * * * * * * Shortcuts * * * * * * * * * * * * * * * * * * * *
// STATUS: UNTESTED

//Uses the game's built-in checkpoint system
function Shortcut(prev_min, prev_max, post_min, post_max){
    
    return prev(progress) >= prev_min && prev(progress) <= prev_max &&
    progress >= post_min && progress <= post_max

}

//                                         min   max   min   max   course ident 
//                                         start end   start end       

achievement("Pretty Colors", "In Roller Coaster, cut between two paint containers after the wooden plank", 1, 
    course_image == 0x09 && //roller coaster
    !DemoMode() &&
    Shortcut(0x7b, 0x7c, 0x84, 0x85)
)
achievement("No Cup of Joe", 
            "In Ferry Fiasco, take a shortcut on the upper side of a coffee cup at the very end of the course",
            2, 
            course_image == 0x22 && //Ferry Fiasco
            !DemoMode() &&
            Shortcut(0xa2, 0xa3, 0x00, 0x01)
         )
//Shortcut 1: 0x10, 0x16 0x1d, 0x26
//Shortcut 2:0x25, 0x2b, 0x33, 0x29,
//Shortcut 3: 0x33, 0x38, 0x3b, 0x46
achievement("Naughty But Knife", 
            "In Spill Thrills / Whine On, near the start, take the three back-to-back shortcuts while heading down in a single lap",
            3,
            never(prev(laps_left)!=laps_left) &&
            course_image == 0x04 && //Spill Thrills / Whine On
            !DemoMode() &&
            measured(
                tally(3, once(Shortcut(0x10, 0x16, 0x1d, 0x26)),
                once(Shortcut(0x25, 0x2b, 0x33, 0x39)),
                once(Shortcut(0x33, 0x38, 0x3b, 0x46)))
                )
    
)         
achievement("Had Enough Games",
             "In Garage Games, cut the big U-turn short by sneaking into the gap",
             3,
             course_image == 0x1e &&
             !DemoMode() &&
             Shortcut(0x5e, 0x62, 0x6c, 0x6e)
)


//0x38, 0x42,0x4c, 0x54
//0x8c, 0x92, 0xa2, 0xa6
achievement("Ultra Turbo Turns",
            "In Turbo Turns, go between the paint containers at the top and bottom of the course",
            2,
            never(prev(laps_left)!=laps_left) &&
            course_image == 0x2a && //Spill Thrills / Whine On
            !DemoMode() &&
            measured(
                tally(2, once(Shortcut(0x38, 0x42,0x4c, 0x54)),
                         once(Shortcut(0x8c, 0x92, 0xa2, 0xa6))
                )
            )       
)
//0x1b
achievement("Ice Cream",
            "In Dervish Danger, go on the upper side of the puddle near the dust funnels and ice cream",
            1,
            course_image == 0x1b && !DemoMode() &&
            Shortcut(0x7b, 0x81, 0x8b, 0x8e)
)

achievement("Straight to the Drain",
             "In Pinball Panic, take at least three of the many large shortcuts in one lap",
             4,
             course_image == 0x02 && !DemoMode() &&
             never(prev(laps_left)!=laps_left) &&
             measured(tally(3, prev(progress)+7 <= progress))
)
             

achievement("Straight Shot",
            "In Ball Chase, drive straight at the very start and skip the entire turn",
            1,
            course_image == 0x12 &&
            !DemoMode() &&
            Shortcut(0x02,0x03,0x0c,0x0f)
)

achievement("Go Under, Over",
            "In Treehouse Tiles, take two shortcuts by going under walkie talkies",
            3,
            course_image == 0x01 &&
            !DemoMode() &&
            never(prev(laps_left)!=laps_left) &&
            measured(
                tally(2, once(Shortcut(0x00, 0x05, 0x0c, 0x11)),
                         once(Shortcut(0x79, 0x7b, 0x86, 0x8b))
                )
            )
)

achievement("Green Thumb",
            "In Garden Jumps, take the shortcut by the flower pot at the first u-turn",
            2,
            course_image == 0x0d &&
            !DemoMode() &&
            Shortcut(0x31, 0x32, 0x3b, 0x3c)
)
function template(title, description, points){
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = ""
    )
}
// * * * * * * * * * * * * * * * * * * * * Leaderboards * * * * * * * * * * * * * * * * * * * * 
// STATUS: COMPLETE

function TTLB(course_name, course){
    //1-lap
    leaderboard(
        title = course_name + " 1-lap",
        description = "Time Trial mode, " + course_name+ ", 1-lap",
        start = repeated(100, game_state == time_trial_race) && laps_left == 0 && prev(laps_left) == 1 && lap_mode == 1 
        && race_number == course && never(game_state != time_trial_race),
        cancel = always_false(),
        submit = always_true(),
        value = TimeConverter(),
        format="MILLISECS",
        lower_is_better = true
    )
    //3-lap
    leaderboard(
        title = course_name + " 3-lap",
        description = "Time Trial mode, "+course_name+ ", 3-lap",
        start = repeated(100, game_state == time_trial_race) && laps_left == 0 && prev(laps_left) == 1 && lap_mode == 3
        && race_number == course && never(game_state != time_trial_race),
        cancel = always_false(),
        submit = always_true(),
        value = TimeConverter(),
        format="MILLISECS",
        lower_is_better = true
    )
    
}

for key in time_trials
    TTLB(time_trials[key][0], key)

// * * * * * * * * * * * * * * * * * * * * Rich Presence * * * * * * * * * * * * * * * * * * * * 


function SuperLeagueDivision(){
    if(byte(0x778)==4){return byte(0x778)}
   /* if(byte(0x778) == player_character || byte(0x779) == player_character || byte(0x77a) == player_character || byte(0x77b) == player_character)
    {
        return 4
    } else if(byte(0x77c) == player_character || byte(0x77d) == player_character || byte(0x77e) == player_character || byte(0x77f) == player_character){
        return 3
    } else if(byte(0x780) == player_character || byte(0x781) == player_character || byte(0x782) == player_character || byte(0x783) == player_character){
        return 2
    } else return 1 */
}
//not in a racing state
rich_presence_conditional_display(game_state != challenge_race && game_state != head_to_head_race && 
                                  game_state != time_trial_race && !IsSuperLeague() && game_state != 0x14,
                                  "Player is in the menus"
                        )
//(byte(0x778) == player_character || byte(0x779) == player_character || byte(0x77a) == player_character || byte(0x77b) = player_character)? "4",
//(byte(0x77c) == player_character || byte(0x77d) == player_character || byte(0x77e) == player_character || byte(0x77f) = player_character)? "3",
//etc

//BROKEN, courses dont work as i though. Should use course images instead
rich_presence_conditional_display(IsSuperLeague(), "{0} is competing in the Super Leage, Division {1} on course {2} ",
    rich_presence_lookup("Player Character", player_character, characters),
    rich_presence_lookup("Division", course_image, super_league_division ),
    rich_presence_lookup("Race", course_image, super_league_races)
    
)

_mode = {
    0x70: "Head to Head",
    0x14: "Challenge",
    0xef: "Challenge"
}                                                                                                               //bonus (broken..?)
rich_presence_conditional_display(game_state == challenge_race || game_state == head_to_head_race || game_state == 0x14,
    "{0} is in a {1} race on course {2} | Lives: {3}",
    rich_presence_lookup("Player Character", player_character, characters),
    rich_presence_lookup("mode", game_state, _mode),
    rich_presence_lookup("course", race_number, challenge_races),
    rich_presence_value("lives", lives)
)

rich_presence_display("{0} is doing a Time Trial on {1}, {2} lap mode",
    rich_presence_lookup("Player Character", player_character, characters),
    rich_presence_lookup("course_tt", race_number, time_trials_races),
    rich_presence_value("laps", lap_mode)
)
                        
             
