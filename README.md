# BeeArr's Tiles & Tools

This project started as just a way to improve my personal Map-Making experience in Project Zomboid's TilZed/WordlEd/BuildingEd tools. It started with the simple goal of adding tiles to BuildingEd, but evolved into a complete new set of tools for TilZed, as well as a re-work of some existing ones, that will hopefuly make the Map-making process easier and more acessible for everyone.

I would like to thank everyone the Unnoficial PZ Mapping Discord (https://discord.gg/Tc3qRrM3) for the support and help they have shown me, as well as thank all tile-makers for their wonderful tiles which are the main reason why I have created all of this in the first place.

If this project helped you, and you appreciate the herculean effort it took to put this project together, please consider supporting me on Ko-fi.

# Backup your files!

Before you change anything in your own editors, please remember to backup all of your relevant files, which include:

- TileZed and WorldEd as a whole.
- Any and all files modified in this project.
- Any and all files contained within all map projects (.tmx, .pzw, .lotheader, .bin, .lotpack, etc.)
- Any and all building files (.tbx).
- Any and all tilesheets (.png).

These tools have not yet been tested fully, 

I am not responsible for any loss of data resulting from the usage of these tools. [See license.txt for more information](LICENSE)

# Watch out for Mods!

I personally like to use many mods, especially new tiles. As such most of this project requires the same mods/tilesheets to be available, the list of which can be found here. 
- I have separated the tiles used by the TileZed tools into two categories (Vanilla and Modded); it should be easy to spot and comment out the modded tiles if you prefer to make maps using only Vanilla tiles.
- When it comes to the BuildingEd ISO mode, I made no such separation, and using my modifications to that tool without the mods/tilesheets is not recommended.

# The TileZed Tools ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/73d119b0436c002a085a028976240fad8ef2e0f4/Images/TileZedTools.png)

## Expanded - Edge Tool ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/d380ed17282d9c469687e57140ed86744a19deee/Images/2023-03-09%2000_56_53-Window.png)

### Expanded Tile Selection
While the functionality of the Edge Tool remains unchanged, the list of available tiles has been increased.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/d380ed17282d9c469687e57140ed86744a19deee/Images/2023-03-09%2000_57_04-Window.png)

### More than just edges.
The Edge Tool distinguishes itself from the fence tool in its ability to draw 'Outer' and 'Inner' corners, which greatly expands its use beyond simply drawing Grime and traffic lines. Although the current set of tiles which can benefit from placement througn this tool is low, new updates to vanilla and modded content might add new tiles to be used. Here are some examples:

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/d380ed17282d9c469687e57140ed86744a19deee/Images/flowers.gif)
![2](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/d380ed17282d9c469687e57140ed86744a19deee/Images/dddpowerstation.gif)

## Reworked - Fence Tool ![Fence Tool](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/4cd04d6f7bad494a38c857c2211bc81479ac845f/Images/2023-03-08%2023_41_36-Window.png)

### Expanded Tile Selection
Pertominus#5743 gave me a great deal of inspiration when he shared his personal 'tool-fence-data.lua'. I have greatly expanded upon that list of fences to include all fences, both vanilla and modded (excluding the broken pieces.) As well as other non-fence tiles which work well with the tool, such as power lines, HVAC tiles, vines, etc.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/5f94445780a14faea8999411e613b5a15c5ce641/Images/2023-03-08%2023_55_27-Window.png)
![2](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/0d8017dc15bf7a7347431f6d8b708d68461faf86/Images/2023-03-08%2023_55_50-Window.png)

### Corner Placement at NW ・ NE ・ SW ・ SE
The original Fence tool was limited when it came to the placement of corner tiles, as most vanilla fences only have one corner tile in the north-west. I have expanded this functionality so that the tool is not able to use other corner tiles if available, like with these hedges or HVAC tiles, for example:

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/4abe9f6f3161f957f41b340a09cd46b7fcdc1760/Images/hedge.gif)
![2](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/4abe9f6f3161f957f41b340a09cd46b7fcdc1760/Images/hvacfence.gif)

Remember to use the Ctrl Key to draw the SE corner manually. (It is the same as the 'post' tile in the old tool.)

### Double Gates
You are now able to place double gates on fences that support them! Holding the Alt Key when drawing fences should begin to draw the first gate tile; continue holding the alt key as you place the adjacent tile.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/b17aeb3974c96769e16cf0363b5a672534031360/Images/doublegates.gif)

## Example Data Entry
To create new entries, follow this template and add to 'tool-fence-data.lua'.

```lua
fence {
   label = 'Tall Black Metal - Double Gate Op.',
   west1 = 'fencing_01_67',
   west2 = 'fencing_01_66',
   gate_space_w = nil,
   gate_door_w = 'fixtures_doors_fences_01_41', -- Solo Gate Tile OR Double Gate tile on x = 0, y = 0.
   gate_door_w2 = 'fixtures_doors_fences_01_40',-- Double Gate tile on x = 0, y = 1.
   north1 = 'fencing_01_64',
   north2 = 'fencing_01_65',
   gate_space_n = nil,
   gate_door_n = 'fixtures_doors_fences_01_42', -- Solo Gate Tile OR Double Gate tile on x = 0, y = 0.
   gate_door_n2 = 'fixtures_doors_fences_01_43', -- Double Gate tile on x = 1, y = 0.
   nw = 'fencing_01_68',
   sw = nil, -- South West Corner Piece
   ne = nil, -- North East Corner Piece
   post = 'fencing_01_69',
   se = 'fencing_01_69' -- South East Corner Piece, same as 'post' for most fences.
}
```

## Reworked - Single-tile Object Tool (Formerly Street Decoration Tool) ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/dd9cd9756268d928306dfd54ccc4af7f078fb0e2/Images/2023-03-09%2001_17_54-Window.png)

### Expanded Tile Selection
The lackluster vanilla selection has been greatly increased to cover most tiles that could be used outdoors.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/dd9cd9756268d928306dfd54ccc4af7f078fb0e2/Images/2023-03-09%2001_18_27-Window.png)

### Increased Height Limit
The original tool was able to place street lamps and traffic lights layers 0_Furniture and 1_Furniture. The tool is now able to place tiles on the 2_Furniture layer. Currently the only tile that makes use of this is the Utility pole, which when used in conjunction with the Fence Tool, makes the process placing power powerlines much easier.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/dd9cd9756268d928306dfd54ccc4af7f078fb0e2/Images/utilitypoles.gif)

### Example Data Entry
Before you use this tool, make sure your current map features all of these layers: '0_furniture, 1_furniture, 2_furniture'.
If you wish to create new object entries follow this template and add them to 'tool-street-decoration-data.lua'.

```lua
add4d {
    label = 'Utility Pole',
    layer0 = '0_Furniture',
    tile0 = {
	w = 'appliances_com_01_94',
	n = 'appliances_com_01_88',
	e = 'appliances_com_01_94',
	s = 'appliances_com_01_88'
    },
    layer1 = '1_Furniture',
    tile1 = {
	w = 'appliances_com_01_95',
        n = 'appliances_com_01_89',
        e = 'appliances_com_01_95',
        s = 'appliances_com_01_89'	
    },
    layer2 = '2_Furniture',
    tile2 = {
	w = 'appliances_com_01_92',
        n = 'appliances_com_01_93',
        e = 'appliances_com_01_92',
        s = 'appliances_com_01_93'
    },
	distance = true
}
```
## NEW - Multi-Tile Object Tool ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/d285affc3e458fecb6a8a0a7e5fdfc28a82a6503/Images/nto.png)
Gone are the days in which you have to rumage through tilesheets and manually select tiles when you want to place a large object directly in TileZed. This tool is my crowining acheivement and allows you to place multi-tile objects with one click! While the current selection of tiles isn't quite extensive, it is easily expandable as with the other tools.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/d285affc3e458fecb6a8a0a7e5fdfc28a82a6503/Images/mto2.png)
![2](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/3fb8562d2ba876dc2319bfd61f9d2f6501281b20/Images/mto1.gif)

### Rotating Objects.
MTO can rotate objects! By holding the Alt, Ctrl, or Shift Keys, the object will be rotated if different orientation versions of that object are available.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/d4e7f0c3420d6d1a1fcc27ce6904fb4624f6cc8f/Images/mto2.gif)

### Example Data Entry
When creating a new object for the tool, please keep in mind that the tiles are arranged in the pattern shown in this image.
![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/8065ce93ee0fcaee40fa0a93ec57e83e21d7bf4b/Images/mto3.png)

- dir1 refers to the tiles displayed when no key is pressed, dir2 when Shift is pressed, dir3 when Control is pressed, and dir4 when Alt is pressed.
- When an object does not have tiles in each orientation, copy the usable ones to the leftover directions so the tool continues working (See 'Orange Tents' template)
- Objects with two tiles should follow the 'Orange Tents' template.

```lua
    {
        label = 'Picnic Table',
        dir1 = {
            w = 'camping_01_8',
            n = 'camping_01_9',
            e = 'camping_01_10',
            s = 'camping_01_11'
        },
        dir2 = {
            w = 'camping_01_12',
            n = 'camping_01_15',
            e = 'camping_01_13',
            s = 'camping_01_14'
        },
	dir3 = {
            w = 'camping_01_8',
            n = 'camping_01_9',
            e = 'camping_01_10',
            s = 'camping_01_11'
        },
	dir4 = {
            w = 'camping_01_12',
            n = 'camping_01_15',
            e = 'camping_01_13',
            s = 'camping_01_14'
        },
    },
	{
        label = 'Orange Tents',
        dir1 = {
            w = 'camping_01_0',
            n = 'camping_01_1',
            e = nil,
            s = nil,
        },
        dir2 = {
            w = 'camping_01_2',
            n = nil,
            e = 'camping_01_3',
            s = nil,
        },
	dir3 = {
            w = 'camping_01_0',
            n = 'camping_01_1',
            e = nil,
            s = nil,
        },
	dir4 = {
            w = 'camping_01_2',
            n = nil,
            e = 'camping_01_3',
            s = nil,
        },
    },
```
    
## Expanded - Houseplant Tool ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/17d660f0e57246697d43aa9169e43fb81d5926f1/Images/houseplant.png)
Thanks to our wonderful tile-makers, this tool's usable tile pool has been greatly increased. 
- Vanilla Users: While out-of-the-box it depends on those modded tiles, I made it easy to comment them out on the tool itself. 

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/fb55bccd1f056901922da2d3e32260613556569e/Images/houseplant.gif)

## NEW - Grass Tool ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/26eea2bdc144a847ac0b2af79935821980974286/Images/gress.png)
Allows you to place grass anywhere. No more fidgeting with Rulesets and the BMP Brush. Places grass on the 'O_Vegetation' layer.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/17d660f0e57246697d43aa9169e43fb81d5926f1/Images/grass.gif)

## NEW - Shrub Tool ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/87a4582de3298feac8e5844996fbdf3801e9f789/Images/bushes.png)
Allows you to place shrubs, and other low plants. Places shrubs on the 'O_Vegetation' layer.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/87a4582de3298feac8e5844996fbdf3801e9f789/Images/shrub.gif)

## NEW - Seasonal Bushes ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/87a4582de3298feac8e5844996fbdf3801e9f789/Images/4seasonbushes.png)
Placing Bushes by hand with the new game tiles was incredibly difficult. You needed to select each of the bush tiles (Branches, Leaves, Flowers) and place them one-by-one, changing layers in between. This Bush tool does that automatically, randomizing the bushes placed in the process.

- Before using this tool, add the following Layers to your map: '0_Vegetation', '0_Vegetation1', '0_Vegetation2'.

### Four Seasons
This tool is also able to place bushes from different seasons:
- By holding the Alt Key, you are able to place Spring Bushes.
- By holding the Ctrl Key, you are able to place Autumn Bushes.
- By holding the Shift Key, you are able to place Winter Bushes.
- Without holding any Key, the tool defaults to Summer/Green Bushes.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/87a4582de3298feac8e5844996fbdf3801e9f789/Images/4seasonbushes.gif)

### Example Data Entry
The tool works by pulling tilesheet data from each bracket, in order, and placing the fisrt one on the '0_Vegetation' layer, the second one on the '0_Vegetation1' layer, and the third one on the '0_Vegetation2' layer.

- The spring tool is the only one which is cable of using three layers, '0_Vegetation' for the branches, '0_Vegetation1' for the leaves, and '0_Vegetation2' for the flowers. It will also place two tiles, or even one, if only that is available within the brackets.
- The autumn and summer tools can place one or two layers, while the winter tool can only place one.

```lua
spring = {
{'d_plants_1_16', 'd_plants_1_24'},
{'f_bushes_1_7', 'f_bushes_1_71', 'f_bushes_1_87'},
}
summer = {
{'f_bushes_1_0', 'f_bushes_1_64'},
}

autumn = {
{'d_plants_1_15'},
{'f_bushes_1_0', 'f_bushes_1_48'},
}

winter = {
{'f_bushes_1_0'},
}
```
## NEW - Tree Tool ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/dff6b2a3e47a9b2b688d19e815e9126e0b7103bc/Images/trees.png)
Allows you to place trees anywhere in the map! No more fidgeting with Rulesets and the BMP Brush.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/dff6b2a3e47a9b2b688d19e815e9126e0b7103bc/Images/trees.gif)

## NEW - Seasonal Trees ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/dff6b2a3e47a9b2b688d19e815e9126e0b7103bc/Images/4seasontrees.png)

Placing Trees by hand with the new game tiles was incredibly difficult. You needed to select each of the tree tiles (Branches, Leaves, Flowers) and place them one-by-one, changing layers in between. This Bush tool does that automatically, randomizing the trees placed in the process.

- Before using this tool, add the following Layers to your map: '0_Vegetation', '0_Vegetation1', '0_Vegetation2'.

### Four Seasons
This tool is also able to place trees from different seasons:
- By holding the Alt Key, you are able to place Spring Trees.
- By holding the Ctrl Key, you are able to place Autumn Trees.
- By holding the Shift Key, you are able to place Winter Trees.
- Without holding any Key, the tool defaults to Summer/Green Trees.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/dff6b2a3e47a9b2b688d19e815e9126e0b7103bc/Images/4seasontrees.gif)

### Example Data Entry
The tool works by pulling tilesheet data from each bracket, in order, and placing the fisrt one on the '0_Vegetation' layer, and the second one on the '0_Vegetation1' layer

- The Spring, Summer, and Autumn tools are all able to place tiles in two layers.
- The Winter tool currently only places tiles on a single layer.

```lua
spring = {
{'e_americanlinden_1_0', 'e_americanlinden_1_8'},
{'e_americanlinden_1_0', 'e_americanlinden_1_12'},
}
summer = {
{'e_americanlinden_1_0', 'e_americanlinden_1_12'},
{'e_americanlinden_1_1', 'e_americanlinden_1_13'},
}

autumn = {
{'e_americanlinden_1_0', 'e_americanlinden_1_16'},
{'e_americanlinden_1_0', 'e_americanlinden_1_20'},
}

winter = {
{'e_americanlinden_1_0'},
{'e_americanlinden_1_1'},
}
```

## NEW - Cracks Tool ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/72f8053fbdc1fed69ce953af3ba1790ddd11aead/Images/cracks.png)
Allows you to place small street cracks on the '0_FloorOverlay' layer.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/72f8053fbdc1fed69ce953af3ba1790ddd11aead/Images/cracks.gif)

## NEW - Trash Tool ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/72f8053fbdc1fed69ce953af3ba1790ddd11aead/Images/trash.png)
Allows you to place small street cracks on the '0_FloorOverlay' layer.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/72f8053fbdc1fed69ce953af3ba1790ddd11aead/Images/trash.gif)

## NEW - Stone Tool (Relies Exclusively on Daddy Dirkie dirks Tiles) ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/11e7dc8ee7db442364e6b2f0361b767fcfd2a4f5/Images/stone.png)
I made these three tool with great appreciation for the tiles that Dirk, Melo, Pert and all others have made. It allows you to place stones randomly on the '0_Furniture' layer.
#### You must have DDD's tilepacks installed for this tool to work, if you wish to remain vanilla, remove this tool.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/11e7dc8ee7db442364e6b2f0361b767fcfd2a4f5/Images/stone.gif)

## NEW - Stacked Junk Tool (Relies Exclusively on Daddy Dirkie dirks Tiles) ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/11e7dc8ee7db442364e6b2f0361b767fcfd2a4f5/Images/stacked.png)

 It allows you to place Stacked Furniture tiles randomly on the '0_Furniture' layer.
#### You must have DDD's tilepacks installed for this tool to work, if you wish to remain vanilla, remove this tool.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/11e7dc8ee7db442364e6b2f0361b767fcfd2a4f5/Images/stackedjunk.gif)

## NEW - Overgrown Tiles Tool (Relies on both DDD and Melo's Tiles) ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/11e7dc8ee7db442364e6b2f0361b767fcfd2a4f5/Images/overgrown.png)
It allows you to place his Overgrown tiles randomly on the '0_Furniture' layer.
#### You must have DDD's and Melo's tilepacks installed for this tool to work, if you wish to remain vanilla, remove this tool.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/11e7dc8ee7db442364e6b2f0361b767fcfd2a4f5/Images/overgrown.gif)

## NEW - Blood Tool (Vanilla) ![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/11e7dc8ee7db442364e6b2f0361b767fcfd2a4f5/Images/blood.png)
Allows you to place blood splaters on the '0_FloorOverlay' layer.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/11e7dc8ee7db442364e6b2f0361b767fcfd2a4f5/Images/blood.gif)

## Adding these tools to your TileZed.
The process of adding the tools is faily simple. Head to your TileZed folder and:

- Replace the 'LuaTools.txt' within your /TileZed/ folder by the one provided in this Project.
- Add all files within the provided /TileZed/lua/ folder to your /TileZed/lua/ folder, replacing all files when prompted.
- If you use Alree's fork of TileZed, place the files on the TileZed folder of his fork.

## Choosing which tools to use.

If you would like to use some, but not all of these tools, remove them from your TileZed program by:

- Opening the 'LuaTools.txt' file.
- Deleting the 'tool' entries from the file.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/24075df51eb6993e8b90871b754568301229ea14/Images/unwanted.gif)

#### If you would like to opt out from the changes made to the 'Fence', 'Edge', and/or 'Street Decoration' tools, do not replace either of the original files (e.g: 'tool-fence.lua' & 'tool-fence-data.lua').

## Removing Modded tiles from Tool Datasets.

If you would like to remove modded tiles from the dataset:

- Open the .lua file corresponding to the dataset, or to the tool from which you would like to remove modded tiles.
- Comment out the lines after the -- ## Modded ## comments.

![1](https://github.com/TheBeeArr/beearr-tiles-and-tools/blob/aaad155f73edcd44dc205fbcadefbc446c66e758/Images/moddedtiles.gif)













