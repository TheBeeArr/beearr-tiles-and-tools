-- Overgrown Objects Tool Edited by BeeArr#8231 // https://github.com/TheBeeArr/beearr-tiles-and-tools/ // GNU General Public License v3 (GPL-3) -- Tiles by Daddy Dirkie Dirk and Melo
PLANTS = {
	'DylansOvergrown01_0',
	'DylansOvergrown01_1',
	'DylansOvergrown01_2',
	'DylansOvergrown01_3',
	'DylansOvergrown01_4',
	'DylansOvergrown01_5',
	'DylansOvergrown01_6',
	'DylansOvergrown01_7',
	'DylansOvergrown01_8',
	'DylansOvergrown01_9',
	'DylansOvergrown01_10',
	'DylansOvergrown01_11',
	'DylansOvergrown01_12',
	'DylansOvergrown01_13',
	'DylansOvergrown01_14',
	'DylansOvergrown01_15',
	'DylansOvergrown01_16',
	'DylansOvergrown01_17',
	'DylansOvergrown01_18',
	'DylansOvergrown01_19',
	'DylansOvergrown01_20',
	'DylansOvergrown01_21',
	'DylansOvergrown01_22',
	'DylansOvergrown01_23',
	'DylansOvergrown01_24',
	'DylansOvergrown01_25',
	'DylansOvergrown01_26',
	'DylansOvergrown01_27',
	'DylansOvergrown01_28',
	'DylansOvergrown01_29',
	'DylansOvergrown01_30',
	'DylansOvergrown01_31',
	'DylansOvergrown01_32',
	'DylansOvergrown01_33',
	'DylansOvergrown01_34',
	'DylansOvergrown01_35',
	'DylansOvergrown01_36',
	'DylansOvergrown01_37',
	'DylansOvergrown01_38',
	'DylansOvergrown01_39',
	'DylansOvergrown01_40',
	'DylansOvergrown01_41',
	'DylansOvergrown01_42',
	'DylansOvergrown01_43',
	'DylansOvergrown01_44',
	'DylansOvergrown01_45',
	'DylansOvergrown01_46',
	'DylansOvergrown01_47',
	'DylansOvergrown01_58',
	'DylansOvergrown01_59',
	'DylansOvergrown01_60',
	'DylansOvergrown01_61',
	'DylansOvergrown01_62',
	'DylansOvergrown01_63',
	'melos_tiles_overgrown_objects_01_0',
	'melos_tiles_overgrown_objects_01_1',
	'melos_tiles_overgrown_objects_01_2',
	'melos_tiles_overgrown_objects_01_3',	
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
		self:applyChanges('Random Overgrown Object')
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

