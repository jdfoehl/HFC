VAR has_key = false
VAR has_parchment = false
VAR has_torch = false
VAR tried_catacombs = false
VAR yerma_vanished = false

-> intro

-> setting_out
===setting_out===
#bg:yerma
A HYMN FOR CHRISANTA

"Hurry... heed my words carefully before I die so that my sister may be revived... Recite the Dark Hymn of The Miracle over Chrisanta's grave!  The hymn is written on a parchment hidden deep within the Catacombs of Cvstodia, and must only be read under the light of tonights's blood moon!  Take th- ..." 
Before she can finish, the body of Sister Yerma goes limp in your arms, and the light fades from her eyes.

Her words still echoing in your head, you lay her lifeless body down next to a small stream emenating from the Cathedral ruins nearby.  You glance at the sky; the position of the sun let's you know you don't have much time...

* Make for Cvstodia at once
    -> road_to_Cvsstodia
* Give Yerma a proper burial 
    -> bury_Yerma

===bury_Yerma===
In spite of the waning daylight, your sense of honor compels you to take the time to bury Yerma's body.  With the your bare hands, you manage to dig a shallow grave in the river bank.  As you lift Yerma's lifeless body, you notice around her neck a worn leather strap bearing a small rusted key; you take it.  
    ~ has_key = true
    -> road_to_Cvsstodia

===road_to_Cvsstodia===
#bg:cvstodia
You set out at a brisk walk down to the road to the Cvstodia ruins.
->scan_the_area

===scan_the_area
You scan the bleak landscape:  To the south, a small, overgrown cemetary where awaits the grave of Chrisanta.  To the east, just past the remnants of an embankment to a road long since abandoned, a dirt path leading to the catacomb's entrance.  To the west, you see a crumbled fire pit; a small trail of smoke emenates from within.  Behind you, to the north, the road by which you arrived here.  

+ Go South to the Cemetary
    #bg:cemetary
    ->cemetary
    
+ {has_key} Go East to the Catacombs
    #bg:catacombs_door
    -> catacombs_with_key

+ {not has_key} Go East to the Catacombs
    #bg:catacombs_door
    -> catacombs_without_key
    
+ {not has_torch} Go West to the Firepit
    -> fire_pit
    
+ {not has_key and tried_catacombs} Go North back to Yerma's Body
    #bg:yerma_deceased
    -> back_to_Yerma

===back_to_Yerma===
You recall Yerma's dying words: "Take th-...".  Perhaps she was trying to give you the key to the catacombs.  You retrace your steps back to the ruined Cathedral.  
    ~ yerma_vanished = RANDOM(0,1) == 1
    
    {yerma_vanished:
You are filled with instant regret when you discover Yerma's body has vanished.  A panic comes over you; you begin searching frantically, but it's hopeless.  The night comes and goes.  Dread fills your entire body as the sun breaks over the horizon... and thus you have not only failed, but dishonored the dead thereby invoking a lifelong curse.  
        -> END
- else:
You find Yerma's body still lying by the stream, her face peaceful in death.
    -> bury_Yerma
}
===fire_pit===
You walk up a short slope to the west.  At the top, you find a small rudimentary fire pit with a lone stone slab; a few embers still glow at the center of the pit.  You notice a used torch on the other side of the pit.  Deciding it might be useful, you set the torch alight and head back to the ruins center.  
    ~ has_torch = true
    -> scan_the_area

===cemetary===
You follow a cracked stone walkway to the cemetary.  The gate is rusted over, but creaks open when you push on it.  Chrisanta's grave lies before you.  Without the parchment, there is nothing to do here.
    -> scan_the_area

===catacombs_without_key===
You follow the path to the catacomb's entrance: A black iron door with an ancient symbol etched onto the knob.  You try the door but it is locked.  You turn back toward the center of the ruins.
    ~ tried_catacombs = true
    -> scan_the_area

===catacombs_with_key===
You follow the path to the catacomb's entrance: A black iron door with an ancient symbol etched onto the knob looms.  You try the door but it is locked.  As you turn back toward the ruins, the image of the key you took from Yerma earlier flashes through your mind.  You fish the key from your pocket and notice scratched on it the same symbol from the door!  Nervously, you fit the key into the keyhole and turn it; the door unlocks with a click.  You push the door open and step into a dim room with a hewn stone floor; a staircase descends into darkness.

+ {has_torch} Descend
    -> catacombs_with_torch

+ {not has_torch} Descend
    #bg:darkness_death
    -> catacombs_without_torch

+ Turn back!
    -> scan_the_area

===catacombs_with_torch===
Torch in hand, you descend the step spiral steps down into the catacombs.  The air is damp and cold; a draft sends shudders down your spine.  You make your way to a small chamber filled with a thick haze.  A lone skull lies on it's side in the far corner of the room.  Examining it closer, you notice something lodged in the jawbone - the parchment!  You carefully extract the ancient paper and tuck it into your pocket.  With time running out, you hurry out of the catacombs and rush straight to the graveyard.
    -> pause_at_graveyard

===catacombs_without_torch===
You reach your hand out in front of you as you descend into the blackness of the catacombs.  The stairs spiral down with increasing steepness.  Enveloped in darkness, you stumble, barely catching yourself on the wall.  You compose yourself and push on through the darkness.  You stumble once more, however this time your hands dont find the wall and you fall to the bottom of the central stair shaft... the sound of your bones shattering is the last you hear as you lose consciousness. 
    -> END

===pause_at_graveyard===
#bg:cemetary

You stand before Chrisanta’s grave, heart racing, breath visible in the moonlight.

* Continue...
    -> graveyard_with_parchment

===graveyard_with_parchment=== 
Under the crimson light of the moon, you approach Chrisanta's grave and pull out the parchment. The words of the "Dark Hymn" glow faintly.

+ Recite the Dark Hymn
    #bg:resurrection
    -> receite_the_hymn

+ Take a moment to think this over
    #bg:too_late
    -> think_it_over

===receite_the_hymn===
As you utter the ancient words, your field of vision begins to distort and you hear a shriek that makes your blood cold.  You pass out.  Some time later, you awaken to the sound of Chrisanta praying to the miracle that made possible her resurrection.  And thus your sacred quest was fulfilled.  
-> END

===think_it_over===
You pause for a moment.  Now that the moment is upon you, the thought of raising the dead paralyzes you with fear.  Before you know it, the sun appears over the horizon.  Yerma's warning echoing through your mind, you take a deep breath and pull the parchment from your pocket.  However, the light of the sun causes it to disentegrate,  You swear you hear a soft cry that sounds just like Yerma.  And thus, you failed your sacred quest.
-> END

=== intro ===
#bg:default

The chapel is silent. Dust swirls in the blood-red air.

* Continue...
    -> setting_out