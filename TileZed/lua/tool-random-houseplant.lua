-- Houseplant Tool Edited by BeeArr#8231 // https://github.com/TheBeeArr/beearr-tiles-and-tools/ // GNU General Public License v3 (GPL-3)
PLANTS = {
	'vegetation_indoor_01_7',
	'vegetation_indoor_01_8',
	'vegetation_indoor_01_9',
	'vegetation_indoor_01_10',
	'vegetation_indoor_01_11',
	'vegetation_indoor_01_12',
	-- Modded Plants
	'pert_vegetation_indoor_01_0',
	'pert_vegetation_indoor_01_1',
	'pert_vegetation_indoor_01_2',
	'pert_vegetation_indoor_01_3',
	'melos_tiles_gardencenter_plants_02_0',
	'melos_tiles_gardencenter_plants_02_1',
	'melos_tiles_gardencenter_plants_02_2',
	'melos_tiles_gardencenter_plants_02_3',
	'melos_tiles_gardencenter_plants_02_4',
	'melos_tiles_gardencenter_01_0',
	'melos_tiles_gardencenter_01_1',
	'melos_tiles_gardencenter_01_2',
	'melos_tiles_gardencenter_01_3',
	'melos_tiles_gardencenter_01_4',
	'melos_tiles_gardencenter_01_5',
	'melos_tiles_gardencenter_01_6',
	'melos_tiles_gardencenter_01_7',
	'melos_tiles_gardencenter_01_8',
	'melos_tiles_gardencenter_01_9',
	'melos_tiles_gardencenter_01_10',
	'melos_tiles_gardencenter_01_11',
	'melos_tiles_gardencenter_01_16',
	'melos_tiles_gardencenter_01_17',
	'melos_tiles_gardencenter_01_18',
	'Ekron02_0',
	'DylansGardenStuff01_0',
	'DylansGardenStuff01_1',
	'DylansGardenStuff01_38',
	'DylansGardenStuff01_39',
	'DylansGardenStuff01_40',
	'DylansGardenStuff01_41',
	'DylansGardenStuff02_42',
	'DylansGardenStuff02_43',
	'DylansGardenStuff02_44',
	'DylansGardenStuff02_45',
	'DylansGardenStuff02_46',
	'DylansGardenStuff02_47',
	'DylanRandomAssetPack1_0',
	'DylanRandomAssetPack1_1'
	
}

   

LAYERS = {
	'0_Furniture',
	'0_Furniture2',
	'0_Furniture3',
	'0_Furniture4'
}

function activate()
end

function deactivate()
end

function mouseMoved(buttons, x, y, modifiers)
	self:clearToolTiles()
	if x < 0 or y < 0 or x >= map:width() or y >= map:height() then
		self.ok = false
		return
	end

	CURRENT_PLANT = PLANTS[map:bmp(0):rand(x, y) % #PLANTS + 1]
	local tile = map:tile(CURRENT_PLANT)
	local layerName = pickEmptyLayer(x, y)
	if tile and layerName then
		self.ok = true
		self:setToolTile(layerName, x, y, tile)
	else
		self.ok = false
	end
end

function mousePressed(buttons, x, y, modifiers)
	if buttons.left then
		self.cancel = false
		self.x, self.y = x, y
	end
	if buttons.right then
		self.cancel = true
	end
end

function mouseReleased(buttons, x, y, modifiers)
	if buttons.left and self.ok and not self.cancel then
		local layerName = pickEmptyLayer(x, y)
		map:tileLayer(layerName):setTile(self.x, self.y, map:tile(CURRENT_PLANT))
		self:applyChanges('Random Houseplant')
	end
end

function pickEmptyLayer(x, y)
	for _,layerName in ipairs(LAYERS) do
		local layer = map:tileLayer(layerName)
		if layer then
			local tile = layer:tileAt(x, y)
			if not tile then
				return layerName
			end
		end
	end
	return nil
end

