-- Random Bonking Implement Edited by BeeArr#8231 // Needs Azakaela's Tile 2 Item Convertor - https://steamcommunity.com/sharedfiles/filedetails/?id=2991554892 // https://github.com/TheBeeArr/beearr-tiles-and-tools/ // GNU General Public License v3 (GPL-3)
PLANTS = {
	'aza_t2ic_melee_0',
	'aza_t2ic_melee_1',
	'aza_t2ic_melee_2',
	'aza_t2ic_melee_3',
	'aza_t2ic_melee_4',
	'aza_t2ic_melee_5',
	'aza_t2ic_melee_6',
	'aza_t2ic_melee_7',
	'aza_t2ic_melee_8',
	'aza_t2ic_melee_9',
	'aza_t2ic_melee_10',
	'aza_t2ic_melee_11',
	'aza_t2ic_melee_12',
	'aza_t2ic_melee_13',
	'aza_t2ic_melee_14',
	'aza_t2ic_melee_15',
	'aza_t2ic_melee_16',
	'aza_t2ic_melee_17',
	'aza_t2ic_melee_18',
	'aza_t2ic_melee_19',
	'aza_t2ic_melee_20',
	'aza_t2ic_melee_21',
	'aza_t2ic_melee_22',
	'aza_t2ic_melee_23',
	'aza_t2ic_melee_24',
	'aza_t2ic_melee_25',
	'aza_t2ic_melee_26',
	'aza_t2ic_melee_27',
	'aza_t2ic_melee_28',
	'aza_t2ic_melee_29',
	'aza_t2ic_melee_30',
	'aza_t2ic_melee_31',
	'aza_t2ic_melee_32',
	'aza_t2ic_melee_33',
	'aza_t2ic_melee_34',
	'aza_t2ic_melee_35',
	'aza_t2ic_melee_36',
	'aza_t2ic_melee_37',
	'aza_t2ic_melee_38',
	'aza_t2ic_melee_39',
	'aza_t2ic_melee_40',
	'aza_t2ic_melee_41',
	'aza_t2ic_melee_42',
	'aza_t2ic_melee_43',
	'aza_t2ic_melee_44',
	'aza_t2ic_melee_45',
	'aza_t2ic_melee_46',
	'aza_t2ic_melee_47',
	'aza_t2ic_melee_48',
	'aza_t2ic_melee_49',
	'aza_t2ic_melee_50',
	'aza_t2ic_melee_51',
	'aza_t2ic_melee_52',
	'aza_t2ic_melee_53',
	'aza_t2ic_melee_54',
	'aza_t2ic_melee_55',
	'aza_t2ic_melee_56',
	'aza_t2ic_melee_57',
	'aza_t2ic_melee_58',
	'aza_t2ic_melee_59',
	'aza_t2ic_melee_60',
	'aza_t2ic_melee_61',
	'aza_t2ic_melee_62',
	'aza_t2ic_melee_63',
	'aza_t2ic_melee_64',
	'aza_t2ic_melee_65',
	'aza_t2ic_melee_66',
	'aza_t2ic_melee_67',
	'aza_t2ic_melee_68',
	'aza_t2ic_melee_69',
	'aza_t2ic_melee_70',
	'aza_t2ic_melee_71',
	'aza_t2ic_melee_72',
	'aza_t2ic_melee_73',
	'aza_t2ic_melee_74',
	'aza_t2ic_melee_75',
	'aza_t2ic_melee_76',
	'aza_t2ic_melee_77',
	'aza_t2ic_melee_78',
	'aza_t2ic_melee_79',
	'aza_t2ic_melee_80',
	'aza_t2ic_melee_81',
	'aza_t2ic_melee_82',
	'aza_t2ic_melee_83',
	'aza_t2ic_melee_84',
	'aza_t2ic_melee_85',
	'aza_t2ic_melee_86',
	'aza_t2ic_melee_87',
	'aza_t2ic_melee_88',
	'aza_t2ic_melee_89',
	'aza_t2ic_melee_90'
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

