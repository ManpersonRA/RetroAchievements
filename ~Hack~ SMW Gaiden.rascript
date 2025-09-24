// ~Hack~ SMW: Gaiden
// #ID = 18548


//First, the two most important things in an SMW Hack. Level Identifier and Room Identifier

//Level Identifier
//How to find corresponding starting room identifier: 
    //If <= 0x24, room=level
    //Otherwise, add 0xDC

level_image = byte(0x13bf)
level_images = {
    0x01: "Yakisaba Coast 1",
    0x02: "Mount Blanc 4",
    0x03: "Senbei Strata 1",
    0x04: "Yakisoba Lowland 2",
    0x05: "Yoshi's Refuge 1A",
    0x06: "Nori Highland 1",
    0x07: "Mount Blanc 5",
    0x08: "Abyssal Hollow 3",
    0x09: "Mountain Overlook",
    0x0a: "Natto Lake",
    0x0b: "Taiyaki Secret",
    0x0c: "Yakisoba Lowland 3",
    0x0d: "Pepper Mines",
    0x0e: "Yakisoba Secret",
    0x0f: "Senbei Ghost House",
    0x10: "Mount Blanc 2",
    0x11: "Yakisaba Rapids 2",
    0x12: "Phantasm Forest Interlude 1",
    0x13: "Nori Ghost House",
    0x14: "Konpeitou Pipelines 2",
    0x15: "Senbei Detour",
    0x16: "Phantasm Forest 1",
    0x17: "Konpeitou Pipelines 3",
    0x18: "Refuge Secret 2",
    0x19: "Taiyaki Trench Area",
    0x1a: "Phantasm Forest 2",
    0x1b: "Phantasm Fortress",
    0x1c: "Mount Blanc 1",
    0x1d: "Konpeitou Secret 2",
    0x1e: "Curry Cavern 1",
    0x1f: "Archipelago Fortress",
    0x20: "#4 Ludwig's Castle",
    0x21: "Konpeitou Ghost House",
    0x22: "Konpeitou Pipelines 1",
    0x23: "Yoshi's Refuge 2A",
    0x24: "Yakisoba Fortress",
    0x25: "#1 Larry's Castle", //101
    0x26: "Senbei Strata 4", //102
    0x27: "Refuge Secret 1", //103
    0x28: "Yoshi's Shelter", //104
    0x29: "Phantasm Forest Outskirts", //105
    0x2a: "Yakisaba Coast 2", //106
    0x2b: "Senbei Strata 3", //107
    0x2c: "Abyssal Hollow 1", //108
    0x2d: "Curry Cavern 2", //109
    0x2e: "Mount Blanc 3", //10a
    0x2f: "Mint Cave Area", //10b
    0x30: "Nori Highland 2", //10c
    0x31: "Maou Koopa's Castle", //10d
    0x32: "Abyssal Fortress", //10e
    0x33: "Salt Mines", //10f
    0x34: "#7 Roy's Castle", //110
    0x35: "Curry Fortress", //111
    0x36: "Pressure Course", //112
    0x37: "Phantom Forst Interlude 2", //113
    0x38: "Yakisoba Lowland 1", //114
    0x39: "Konpeitou Secret 1", //115
    0x3a: "Senbei Strata 2", //116
    0x3b: "Mount Blanc Ghost House", //117
    0x3c: "Yoshi's Refuge 2B", //118
    0x3d: "Phantasm Forest 3", //119
    0x3e: "an extra stage", //11a down, up, right, right, up, right, right,  platforming, down, right, up, down
    // 0x11a: pipe level, 0x1cd: hand 1, 0x1d0: hand 2, 1d3: hand 3
    0x3f: "#6 Wendy's Castle", //11b
    0x40: "#3 Lemmy's Castle", //11c
    0x41: "Phantasm Ghost House", //11d
    0x42: "Phantasm Forest Encore", //11e
    0x43: "Phantasm Forest 4", //11f
    0x44: "Konpeitou Pipelines 4", //120
    0x45: "Yellow Switch", //121
    0x46: "Green Switch", //122
    0x47: "Red Switch", //123
    0x48: "Blue Switch", //124
    0x49: "Pleasure Course", //125
    0x4a: "Curry Ghost House", //126
    0x4b: "Even the SMWG Staff is Irritated Course", //127
    0x4c: "#5 Iggy's Castle", //128
    0x4d: "Abyssal Ghost House", //129
    0x4e: "#2 Morton's Castle", //12a
    0x4f: "Stress Course", //12b
    0x50: "Championship Course", //12c
    0x51: "Specialists' Course", //12d
    0x52: "Curry Sidedish", //12e
    0x53: "Yakisaba Rapids 1", //12f
    0x54: "Native Ztar 1", //130
    0x55: "Native Ztar 3", //131
    0x56: "Nori Secret", //132
    0x57: "Native Ztar 2", //133
    0x58: "Native Ztar 5", //134
    0x59: "Native Ztar 4", //135
    0x5a: "Abyssal Hollow 2", //136
    0x5b: "Yoshi's Refuge 1B", //137
    0x5c: "Bowser's Shed", //138
    0x5d: "Artillery", //139
    0x5e: "Warship", //13a
    0x5f: "Grandmaster Course", //13b
}




// room# (level#)
// Moon Locations:  15, 1D, 2B (8), 36 (25), 5C (17), 5F (6), 73 (40), 8F (4d), CE (?), F5(?), F6(?) (Appear to be the same level),
//                  107 (2b), 119 (3d)(Accessible?), 122 (46), 126 (4a), 135 (59), 136 (5a), 142 (5f), 1C2 (31), 1CE (?)
//                  Unsure if CE and 1CE are accessible levels, same with F5 and F6
// 15, 1D, 8, 25, 17, 6, 40, 4d, 2b, 3d, 46, 4a, 59, 5a, 5f, 31

powerup = byte(0x19)
pos_x = word(0x94)
pos_y = word(0x96)

game_state = byte(0x100)
room_image = word(0x10b)
coins = byte(0xdbf)
lives = byte(0xdbe)

on_yoshi = byte(0xdc1)
exit = byte(0xdd5)

timer = byte(0xf31)*100 + byte(0xf32)*10 + byte(0xf33)


score_total  = tbyte(0xf34)+tbyte(0xf37) // Mario and Luigi's score together

midway = byte(0x13ce)
function MidwayCollected() => midway==1 && prev(midway)==0
start_midway = byte(0x13cf)
function StartedFromCheckpoint() => start_midway == 0x40

pressed_big_switch = byte(0x13d2) //0x01 briefly, then changes to 1, 2, 3, or 4 depending on the color pressed
current_yc = byte(0x1420)

message_box = byte(0x1426)
function MessageBoxHit(num=-1){
    if num == -1
        return message_box > 0
    return message_box == num
}

key = byte(0x1434)
held_item = byte(0x148f)
star = byte(0x1490)
goal = byte(0x1493)
p_switch = byte(0x14ad)

overworld_mario = byte(0x1f11)
overworld_luigi = byte(0x1f12)

green_switch = byte(0x1f27)
yellow_switch = byte(0x1f28)
blue_switch = byte(0x1f29)
red_switch = byte(0x1f2a)
exits = byte(0x1f2e)


combo = byte(0x1697) // consecutive enemies mario has stepped on / hit with star power


function Paused() => byte(0x13d4) ==  0x01
// Additional
end_of_game_timer = byte(0x18e6)

// * * * * * * * * * * * * * * * * * * * * Progression * * * * * * * * * * * * * * * * * * * *


/* IMPORTANT NOTE
    If a level has more than one goal tape exit, you can do one of two things:
    1. Implement the logic yourself using 0x00000dd5
        it looks something like this
        achievement(
            title = title,
            description = description,
            points = points,
            trigger = prev(game_state) == 0x14 && level_image == level && exit == 0x02 && prev(exit)==0x00
        )
    2. Turn on this flag to make *all* achievemtsn rely on 0x00000dd5 for the trigger
*/

use_dd5 = 0
//Put all non-progression normal exits in this array [level-images] Any of these arrays can be empty
//Format: [[Title, Description, Points, Level_Image], [...]]
level_cheevos = [["The Foot of M2", "Defeat Larry Koopa in #1 Larry's Caslte", 5, 0x25],
                    ["The Coast and the Lowlands", "Defeat Morton Koopa in #2 Morton's Castle", 5, 0x4e],
                    ["Green Fuzzy Invasion", "Complete Phantasm Forest Interlude 2", 5, 0x37],
                    ["Charged Up Flame Chomps", "Complete Nori Secret", 3, 0x56],
                    ["Seeking Refuge", "Complete Refuge Secret 2", 3, 0x18],
                    ["The Underground Springs", "Defeat Lemmy Koopa in #3 Lemmy's Castle", 10, 0x40],
                    ["Secluded Fortress", "Defeat the boss in Phantasm Fortress", 5, 0x1B],
                    ["The Phantasmic Castle", "Defeat Ludwig von Koopa in #4 Ludwig's Castle", 10, 0x20],
                    ["I've Got a Better Idea", "Complete the level that is definitely a Ghost House in Senbei Strata", 5, 0x0f],
                    ["The Lower Plateau", "Defeat Iggy in #5 Iggy's Castle", 10, 0x4c],
                    ["Foreground Forest", "Complete Phantasm Forest Encore", 10, 0x42],
                    ["Lightly Salted", "Complete Salt Mines", 5, 0x33], 
                    ["The Higher Plateau", "Defeat Wendy in #6 Wendy's Castle", 10, 0x3f],
                    ["The Peak of M2", "Defeat Roy in #7 Roy's Castle", 10, 0x34],
                    ["Heavily Peppered", "Complete Pepper Mines", 10, 0x0d],
                    ["Mario Shish Kebab", "Complete Abyssal Fortress", 10, 0x32], 
                    //Might be worth 25
                    ["Pleasure", "Complete Pleasure Course", 10, 0x49],
                    ["Specialization", "Complete Specialists' Course", 10, 0x51],
                    ["Stress", "Complete Stress Course", 10, 0x4f], 
                    ["Pressure", "Complete Pressure Course", 10, 0x36],
                    ["Champion", "Complete Championship Course", 10, 0x50],
                    ["Irritation", "Complete Even the SMWG Staff is Irritated Course", 25, 0x4b],
                    ["Mastery", "Complete Grandmaster Course and finish the Special world!", 25, 0x5f]
                    
                    ]
//Put all progression normal exits in this array
level_prog_cheevos = [["No Breaks for Mario", "Complete Artillery and Warship", 10, 0x5e],
                        ["Middle of the Abyss", "Complete Abyssal Hollow 2", 10, 0x5a]

                         ]
//Put all non-progression key exits in this array
secret_level_cheevos = [
                        ["Yoshi Rapids", "Find the secret exit in Yakisaba Rapids 2", 5, 0x11],
                        ["Difficulty Switch", "Complete the secret exit of Yakisoba Lowland 2", 5, 0x04],
                        ["Can This P-Balloon Go Any Faster?", "Find the secret exit in Forest Interlude 3", 3, 0x3d],
                        ["Piranhas and P-Balloons", "Complete the secret exit of Mint Cave Area", 10, 0x2f],
                        ["Pressing Shift Five Times", "Complete the secret exit of Mount Blanc 4", 5, 0x02],
                        ["Secret of the Thwomp", "Complete the secret exit of Abyssal Hollow 1", 5, 0x2c],
                        ["Average Hack Ghost House", "Put together the clues and find the secret exit in Abyssal Ghost House", 10, 0x4d],
                        ["Return to Form", "Find the secret exit in Senbei Ghost House", 5, 0x0f],

]
//Put all progression key exits in this array
secret_prog_cheevos = []
//The win condition may need custom logic depending on the boss. If it is exit-based, put it here
win_condition_level = []

function Normal_Exit(){
    if use_dd5!=0{
        return exit = 0x01 && prev(exit) == 0x00
    }
    return goal == 0xff && prev(goal)==0x00
}

function Key_Exit(){
    if use_dd5!=0{
        return exit == 0x02 && prev(exit) == 0x00
    }
    return key == 0x30 && prev(key)==0x00
}
//key activation: 0x00 -> 0x30
function Level_Cheevos(item, fn, ach_type = ""){
    achievement(
        title = item[0],
        description = item[1],
        points = item[2],
        type = ach_type,
        trigger = prev(game_state) == 0x14 && level_image == item[3] && fn()
    )
}

//prev(game_state) is used because 0x00000100 and 0x00000dd5 change on the same frame

for item in level_cheevos{
    Level_Cheevos(item, Normal_Exit)
}
for item in level_prog_cheevos{
    Level_Cheevos(item, Normal_Exit, "progression")
}
for item in secret_level_cheevos{
    Level_Cheevos(item, Key_Exit)
}
for item in secret_prog_cheevos{
    Level_Cheevos(item, Key_Exit, "progression")
}

if length(win_condition_level) == 4{
    Level_Cheevos(item, Normal_Exit)
}

achievement(
    title = "Frigid Ghost House", 
    description = "Find the secret exit in Mount Blanc Ghost House", 
    points = 5, 
    trigger = level_image == 0x3b && exit == 0x02 && prev(exit)==0x00
)

achievement(
    title="Maou Koopa's RNG Castle",
    description="Reach the checkpoint in Maou Koopa's Castle",
    type = "win_condition",
    points = 25,
    trigger = game_state == 0x14 && level_image == 0x31 && MidwayCollected()
    
)

achievement(
    title="Maou Koopa's Demise",
    description="Complete the boss battle in Maou Koopa's Castle and complete the game!",
    type = "win_condition",
    points=25,
    trigger = game_state == 0x14 && level_image == 0x31 && room_image == 0x13e && end_of_game_timer != prev(end_of_game_timer)
)


achievement(
    title = "Where Is This Secret Exit?",
    description = "Find at least five unique ways to exit Abyssal Ghost House",
    points = 10,
    trigger = measured(tally(5, once(room_image == 0x83 && exit == 1 && prev(exit) ==0x00),
                                once(room_image == 0x89 && exit ==0 && game_state == 0x0b && prev(game_state) == 0x14),
                                once(room_image == 0x8b && exit ==0 && game_state == 0x0b && prev(game_state) == 0x14),
                                once(room_image == 0x85 && exit == 1 && prev(exit) ==0x00),
                                once(room_image == 0x8f && exit == 1 && prev(exit) ==0x00),
                                once(room_image == 0x87 && exit == 1 && prev(exit) ==0x00),
                                once(room_image == 0xDF && exit == 1 && prev(exit) == 0x00 && level_image == 0x4d),
                                once(room_image == 0x90 && exit == 2 && prev(exit) ==0x00)
                            )
                      )
)
// * * * * * * * * * * * * * * * * * * * * Moons * * * * * * * * * * * * * * * * * * * *


// SINGLE MOON ACHIEVEMENTS
//TODO: Fill this array in with: Title, Description, Points, level_image with moon
// That is ALL you need to do to make this code block work!
// If Title / Description fiels are empty (""), a default title or description will be used
Moon_Info = [
    ["Worth the Detour", "Collect the hidden moon in Senbei Detour", 3, 0x15], //Senbei Detour
    ["Guards of the Treasure", "Collect the moon in Konpeitou Secret 2 and enter the pipe without dying", 5, 0x1D], //Konpeitou Secret 3
    
    ["Larry's Moon", "Collect the hidden moon in #1 Larry's Castle", 5, 0x25], // #1 Larry's Castle
    ["Shell Jump?", "Collect the moon by the secret exit on Konpeitou Pipelines 3", 5, 0x17], //Konpeitou Pipelines 3
    ["Grand Theft Cloud", "Collect the moon by the secret exit of Nori Highland 1", 2, 0x06], // Nori Highland 1
    ["Lemmy's Treasure", "Collect the moon in #3 Lemmy's Castle without dying", 5, 0x40], // #3 Lemmy's Castle
    //["", "", 1, 0x4d], // Abyssal Ghost House maybe gonna be cut in favor of a better achievement
    ["Midway Moon", "Collect the hidden moon in Senbei Strata 3", 2, 0x2b],// Senbei Strata 3
    ["Have You Checked Under the Goal Tape?", "Find the hidden moon in Phatasm Forest 3", 10, 0x3d], //Phantasm Forest 3
    ["What Cape Does Best", "Collect the hidden moon in Curry Ghost House", 2, 0x4a], // Curry Ghost House
    ["Big Mario Reward", "Collect the moon in Grandmaster Course", 10, 0x5f] // Grandmaster Course
]

//Add level images and a function here where you want to stipulate some custom logic.
//It will turn the normal logic into an AndNext chain with 1 hit, which should work for most cases.
//I have not yet figured out how to supply the custom function with the level information. 

//unfinished
function LemmyCastle(){
    return pos_x >= 0x55f  && never(game_state!=0x14)
}

function KS2() => prev(room_image)==0x1d && room_image==0x6d && never(game_state<0x0f) // died and returned to overworld
    

custom_moon_logic = {
    0x40: LemmyCastle(),
    0x1D: KS2()
}

function NormalMoonLogic(i) => game_state == 0x14 && moon_bit[i][0]==0x01 && prev(moon_bit[i][0] == 0x00)

function MoonLogic(i){
    if dictionary_contains_key(custom_moon_logic, Moon_Info[i][3]){
        return once(NormalMoonLogic(i)) && custom_moon_logic[Moon_Info[i][3]]
    }
    return NormalMoonLogic(i)
}

moon_bit = []


for key in Moon_Info{
    array_push(moon_bit, [bit(7-(key[3])%8,0x1fee+key[3]/8), level_images[key[3]], key[3]])
}


len_moon = length(Moon_Info)

default_moon_title = "Moon Collecting: "
default_moon_desc = "Collect the moon in "

function Moon_Title(i){
    if Moon_Info[i][0] == ""
        return (default_moon_title + level_images[Moon_Info[i][3]])
    else return Moon_Info[i][0]
} 
function Moon_Desc(i){
    if Moon_Info[i][1] == ""
        return (default_moon_desc + level_images[Moon_Info[i][3]])
    else return Moon_Info[i][1]
}
for i in range (0, len_moon-1){
    achievement(
        title = Moon_Title(i),
        description = Moon_Desc(i),
        points=Moon_Info[i][2],
        trigger = MoonLogic(i)
    )
}

// Additional achievments that don't work with the above logic
achievement(
    title = "Precision Coin Snake",
    description = "Collect the moon in the Green Switch palace (Switch palaces cannot be re-entered)",
    type = "missable",
    points = 10,
    trigger = bit(7-(0x46)%8,0x1fee+0x46/8)==0x01 && prev(bit(7-(0x46)%8,0x1fee+0x46/8))==0x00 && game_state == 0x14
)

achievement(
    title = "Colored Switch Blocks Are Outdated",
    description = "Collect the moon in Native Ztar 4",
    type = "missable",
    points = 10,
    trigger = bit(7-(0x59)%8,0x1fee+0x59/8)==0x01 && prev(bit(7-(0x59)%8,0x1fee+0x59/8))==0x00 && game_state == 0x14
)

achievement(
    title = "Thanks, Bowser!",
    description = "Collect the moon in Maou Koopa Ca- oh...",
    points = 1,
    trigger = room_image == 0x1c2 && byte(0x169b)==0x03 && prev(byte(0x169b))==0x03
)

achievement(
    title = "Precision Duck Hopping", 
    description = "Collect the moon in Abysall Hollow 3 without being small while the p-switch is active", 
    points = 10,
    trigger = bit(7-(0x08)%8,0x1fee+0x08/8)==0x01 && prev(bit(7-(0x08)%8,0x1fee+0x08/8))==0x00 && once(room_image == 0x08) && never(powerup==0x00 && p_switch != 0x00) && game_state == 0x14
)

Moon_Locations = [0x15, 0x1D, 0x08, 0x25, 0x17, 0x06, 0x40, 0x4d, 0x2b, 0x3d, 0x46, 0x4a, 0x59, 0x5f, 0x31]


// * * * * * * * * * * * * * * * * * * * * Yoshi Coins * * * * * * * * * * * * * * * * * * * *

//Fill this in with how you want to partition Yoshi Coins achievements
//Put coin amounts that are not = 5 in Problem_Coins array
Yoshi_Coins = {
    1: [["Refuge Yoshi Coins", "Collect all Yoshi Coins in Yoshi's Refuge", 5], [0x05, 0x23, 0x5b, 0x3c]],
    2: [["Yakisaba Yoshi Coins", "Collect all Yoshi Coins in the Yakisaba/Taiyaki area", 10], 
        [0x2a, 0x53, 0x19, 0x11, 0x12, 0x37, 0x0b, 0x01]],
    3: [["Yakisoba Yoshi Coins", "Collect all Yoshi Coins in the Yakisoba/Nori area", 10], [0x0e, 0x38, 0x24, 0x04, 0x0C, 0x06, 0x56, 0x0A, 0x30]],
    4: [["Cavern Yoshi Coins", "Collect all Yoshi Coins in Curry Cavern and Refuge Secrets", 10], [0x1E, 0x52, 0x09, 0x2D, 0x27, 0x18]],
    5: [["Phantasm Forest Yoshi Coins", "Collect all Yoshi Coins in Phantasm Forst", 25], [0x29, 0x3d, 0x16, 0x1a, 0x43]],
    6: [["Senbei Strata Yoshi Coins", "Collect all Yoshi Coins in Senbei Strata", 10], [0x03, 0x3a, 0x15, 0x2b, 0x26, 0x4c]],
    7: [["Konpeitou Yoshi Coins I", "Collect all Yoshi Coins in Phantasm Forest Encore, Konpeitou Pipelines 1-3, and Mint Cave Area", 10], [0x42, 0x22, 0x2f, 0x14, 0x17]],
    8: [["Konpeitou Yoshi Coins II", "Collect all Yoshi Coins in Konpeitou Secret 1-2, Konpeitou Pipelines 3, and Salt Mines", 25], [0x39, 0x1d, 0x44, 0x33]],
    9: [["Mount Blanc Yoshi Coins", "Collect all Yoshi Coins in Mount Blanc", 25], [0x1c, 0x10, 0x2e, 0x02]],
    10: [["Abyssal Hollow Yoshi Coins", "Collect all Yoshi Coins in Abyssal Hollow", 25], [0x2c, 0x5a, 0x08]],
    11: [["Special World Yoshi Coins I", "Collect all Yoshi Coins in Pleasure Course, Specialists' Course, and Stress Course", 25], [0x49, 0x51, 0x4f]],
    12: [["Special World Yoshi Coins II", "Collect all Yoshi Coins in Pressure Course, Even the SMWG Staff Is Irritated Course, and Grandmaster Course", 25],[0x36, 0x4b, 0x5f]]
}

Problem_Coins_Dict = {0x01: 4, 0x56: 4, 0x16: 4, 0x4c: 3, 0x17: 4, 0x39: 4, 0x51: 4}

function Has_Collected_YC(lvl_img){
    if dictionary_contains_key(Problem_Coins_Dict, lvl_img)
        return once(current_yc == Problem_Coins_Dict[lvl_img] && prev(current_yc) == Problem_Coins_Dict[lvl_img]-1 && level_image == lvl_img) 
    return once(bit(7-(lvl_img)%8, 0x1f2f+lvl_img/8) == 1 && prev(bit(7-(lvl_img)%8, 0x1f2f+lvl_img/8)) == 0)
}
function Has_Collected_YC_Delta(lvl_img){
    if dictionary_contains_key(Problem_Coins_Dict, lvl_img)
        return once(prev(current_yc == Problem_Coins_Dict[lvl_img]-1))
    return once(prev(bit(7-(lvl_img)%8, 0x1f2f+lvl_img/8) == 1))
}
function Other_YC(item){
    for key in item{
        return once(item[key]==current_yc)
    }
}
for key in Yoshi_Coins{
    yc_needed = length(Yoshi_Coins[key][1])
    achievement(
        title = Yoshi_Coins[key][0][0],
        description = Yoshi_Coins[key][0][1],
        points = Yoshi_Coins[key][0][2],
        trigger = measured(
            tally_of(Yoshi_Coins[key][1], yc_needed, Has_Collected_YC) 
        ) && never(game_state < 0x0b)
    )
}

// * * * * * * * * * * * * * * * * * * * * Extra * * * * * * * * * * * * * * * * * * * *

//exits

achievement(
    title="Full Gaiden",
    description="Complete all 124 exits of SMW: Gaiden",
    points=50,
    trigger = game_state == 0x0e && exits == 0x7c && prev(exits) == 0x7b
)

//messages 
//title, desc, level img, msg id
msg_box = [
    ["Wise Words", "Read the message box in Senbei Detour", 0x15, -1],
    ["A Cryptic Clue I", "Find a clue in Abyssal Ghost House about the secret exit", 0x4d, 2],
    
    ["A Cryptic Clue III", "Find a hint in Taiyaki Trench Area", 0x19, -1],
    ["A Cryptic Clue IV", "Find a hint in Konpeitou Secret 1", 0x39, -1],
    ["A Cryptic Clue V", "Find a hint in Native Ztar 3", 0x55, -1]
]

for item in msg_box{
    achievement(
        title = item[0],
        description = item[1],
        points = 3,
        trigger = game_state == 0x14 && level_image == item[2] && MessageBoxHit(item[3]) && !prev(MessageBoxHit(item[3]))
    )
}

achievement(
    title="A Cryptic Clue II", 
    description="Find a hint in Yoshi's Shelter by hitting the message block while riding Yoshi", 
    points = 3,
    trigger = game_state == 0x14 && level_image == 0x28 && MessageBoxHit(-1) && !prev(MessageBoxHit(-1))
)

//speedruns
achievement(
    title = "Green Berry Feast",
    description = "In Phantasm Forest Interlude 1, finish with more time than you started with while not entering any subareas",
    points = 5,
    trigger = disable_when(game_state==0x14 && room_image!=0x12, game_state == 0x0e) && game_state == 0x14 && trigger_when(timer > 300 && goal > prev(goal)) && unless(StartedFromCheckpoint())
    
)

function SmallMarioSpeedrun(time, level){
    return game_state == 0x14 && level_image == level && trigger_when(timer > time && goal > prev(goal)) && unless(StartedFromCheckpoint()) && never(powerup!=0) && never(on_yoshi==0x01) && once(game_state==0x0e)
    
}

//level image, points, time
timer_arr = {
   1: [0x2d, 10, 230],
   2: [0x26, 25, 300],
   3: [0x02, 25, 220]
}
for key in timer_arr{
    achievement(
        title = "Small Mario Speedrun " + key,
        description = "As small Mario, finish with more than " + timer_arr[key][2] + " left on the clock in " + level_images[timer_arr[key][0]],
        points = timer_arr[key][1],
        trigger = SmallMarioSpeedrun(timer_arr[key][2], timer_arr[key][0])
    )
}

//combos
//title, description, points, level image, combo
combo_arr = [
    ["Best Life Farm Spot", "In Yakisoba Lowland 3, earn 35 1-ups from a single star combo", 5, 0x0c, 42],
    
]

achievement(
    title = "Best Life Farm Spot",
    description = "In Yakisoba Lowland 3, earn 35 1-ups from a single star combo",
    points = 5,
    trigger = level_image == 0x0c && tally(35, lives > prev(lives), deduct(coins<prev(coins)), deduct(current_yc==5 && prev(current_yc)==4)) && never(byte(0x18D2) < 8)
)

achievement (
    title = "Parachute Goomba Pogoing", 
    description = "Get a three 1-up combo in Mount Blanc 1 without using the cape", 
    points = 5, 
    trigger = game_state == 0x14 && level_image == 0x1c && combo == 10 && prev(combo)==9 && once(combo == 0) && never(powerup==0x02)
)
function PhGhostHouse(i) => measured(
                    tally(i, 
                        once(p_switch!=0x00),
                        once(on_yoshi==1),
                        once(room_image == 0x1e7 && tally(15, p_switch!=0x00) && held_item == 1)
                    )
) && DelPhGhostHouse(i-1)

function DelPhGhostHouse(i) => tally(i,
                        once(prev(p_switch)!=0x00),
                        once(prev(on_yoshi)==1),
                        once(prev(room_image )== 0x1e7 && tally(15, prev(p_switch)!=0x00) && prev(held_item) == 1)
)
achievement(
    title ="Ghost House Explorer",
    description = "In Phantasm Ghost House, use a P-Switch, ride a Yoshi, and hold a key in one visit",
    points = 3,
    trigger = never(game_state == 0x0e) && never(level_image!=0x41) && PhGhostHouse(3) && unless(room_image == 0x11d)
)


morton_castle = bit0(0x1f05)
achievement(
    title = "Low Exit Route",
    description = "Make a path to World 8 without having completed #2 Morton's Castle or activating any colored switches (and maybe pick up the moon in Native Ztar 4 while you're at it!)",
    points = 25,
    trigger = once(game_state ==0x0e) && never(morton_castle==1) && 
        never(green_switch == 0x01 || yellow_switch == 0x01 || red_switch == 0x01 || blue_switch == 0x01) &&
        trigger_when((overworld_mario==0x06&&prev(overworld_mario)==0x02) || (overworld_luigi==0x06&&prev(overworld_luigi)==0x02))
)


achievement(
    title = "Sliding as Intended",
    description = "Complete the room leading to the secret exit in Mount Blanc 2 without riding a Yoshi or using a cape",
    points = 5,
    trigger = once(room_image == 0x10) && never(powerup==0x02) && never(on_yoshi!=0) && Key_Exit()
)

sprite_dark_room = byte(0x341)
achievement(
    title = "The Secret of the Dark Room",
    description = "Find a secret in the dark room of Phantasm Outskirts",
    points = 5,
    trigger = room_image == 0x2c && tally(20, sprite_dark_room != 0xc0 && once(sprite_dark_room == 0xc0)) && 
            tally(19, prev(sprite_dark_room) != 0xc0 && once(prev(sprite_dark_room) == 0xc0)) &&never(room_image!=0x2c)
)

achievement(
    title = "Ztar World", 
    description = "Complete every exit in the Ztar World",
    points = 10,
    trigger = bit1(0x1f0e) + bit0(0x1f0e) + bit7(0x1f0f) + bit6(0x1f0f) + bit5(0x1f0f) + bit4(0x1f0f) + bit3(0x1f0f) + bit2(0x1f0f) + bit1(0x1f0f) + bit0(0x1f0f) == 10 &&
            prev(bit1(0x1f0e)) + prev(bit0(0x1f0e)) + prev(bit7(0x1f0f)) + prev(bit6(0x1f0f)) + prev(bit5(0x1f0f)) + 
            prev(bit4(0x1f0f)) + prev(bit3(0x1f0f)) + prev(bit2(0x1f0f)) + prev(bit1(0x1f0f)) + prev(bit0(0x1f0f)) == 9 && game_state == 0x0e
)

achievement(
    title = "Pick a Pipe",
    description = "Complete the pipe maze atop Mount Blanc",
    points = 3,
    trigger = room_image == 0x1DA && ((overworld_mario == 0x06 && prev(overworld_mario) == 0x00) || (overworld_luigi == 0x06 && prev(overworld_luigi) == 0x00))
)

ow_pos_x_mario = word(0x1f17)
ow_pos_y_mario = word(0x1f19)

ow_pos_x_luigi = word(0x1f1b)
ow_pos_y_luigi = word(0x1f1d)

//sorry luigi enjoyers
hand_chest_timer = byte(0x14a8)
achievement(
    title = "Gotta Hand It to Ya",
    description = "Beat the three hand levels in Abyssal Hollow",
    points = 10,
    trigger = prev(game_state) == 0x14  && game_state != 0x14 && once(overworld_mario == 0x06 && ow_pos_x_mario == 0x0198 && ow_pos_y_mario == 0x01a8 && hand_chest_timer != 0 ) && never(game_state == 0x0e)
)

switches = [
    ["Yellow Switch", "Turn on the yellow ! blocks", 0x45],
    ["Blue Switch", "Turn on the blue ! bloks", 0x48],
    ["Red Switch", "Turn on the red ! blocks", 0x47],
    ["Green Switch", "Turn on the green ! blocks", 0x46]
]

for item in switches{
    achievement(
        title = item[0],
        description = item[1],
        points = 5,
        trigger = level_image == item[2] && pressed_big_switch > prev(pressed_big_switch)
    )
}


// * * * * * * * * * * * * * * * * * * * * Leaderboards * * * * * * * * * * * * * * * * * * * *

function SmallMarioLB(level){
    return game_state == 0x14 && level_image == level && goal > prev(goal) && unless(StartedFromCheckpoint()) && never(powerup!=0) && once(game_state==0x0e)
    
}
for key in timer_arr{
    leaderboard(
        title = "Small Mario Speedrun " + key,
        description = "Finish " + level_images[timer_arr[key][0]] + " as fast as possible as Small Mario",
        start = SmallMarioLB(timer_arr[key][0]),
        cancel = always_false(),
        submit = always_true(),
        value = timer
        
    )
}

/*
achievement(
    title = "Green Berry Feast",
    description = "In Phantasm Forest Interlude 1, finish with more time than you started with while not entering any subareas",
    points = 5,
    trigger = disable_when(game_state==0x14 && room_image!=0x12, game_state == 0x0e) && game_state == 0x14 && trigger_when(timer > 300 && goal > prev(goal)) && unless(StartedFromCheckpoint())
    
)
*/
leaderboard(
    title = "Green Berry Feast",
    description = "Complete Phantasm Forest Interlude 1 with the most time left on the timer",
    start = disable_when(game_state==0x14 && room_image!=0x12, game_state == 0x0e) && game_state == 0x14 && goal > prev(goal) && unless(StartedFromCheckpoint()),
    cancel = always_false(),
    submit = always_true(),
    value = timer
)

leaderboard(
    title = "Maximum Life Farming",
    description = "In Yakisoba Lowland 3, get as many 1-ups as you can from a continuous star combo",
    start = level_image == 0x0c && byte(0x18D2)==8,
    cancel = always_false(),
    submit = exit!=0 || star == 0,
    value = measured(tally(0,lives>prev(lives), deduct(coins<prev(coins)), deduct(current_yc==5 && prev(current_yc)==4)))
)

leaderboard(
    title = "Parachute Goomba Pogoing",
    description = "In Mount Blanc 1, get as high of a 1-up combo as you can without using the cape powerup",
    start = level_image == 0x1c && prev(combo >= 8) && (combo == 0 || exit != 0),
    cancel = always_false(),
    submit = always_true(),
    value = prev(combo)-7
)

leaderboard(
    title = "Low Death Special World",
    description = "Complete every level in the special world in the least amount of deaths (start/select in any level counts as death)",
    start = game_state == 0x14 && (level_image == 0x36 || level_image == 0x49 || level_image == 0x4b || level_image == 0x4f || level_image == 0x50 || level_image == 0x51 || level_image == 0x5f),
    cancel = always_false(),
    submit = once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x36) &&
                once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x49) &&
                once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x4b) &&
                once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x4f) &&
                once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x50) &&
                once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x51) &&
                once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x5f) &&
            never(    once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x36) &&
                once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x49) &&
                once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x4b) &&
                once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x4f) &&
                once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x50) &&
                once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x51) &&
                once(exit == 0x01 && prev(exit) == 0x00 && level_image == 0x5f)&&
                game_state == 0x0e),
                
                
                
    value = tally(0, prev(exit) == 0x00 && exit == 0x80),
    lower_is_better = true
)

/*

combo_arr = [
    ["Best Life Farm Spot", "In Yakisoba Lowland 3, earn 35 1-ups from a single star combo", 5, 0x0c, 42],
    
]

achievement(
    title = "Best Life Farm Spot",
    description = "In Yakisoba Lowland 3, earn 35 1-ups from a single star combo",
    points = 5,
    trigger = level_image == 0x0c && tally(35, lives > prev(lives), deduct(coins<prev(coins)), deduct(current_yc==5 && prev(current_yc)==4)) && never(byte(0x18D2) < 8)
)

achievement (
    title = "Parachute Goomba Pogoing", 
    description = "Get a three 1-up combo in Mount Blanc 1 without using the cape", 
    points = 5, 
    trigger = game_state == 0x14 && level_image == 0x1c && combo == 10 && prev(combo)==9 && once(combo == 0) && never(powerup==0x02)
)
*/

// * * * * * * * * * * * * * * * * * * * * Rich Presence * * * * * * * * * * * * * * * * * * * *
SWLookup = {
    0x00: "□",
    0x01: "▣",
}
rich_presence_display(
    "Mario is in {0} with {1} lives and {2}/124 exits [🟡 {3}] [🔴 {4}] [🟢 {5}] [🔵 {6}]",
    rich_presence_lookup("lvl", level_image, level_images),
    rich_presence_value("lives", lives),
    rich_presence_value("exits", exits),
    rich_presence_lookup("switch", byte(0x1f28), SWLookup),
    rich_presence_lookup("switch", byte(0x1f27), SWLookup),
    rich_presence_lookup("switch", byte(0x1f2a), SWLookup),
    rich_presence_lookup("switch", byte(0x1f29), SWLookup)
    
)





//TODO: 
// Fix Thanks Bowser
