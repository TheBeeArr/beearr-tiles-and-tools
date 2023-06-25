-- Random Electronic Item Edited by BeeArr#8231 // Needs Azakaela's Tile 2 Item Convertor - https://steamcommunity.com/sharedfiles/filedetails/?id=2991554892 // https://github.com/TheBeeArr/beearr-tiles-and-tools/ // GNU General Public License v3 (GPL-3)
PLANTS = {
	'aza_t2ic_equipment_39',
	'aza_t2ic_equipment_40',
	'aza_t2ic_equipment_41',
	'aza_t2ic_equipment_42',
	'aza_t2ic_equipment_43',
	'aza_t2ic_equipment_44',
	'aza_t2ic_equipment_45',
	'aza_t2ic_equipment_46',
	'aza_t2ic_equipment_47',
	'aza_t2ic_equipment_48',
	'aza_t2ic_equipment_49',
	'aza_t2ic_equipment_50',
	'aza_t2ic_equipment_51',
	'aza_t2ic_equipment_52',
	'aza_t2ic_equipment_53',
	'aza_t2ic_equipment_54',
	'aza_t2ic_equipment_55',
	'aza_t2ic_equipment_56',
	'aza_t2ic_equipment_57',
	'aza_t2ic_equipment_58',
	'aza_t2ic_equipment_59',
	'aza_t2ic_equipment_60',
	'aza_t2ic_equipment_61',
	'aza_t2ic_equipment_69',
	'aza_t2ic_equipment_70'
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

