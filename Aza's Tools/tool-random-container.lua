-- Random Bag and Container Edited by BeeArr#8231 // Needs Azakaela's Tile 2 Item Convertor - https://steamcommunity.com/sharedfiles/filedetails/?id=2991554892 // https://github.com/TheBeeArr/beearr-tiles-and-tools/ // GNU General Public License v3 (GPL-3)
PLANTS = {
	'aza_t2ic_equipment_0',
	'aza_t2ic_equipment_1',
	'aza_t2ic_equipment_2',
	'aza_t2ic_equipment_3',
	'aza_t2ic_equipment_4',
	'aza_t2ic_equipment_5',
	'aza_t2ic_equipment_6',
	'aza_t2ic_equipment_7',
	'aza_t2ic_equipment_8',
	'aza_t2ic_equipment_9',
	'aza_t2ic_equipment_10',
	'aza_t2ic_equipment_11',
	'aza_t2ic_equipment_12',
	'aza_t2ic_equipment_13',
	'aza_t2ic_equipment_14',
	'aza_t2ic_equipment_15',
	'aza_t2ic_equipment_16',
	'aza_t2ic_equipment_17',
	'aza_t2ic_equipment_18',
	'aza_t2ic_equipment_19',
	'aza_t2ic_equipment_20',
	'aza_t2ic_equipment_21',
	'aza_t2ic_equipment_22',
	'aza_t2ic_equipment_23',
	'aza_t2ic_equipment_24',
	'aza_t2ic_equipment_25',
	'aza_t2ic_equipment_26',
	'aza_t2ic_equipment_27',
	'aza_t2ic_equipment_28',
	'aza_t2ic_equipment_29',
	'aza_t2ic_equipment_30',
	'aza_t2ic_equipment_31',
	'aza_t2ic_equipment_32',
	'aza_t2ic_equipment_33',
	'aza_t2ic_equipment_34',
	'aza_t2ic_equipment_35',
	'aza_t2ic_equipment_36',
	'aza_t2ic_equipment_37',
	'aza_t2ic_equipment_38'
}
   

LAYERS = {
	'0_Furniture'
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
		self:applyChanges('Random Trash')
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

