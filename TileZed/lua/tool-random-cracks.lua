-- Cracks Tool Edited by BeeArr#8231 // https://github.com/TheBeeArr/beearr-tiles-and-tools/ // GNU General Public License v3 (GPL-3)
PLANTS = {
	'blends_streetoverlays_01_00',
	'blends_streetoverlays_01_01',
	'blends_streetoverlays_01_02',
	'blends_streetoverlays_01_03',
	'blends_streetoverlays_01_04',
	'blends_streetoverlays_01_05',
	'blends_streetoverlays_01_06',
	'blends_streetoverlays_01_07',
	'blends_streetoverlays_01_08',
	'blends_streetoverlays_01_09',
	'blends_streetoverlays_01_10',
	'blends_streetoverlays_01_11',
	'blends_streetoverlays_01_12',
	'blends_streetoverlays_01_13',
	'blends_streetoverlays_01_14',
	'blends_streetoverlays_01_15',
	'blends_streetoverlays_01_16',
	'blends_streetoverlays_01_17',
	'blends_streetoverlays_01_18',
	'blends_streetoverlays_01_19',
	'blends_streetoverlays_01_20',
	'blends_streetoverlays_01_21',
	'blends_streetoverlays_01_22',
	'blends_streetoverlays_01_23',
	'blends_streetoverlays_01_24',
	'blends_streetoverlays_01_25',
	'blends_streetoverlays_01_26',
	'blends_streetoverlays_01_27',
	'blends_streetoverlays_01_28',
	'blends_streetoverlays_01_29',
	'blends_streetoverlays_01_30',
-- ## Modded
	'd_streetcracks_1_00',
	'd_streetcracks_1_01',
	'd_streetcracks_1_02',
	'd_streetcracks_1_03',
	'd_streetcracks_1_04',
	'd_streetcracks_1_05',
	'd_streetcracks_1_06',
	'd_streetcracks_1_07',
	'd_streetcracks_1_08',
	'd_streetcracks_1_09',
	'd_streetcracks_1_10',
	'd_streetcracks_1_11',
	'd_streetcracks_1_12',
	'd_streetcracks_1_13',
	'd_streetcracks_1_14',
	'd_streetcracks_1_15',
	'd_streetcracks_1_16',
	'd_streetcracks_1_17',
	'd_streetcracks_1_18',
	'd_streetcracks_1_19',
	'd_streetcracks_1_20',
	'd_streetcracks_1_21',
	'd_streetcracks_1_22',
	'd_streetcracks_1_23',
}

   

LAYERS = {
	'0_FloorOverlay',
	'0_FloorOverlay1',
	'0_FloorOverlay2',
	'0_FloorOverlay3',
	'0_FloorOverlay4',
	'0_FloorOverlay5'
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
		self:applyChanges('Random Street Cracks')
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

