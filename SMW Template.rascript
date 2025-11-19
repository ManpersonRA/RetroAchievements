// SMW TEMPLATE


//First, the two most important things in an SMW Hack. Level Identifier and Room Identifier

//Level Identifier
//How to find corresponding starting room identifier: 
    //If <= 0x24, room=level
    //Otherwise, add 0xDC
level_image = byte(0x13bf)
level_images = {
    0x01: "Example Level Name",
    0x02: "Example Two",
    0x03: "",
    0x04: "",
    0x05: "",
    0x06: "",
    0x07: "",
    0x08: "",
    0x09: "",
    0x0a: "",
    0x0b: "",
    0x0c: "",
    0x0d: "",
    0x0e: "",
    0x0f: "",
    0x10: "",
    0x11: "",
    0x12: "",
    0x13: "",
    0x14: "",
    0x15: "",
    0x16: "",
    0x17: "",
    0x18: "",
    0x19: "",
    0x1a: "",
    0x1b: "",
    0x1c: "",
    0x1d: "",
    0x1e: "",
    0x1f: "",
    0x20: "",
    0x21: "",
    0x22: "",
    0x23: "",
    0x24: "",
    0x25: "", //101
    0x26: "", //102
    0x27: "", //103
    0x28: "", //104
    0x29: "", //105
    0x2a: "", //106
    0x2b: "", //107
    0x2c: "", //108
    0x2d: "", //109
    0x2e: "", //10a
    0x2f: "", //10b
    0x30: "", //10c
    0x31: "", //10d
    0x32: "", //10e
    0x33: "", //10f
    0x34: "", //110
    0x35: "", //111
    0x36: "", //112
    0x37: "", //113
    0x38: "", //114
    0x39: "", //115
    0x3a: "", //116
    0x3b: "", //117
    0x3c: "", //118
    0x3d: "", //119
    0x3e: "", //11a
    0x3f: "", //11b
    0x40: "", //11c
    0x41: "", //11d
    0x42: "", //11e
    0x43: "", //11f
    0x44: "", //120
    0x45: "", //121
    0x46: "", //122
    0x47: "", //123
    0x48: "", //124
    0x49: "", //125
    0x4a: "", //126
    0x4b: "", //127
    0x4c: "", //128
    0x4d: "", //129
    0x4e: "", //12a
    0x4f: "", //12b
    0x50: "", //12c
    0x51: "", //12d
    0x52: "", //12e
    0x53: "", //12f
    0x54: "", //130
    0x55: "", //131
    0x56: "", //132
    0x57: "", //133
    0x58: "", //134
    0x59: "", //135
    0x5a: "", //136
    0x5b: "", //137
    0x5c: "", //138
    0x5d: "", //139
    0x5e: "", //13a
    0x5f: "", //13b
}

powerup = byte(0x19) // Players's Powerup status
pos_x = word(0x94) // Players x-position
pos_y = word(0x96) // Player's y-position

game_state = byte(0x100) //0x0e is overworld, 0x0f-0x13 is a transition in a level, 0x14 is playing the game
room_image = word(0x10b) // unique room identifier for each room in the game
coins = byte(0xdbf) // # of coins, max 100 (decimal)
lives = byte(0xdbe) // # of lives, max 99 (decimal)

on_yoshi = byte(0xdc1) // = 0x01
exit = byte(0xdd5) // 0x01 is normal, 0x02 is special exit

timer = byte(0xf31)*100 + byte(0xf32)*10 + byte(0xf33) //time left


score_total  = tbyte(0xf34)+tbyte(0xf37) // Mario and Luigi's score together

midway = byte(0x13ce) // mario has collected a midway point in his current life
function MidwayCollected() => midway==1 && prev(midway)==0
start_midway = byte(0x13cf) //mario has respawned from a midway
function StartedFromCheckpoint() => start_midway == 0x40

pressed_big_switch = byte(0x13d2) //0x01 briefly, then changes to 1, 2, 3, or 4 depending on the color pressed
current_yc = byte(0x1420) // # yoshi coins you have

// brief: checks if a message box has been hit.
// Each level has 2 message box IDs, 1 and 2 I believe.
// If you care which one gets hit, pass in the num.
// If you don't care which one gets hit, you don't need to pass in anything.
message_box = byte(0x1426)
function MessageBoxHit(num=-1){
    if num == -1
        return message_box > 0
    return message_box == num
}

key = byte(0x1434) //timer that counts fown from 0x30 when you get a key exit
held_item = byte(0x148f) //0x01 if mario is holding an item
star = byte(0x1490) //star timer, counts down from 0xff
goal = byte(0x1493) //timer that counts down from 0xff when you finish level
p_switch = byte(0x14ad) //timer that counts down from (normally) 0xff

overworld_mario = byte(0x1f11) //overworld map
overworld_luigi = byte(0x1f12) //overworld map

//switces presses
green_switch = byte(0x1f27)
yellow_switch = byte(0x1f28)
blue_switch = byte(0x1f29)
red_switch = byte(0x1f2a)
exits = byte(0x1f2e)


combo = byte(0x1697) // consecutive enemies mario has stepped on / hit with star power


function Paused() => byte(0x13d4) ==  0x01
// Additional hack specific goes here

// * * * * * * * * * * * * * * * * * * * * Progression * * * * * * * * * * * * * * * * * * * *


/* IMPORTANT NOTE
    If a level has more than one goal tape exit, you can do one of two things:
    1. Implement the logic yourself using 0x00000dd5
    2. Turn on this flag to make *all* achievemtsn rely on 0x00000dd5 for the trigger
*/

use_dd5 = 0
//Put all non-progression normal exits in this array [level-images] Any of these arrays can be empty
//Format: [[Title, Description, Points, Level_Image], [...]]
level_cheevos = []
//Put all progression normal exits in this array
level_prog_cheevos = []
//Put all non-progression key exits in this array
secret_level_cheevos = []
//Put all progression key exits in this array
secret_prog_cheevos = []
//The win condition may need custom logic depending on the boss. If it is exit-based, put it here
//This one does not have double brackets
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
        trigger = game_state == 0x14 && level_image == item[3] && fn()
    )
}

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
    Level_Cheevos(item, Normal_Exit, "win_condition")
}

// put additional level completion based achievements here




// * * * * * * * * * * * * * * * * * * * * Moons * * * * * * * * * * * * * * * * * * * *


//THIS IS IN A VERY BROKEN STATE IRGHT NOW. NEED TO CHANGE EVERYTHING TO "MOON" AND ALSO
// MAKE THE LOGIC NICER. CURRENTLY WORKING ON MAKING FUNCTION FOR RETURNING THE BIT VALUE


// -- SINGLE MOON ACHIEVEMENTS --
// TODO: Fill this array in with: Title, Description, Points, level_image with moon
// That is ALL you need to do to make this code block work!
// If Title / Description fiels are empty (""), a default title or description will be used (see default_moon_title)
Moon = [
    ["Example Single Moon Achievement", "Example Desc: Collect the Moon in level with id 0x01", 0, 0x01],
    ["", "", 0, 0x02]
]

// -- MULTI MOON ACHIEVEMENTS --
// Same as before, all you have to do is fill in this array, but this time, with this format:
// <key>: [["<title>", "<description>", <points>], [<list of level IDs>]]
// Example is below
// NOTE: if you don't want any single moon or multi moon achievements, you can just leave the variable blank.
Moons = {
    1: [["Example Multi Moon Achievement", "Collect the moons from these levels", 10], [0x01, 0x02, 0x28, 0x35]]
}

//for if you want a standardized moon title/description name
//if your Moon_Info is blank, it will use these
//only for single moon achievements
default_moon_title = "Moon Title: "
default_moon_desc = "Moon Desc: "

//If you need a custom function to handle moon logic, put it here.
//Multi-moon achievements are unaffected by this functions since I doubt you would ever need it
//format <level_id>: <function_name>
// 0x40: dont_die_until_finishing_level()
custom_moon_logic = {}


//You don't need to edit anything below this line
function NormalMoonLogic(i) => game_state == 0x14 && Has_Collected_Moon(Moon[i][3])

function MoonLogic(i){
    if dictionary_contains_key(custom_moon_logic, Moon[i][3]){
        return once(NormalMoonLogic(i)) && custom_moon_logic[Moon_Info[i][3]]
    }
    return NormalMoonLogic(i)
}

function Moon_Bit(img) => bit(7-(img)%8,0x1fee+img/8)




len_moon = length(Moon)



function Moon_Title(i){
    if Moon[i][0]==""
        return (default_moon_title + level_images[Moon[i][3]])
    else return Moon[i][0]
} 
function Moon_Desc(i){
    if Moon[i][1] == ""
        return (default_moon_desc + level_images[Moon[i][3]])
    else return Moon[i][1]
}


function Has_Collected_Moon(lvl_img){
    return once(Moon_Bit(lvl_img) > prev(Moon_Bit(lvl_img)))
}


//generate singular moon achievement
for i in range (0, len_moon-1){
    achievement(
        title = Moon_Title(i),
        description = Moon_Desc(i),
        points=Moon[i][2],
        trigger = MoonLogic(i)
    )
}

//generate multiple moon achievments
for key in Moons{
    moons_needed = length(Moons[key][1])
    achievement(
        title = Moons[key][0][0],
        description = Moons[key][0][1],
        points = Moons[key][0][2],
        trigger = measured(
            tally_of(Moons[key][1], moons_needed, Has_Collected_Moon)
        ) && never(game_state < 0x0b)
    )
}
    

// Additional achievments that need additional coding (e.g. a missable flag) go here



// * * * * * * * * * * * * * * * * * * * * Yoshi Coins * * * * * * * * * * * * * * * * * * * *

// -- Single-Yoshi-Coin achievements --
//  For achievements that require collecting one set of yoshi coins from a specific level
//Fill this in with the exact same format as the Moons example

Yoshi_Coin = [
    ["Example Yoshi Coin Achievement", "Collect the Yoshi coins in level 0x01", 5, 0x01],
    ["", "", 5, 0x02]
]
// -- Multi-Yoshi-Coin achievements --
// For achievements that require collecting multiple sets of yoshi coins
// Fill this in with how you want to partition Yoshi Coins achievements
// Exact same format as Moons example
// Put coin amounts that are not = 5 in Problem_Coins array
Yoshi_Coins = {
    1: [["Example Yoshi Coins", "Collect all Yoshi Coins in the listed level IDs", 5], [0x05, 0x23, 0x5b, 0x3c]],
}

//default titles for SINGLE yoshi coin achievements. NOT multi. Leave the title or description blank to be replaced with a default
//you can change these to whatever you like
default_yoshi_title = "Yoshi Coin Title:  "
default_yoshi_desc = "Moon Desc: "

//Have a level where there are more or less than 5 Yoshi Coins? put them here.
//Format: <lvl_image>: <num_yoshi_coins>, <next entry>
// Example: Problem_Coins_Dict = {0x01: 4, 0x56: 6}
Problem_Coins_Dict = {0x01: 4, 0x56: 4, 0x16: 4, 0x4c: 3, 0x17: 4, 0x39: 4, 0x51: 4}

//you don't need to touch anything down here
function Multi_YC_Logic(lvl_img){
    if dictionary_contains_key(Problem_Coins_Dict, lvl_img)
        return once(current_yc == Problem_Coins_Dict[lvl_img] && prev(current_yc) == Problem_Coins_Dict[lvl_img]-1 && level_image == lvl_img) 
    return once(YC_byte(lvl_img) > prev(YC_byte(lvl_img)))
}

function Single_YC_Logic(lvl_img){
    if dictionary_contains_key(Problem_Coins_Dict, lvl_img)
        return current_yc == Problem_Coins_Dict[lvl_img] && prev(current_yc) == Problem_Coins_Dict[lvl_img]-1
    return YC_byte(lvl_img) > prev(YC_byte(lvl_img))
}

function YC_byte(lvl_img) => bit(7-(lvl_img)%8, 0x1f2f+lvl_img/8)

function Yoshi_Title(i){
    if Yoshi_Coin[i][0] == ""
        return (default_yoshi_title + level_images[Yoshi_Coin[i][3]])
    else return Yoshi_Coin[i][0]
} 
function Yoshi_Desc(i){
    if Yoshi_Coin[i][1] == ""
        return (default_yoshi_desc + level_images[Yoshi_Coin[i][3]])
    else return Yoshi_Coin[i][1]
}

for i in range(0, length(Moon)-1){
    achievement(
        title = Yoshi_Title(i),
        description = Yoshi_Desc(i),
        points = Yoshi_Coin[i][2],
        trigger = game_state == 0x14 && Single_YC_Logic(Yoshi_Coin[i][3])
    )
    
}

for key in Yoshi_Coins{
    yc_needed = length(Yoshi_Coins[key][1])
    achievement(
        title = Yoshi_Coins[key][0][0],
        description = Yoshi_Coins[key][0][1],
        points = Yoshi_Coins[key][0][2],
        trigger = measured(
            tally_of(Yoshi_Coins[key][1], yc_needed, Multi_YC_Logic) 
        ) && never(game_state < 0x0b)
    )
}

// If anything doesn't work with the above logic (i.e. missable flag), add it down here. 




// * * * * * * * * * * * * * * * * * * * * Extra * * * * * * * * * * * * * * * * * * * *

// -- EXITS --

//Change the number to the amount of exits you want and you have an achievement made.

achievement(
    title="Exits Example",
    description="Complete all 0x3d exits in the game",
    points=50,
    trigger = game_state == 0x0e && exits == 0x3d && prev(exits) == 0x3c
)
//                                 Change here ^^       one less here ^^


//For the below ones, the only thing you need to edit are the arrays. 

// -- MESSAGE BOXES -- 
// Achievement will unlock upon hitting a block
// Note that switch palace and yoshi's house blocks are treated specially.
//format: [[<title>, <desc>, <points>, <level_image>, <box_id]]
//view note about box_id on the function MessageBoxHit

msg_box = [
    ["Example Message Box", "Read the message box in the following level", 3, 0x15, -1],

]
for item in msg_box{
    achievement(
        title = item[0],
        description = item[1],
        points = item[2],
        trigger = game_state == 0x14 && level_image == item[3] 
        && MessageBoxHit(item[4]) && !prev(MessageBoxHit(item[4]))
    )
}

// -- ENTERING A SPECIFIC ROOM --
// format: [[<title>, <desc>, <points>, <level_image>, <previous_room_image>, <room_image>]]
room_arr = [
    ["Example Room", "Enter this secret room", 5, 0x01, 0x1AA, 0x1AB]
]

for item in room_arr{
    achievement(
        title = item[0],
        description = item[1],
        points = item[2],
        trigger = game_state == 0x0f && level_image == item[3] && 
        prev(room_image==item[4]) && room_image==item[5]
    )
}

// -- GETTING A MIDWAY --
// format: [[<title>, <desc>, <points>, <level_image>]]
midway_arr = [
    ["Example Midway", "Get the midway in level 0x01", 5, 0x01]
]

for item in midway_arr{
    achievement(
        title = item[0],
        description = item[1],
        points = item[2],
        trigger = game_state == 0x0f && level_image == item[3] && 
        MidwayCollected()
    )
}

// -- COMPLETING A LEVEL WITHOUT A MIDWAY --
// Since these achievments may also require additional logic, such as being small, you can pass in a function.
//format: [[<title>, <description>, <points>, <level_image>, <function>]]
//if you don't need any extra logic, pass in always_true()

//example function
function always_small(){
    return once(game_state==0x0e) && never(powerup!=0x00) 
}

no_midway_arr = [
    ["Example Checkpointless", "Complete level 0x01 without respawning from the checkpoint", 5, 0x01, always_true()],
    ["Example Checkpointless 2", "Additional constraint of always being small", 5, 0x01, always_small()]
]


for item in no_midway_arr{
    achievement(
        title = item[0],
        description = item[1],
        points = item[2],
        trigger = exit == 0x01 && prev(exit) == 0x00 && level_image == item[3] && 
        !StartedFromCheckpoint() && item[4]
    )
}


// * * * * * * * * * * * * * * * * * * * * Rich Presence * * * * * * * * * * * * * * * * * * * *

// you may have to change the switch palace colors around

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
