-- Random Ocupation Zombie Edited by BeeArr#8231 // Needs Azakaela's Tile 2 Item Convertor - https://steamcommunity.com/sharedfiles/filedetails/?id=2991554892 // https://github.com/TheBeeArr/beearr-tiles-and-tools/ // GNU General Public License v3 (GPL-3)
PLANTS = {
	'aza_t2ic_corpses_15',
	'aza_t2ic_corpses_16',
	'aza_t2ic_corpses_17',
	'aza_t2ic_corpses_18',
	'aza_t2ic_corpses_19',
	'aza_t2ic_corpses_20',
	'aza_t2ic_corpses_21',
	'aza_t2ic_corpses_22',
	'aza_t2ic_corpses_23',
	'aza_t2ic_corpses_24',
	'aza_t2ic_corpses_25',
	'aza_t2ic_corpses_26',
	'aza_t2ic_corpses_27',
	'aza_t2ic_corpses_28',
	'aza_t2ic_corpses_29',
	'aza_t2ic_corpses_30',
	'aza_t2ic_corpses_31',
	'aza_t2ic_corpses_32',
	'aza_t2ic_corpses_33',
	'aza_t2ic_corpses_34',
	'aza_t2ic_corpses_35',
	'aza_t2ic_corpses_36',
	'aza_t2ic_corpses_37',
	'aza_t2ic_corpses_38',
	'aza_t2ic_corpses_39',
	'aza_t2ic_corpses_40',
	'aza_t2ic_corpses_41',
	'aza_t2ic_corpses_42',
	'aza_t2ic_corpses_43',
	'aza_t2ic_corpses_44',
	'aza_t2ic_corpses_45',
	'aza_t2ic_corpses_46',
	'aza_t2ic_corpses_47',
	'aza_t2ic_corpses_48',
	'aza_t2ic_corpses_49',
	'aza_t2ic_corpses_50',
	'aza_t2ic_corpses_51',
	'aza_t2ic_corpses_52',
	'aza_t2ic_corpses_53',
	'aza_t2ic_corpses_54',
	'aza_t2ic_corpses_55'
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

