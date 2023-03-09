-- Junkstacks Tool Edited by BeeArr#8231 // https://github.com/TheBeeArr/beearr-tiles-and-tools/ // GNU General Public License v3 (GPL-3) -- Tiles by Daddy Dirkie Dirk
PLANTS = {
	'DylansJunkstacks01_0',
	'DylansJunkstacks01_1',
	'DylansJunkstacks01_2',
	'DylansJunkstacks01_3',
	'DylansJunkstacks01_4',
	'DylansJunkstacks01_5',
	'DylansJunkstacks01_6',
	'DylansJunkstacks01_7',
	'DylansJunkstacks01_8',
	'DylansJunkstacks01_9',
	'DylansJunkstacks01_10',
	'DylansJunkstacks01_11',
	'DylansJunkstacks01_12',
	'DylansJunkstacks01_13',
	'DylansJunkstacks01_14',
	'DylansJunkstacks01_15',
	'DylansJunkstacks01_16',
	'DylansJunkstacks01_17',
	'DylansJunkstacks01_18',
	'DylansJunkstacks01_19',
	'DylansJunkstacks01_20',
	'DylansJunkstacks01_21',
	'DylansJunkstacks01_22',
	'DylansJunkstacks01_23',
	'DylansJunkstacks01_24',
	'DylansJunkstacks01_25',
	'DylansJunkstacks01_26',
	'DylansJunkstacks01_27',
	'DylansJunkstacks01_28',
	'DylansJunkstacks01_29',
	'DylansJunkstacks01_30',
	'DylansJunkstacks01_31',
	'DylansJunkstacks01_32',
	'DylansJunkstacks01_33',
	'DylansJunkstacks01_34',
	'DylansJunkstacks01_35',
	'DylansJunkstacks01_36',
	'DylansJunkstacks01_37',
	'DylansJunkstacks01_38',
	'DylansJunkstacks01_39',
	'DylansJunkstacks01_40',
	'DylansJunkstacks01_41',
	'DylansJunkstacks01_42',
	'DylansJunkstacks01_43',
	'DylansJunkstacks01_44',
	'DylansJunkstacks01_45',
	'DylansJunkstacks01_46',
	'DylansJunkstacks01_47',
	'DylansJunkstacks01_48',
	'DylansJunkstacks01_49',
	'DylansJunkstacks01_50',
	'DylansJunkstacks01_51',
	'DylansJunkstacks01_52',
	'DylansJunkstacks01_53',
	'DylansJunkstacks01_54',
	'DylansJunkstacks01_55',
	'DylansJunkstacks01_56',
	'DylansJunkstacks01_57',
	'DylansJunkstacks01_58',
	'DylansJunkstacks01_59',
	'DylansJunkstacks01_60',
	'DylansJunkstacks01_61',
	'DylansJunkstacks01_62',
	'DylansJunkstacks01_63',
	'DylansJunkstacks02_0',
	'DylansJunkstacks02_1',
	'DylansJunkstacks02_2',
	'DylansJunkstacks02_3',
	'DylansJunkstacks02_4',
	'DylansJunkstacks02_5',
	'DylansJunkstacks02_6',
	'DylansJunkstacks02_7',
	'DylansJunkstacks02_8',
	'DylansJunkstacks02_9',
	'DylansJunkstacks02_10',
	'DylansJunkstacks02_11',
	'DylansJunkstacks02_12',
	'DylansJunkstacks02_13',
	'DylansJunkstacks02_14',
	'DylansJunkstacks02_15',
	'DylansJunkstacks02_16',
	'DylansJunkstacks02_17',
	'DylansJunkstacks02_18',
	'DylansJunkstacks02_19',
	'DylansJunkstacks02_20',
	'DylansJunkstacks02_21',
	'DylansJunkstacks02_22',
	'DylansJunkstacks02_23',
	'DylansJunkstacks02_24',
	'DylansJunkstacks02_25',
	'DylansJunkstacks02_26',
	'DylansJunkstacks02_27',
	'DylansJunkstacks02_28',
	'DylansJunkstacks02_29',
	'DylansJunkstacks02_30',
	'DylansJunkstacks02_31',
	'DylansJunkstacks02_32',
	'DylansJunkstacks02_33',
	'DylansJunkstacks02_34',
	'DylansJunkstacks02_35',
	'DylansJunkstacks02_36',
	'DylansJunkstacks02_37',
	'DylansJunkstacks02_38',
	'DylansJunkstacks02_39',
	'DylansJunkstacks02_40',
	'DylansJunkstacks02_41',
	'DylansJunkstacks02_42',
	'DylansJunkstacks02_43',
	'DylansJunkstacks02_44',
	'DylansJunkstacks02_45',
	'DylansJunkstacks02_46',
	'DylansJunkstacks02_47',
	'DylansJunkstacks02_48',
	'DylansJunkstacks02_49',
	'DylansJunkstacks02_50',
	'DylansJunkstacks02_51',
	'DylansJunkstacks02_52',
	'DylansJunkstacks02_53',
	'DylansJunkstacks02_54',
	'DylansJunkstacks02_55',
	'DylansJunkstacks02_56',
	'DylansJunkstacks02_57',
	'DylansJunkstacks02_58',
	'DylansJunkstacks02_59',
	'DylansJunkstacks02_60',
	'DylansJunkstacks02_61',
	'DylansJunkstacks02_62',
	'DylansJunkstacks02_63'
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
		self:applyChanges('Random Junk Stack')
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

