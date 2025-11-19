// ~Hack~ Crash Bandicoot and the Retro Dimension
// #ID = 34882

// SMW TEMPLATE


//First, the two most important things in an SMW Hack. Level Identifier and Room Identifier

//Level Identifier
//How to find corresponding starting room identifier: 
    //If <= 0x24, room=level
    //Otherwise, add 0xDC
level_image = byte(0x13bf)
level_images = {
    0x01: "Tutorial Plains",
    0x02: "Lava Caves",
    0x03: "Sky Crazy",
    0x04: "Dino Might Woods",
    0x05: "Deep in Trouble",
    0x06: "Crash on the Run",
    0x07: "Cortex Strikes Back",
    0x08: "Blue Gem Route",
    0x09: "Crashin Cove",
    0x0a: "Deep Sea Dive",
    0x0b: "Sunset Ship",
    0x0c: "Fish?",
    0x0d: "Stormy Shores",
    0x0e: "Ship Happenings",
    0x0f: "Roo's Oceanic Lab",
    0x10: "Snow Way",
    0x11: "Cold Hard Heights",
    0x12: "Icicle Shaft",
    0x13: "Race in the Cold",
    0x14: "Cooligan Icecapedes",
    0x15: "Another Cold Chase",
    0x16: "Dingo's Icy Plant",
    0x17: "Red Gem Route",
    0x18: "Beehaving Hills",
    0x19: "Drain Beetles",
    0x1a: "Tidal Lakeside",
    0x1b: "Lava Crossing",
    0x1c: "Crate Bridge Summit",
    0x1d: "Midnight Ride",
    0x1e: "Brio's Testing Lab",
    0x1f: "Secret Urchin Lake",
    0x20: "Spikeball Peril",
    0x21: "Night in the Jungle",
    0x22: "The Lost Ruins",
    0x23: "Underground Temple",
    0x24: "Muncher Woods",
    0x25: "Amen Sunset Vista", //101
    0x26: "N.Gineous Lab", //102
    0x27: "Tree Fortress", //103
    0x28: "The Treehouse", //104
    0x29: "City Frenzy", //105
    0x2a: "Sewer Bullies", //106
    0x2b: "Water Jetpack ", //107
    0x2c: "Night in the Street", //108
    0x2d: "Sewer Countdown", //109
    0x2e: "Nina's Great Tower", //10a
    0x2f: "Smokey Town", //10b
    0x30: "Moon Gravity", //10c
    0x31: "Tiny's Elec Station", //10d
    0x32: "Space Looping", //10e
    0x33: "Out of Light", //10f
    0x34: "Uka's Space Base", //110
    0x35: "Haunted Beach House", //111
    0x36: "Frozen Manor", //112
    0x37: "Spooky Warehouse", //113
    0x38: "One Box Missing", //114
    0x39: "Down the Machinery", //115
    0x3a: "Dark Compactors", //116
    0x3b: "Green Gem Route", //117
    0x3c: "Yellow Gem Route", //118
    0x3d: "Sunset Times Lifts", //119
    0x3e: "Flooded Grotto", //11a
    0x3f: "Frozen Glade", //11b
    0x40: "Into the Vortex", //11c
    0x41: "The Wrath of Cortex", //11d
    0x42: "Electron Planet", //11e
    0x43: "Color Gem Gauntlet", //11f
    0x44: "?", //120
    0x45: "?", //121
    0x46: "?", //122
    0x47: "?", //123
    0x48: "?", //124
    0x49: "?", //125
    0x4a: "?", //126
    0x4b: "?", //127
    0x4c: "?", //128
    0x4d: "Mount Shadows", //129
    0x4e: "Secret Night Ruins", //12a
    0x4f: "Water Jetpack", //12b
    0x50: "Secret Icecapades", //12c
    0x51: "Race in the Clouds", //12d
    0x52: "Ropes to Ruin", //12e
    0x53: "Bramble Trouble", //12f
    0x54: "Road to Somewhere", //130
    0x55: "Rooftop Pass", //131
    0x56: "Toxic Chase", //132
    0x57: "?", //133
    0x58: "Dimensional Gate", //134
    0x59: "Special Base", //135
    0x5a: "Space Base", //136
    0x5b: "City Treehouse", //137
    0x5c: "Jungle Treehouse", //138
    0x5d: "Mountain Treehouse", //139
    0x5e: "Icy Treehouse", //13a
    0x5f: "Beach Treehouse", //13b
}

powerup = byte(0x19)
pos_x = word(0x94)
pos_y = word(0x96)

game_state = byte(0x100)
room_image = word(0x10b)
coins = byte(0xdbf)
lives = byte(0xdbe)

on_yoshi = byte(0xdc1)
exit = byte(0xdd5)
goal = byte(0x1493)
key = byte(0x1434)

green_sw = byte(0x1f27)
yellow_sw = byte(0x1f28)
blue_sw = byte(0x1f29)
red_sw = byte(0x1f2a)
exits = byte(0x1f2e)

function Checkpoint() => byte(0x13cf) == 0x40
function Paused() => byte(0x13d4) ==  0x01

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

// * * * * * * * * * * * * * * * * * * * * Moons * * * * * * * * * * * * * * * * * * * *


// SINGLE MOON ACHIEVEMENTS
//TODO: Fill this array in with: Title, Description, Points, level_image with moon
// That is ALL you need to do to make this code block work!
// If Title / Description fiels are empty (""), a default title or description will be used
Moon_Info = [
    ["Moon Title 1", "Moon Description 1", 0, 0x01],
    ["", "", 0, 0x02]
]
moons = [[bit0(0x00), "void", 0x00]
]

for key in level_images{
    array_push(moons, [bit(7-(key-1)%8,0x1f2f+key/8), level_images[key], key])
}

Moon_Locations_Dict = {}

for location_id in Moon_Info {
    Moon_Locations_Dict[location_id[3]]=1
}

function Is_Valid_Moon(item) {
    moon_loc = item[2]
    
    
    return dictionary_contains_key(Moon_Locations_Dict, moon_loc)
}


Moons = array_filter(moons, Is_Valid_Moon)

len_moon = length(Moons)

default_moon_title = "Moon Collecting: "
default_moon_desc = "Collect the moon in "

function Moon_Title(i){
    if Moon_Info[i][0] == ""
        return (default_moon_title + Moons[i][1])
    else return Moon_Info[i][0]
} 
function Moon_Desc(i){
    if Moon_Info[i][1] == ""
        return (default_moon_desc + Moons[i][1])
    else return Moon_Info[i][1]
}
for i in range (0, len_moon-1){
    achievement(
        title = Moon_Title(i),
        description = Moon_Desc(i),
        points=Moon_Info[i][2],
        trigger = game_state == 0x14 && Moons[i][0]==0x01 && prev(Moons[i][0] == 0x00)
    )
}


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
