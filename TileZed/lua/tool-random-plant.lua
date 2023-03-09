-- Bush Tool Edited by BeeArr#8231 // https://github.com/TheBeeArr/beearr-tiles-and-tools/ // GNU General Public License v3 (GPL-3)
PLANTS = {
'f_bushes_1_0',
'f_bushes_1_1',
'f_bushes_1_2',
'f_bushes_1_3',
'f_bushes_1_4',
'f_bushes_1_5',
'f_bushes_1_6',
'f_bushes_1_7',
'f_bushes_1_8',
'f_bushes_1_9',
'f_bushes_1_10',
'f_bushes_1_11',
'f_bushes_1_12',
'f_bushes_1_13',
'f_bushes_1_14',
'f_bushes_1_15',
'f_bushes_1_64',
'f_bushes_1_65',
'f_bushes_1_66',
'f_bushes_1_67',
'f_bushes_1_68',
'f_bushes_1_69',
'f_bushes_1_70',
'f_bushes_1_71',
'f_bushes_1_72',
'f_bushes_1_73',
'f_bushes_1_74',
'f_bushes_1_75',
'f_bushes_1_76',
'f_bushes_1_77',
'f_bushes_1_78',
'f_bushes_1_79',
'f_bushes_1_96',
'f_bushes_1_97',
'f_bushes_1_98',
'f_bushes_1_99',
'f_bushes_1_100',
'f_bushes_1_101',
'f_bushes_1_102',
'f_bushes_1_103',
'f_bushes_1_104',
'f_bushes_1_105',
'f_bushes_1_106',
'f_bushes_1_107',
'f_bushes_1_108',
'f_bushes_1_109',
'f_bushes_1_110',
'f_bushes_1_111',
'vegetation_foliage_01_0',
'vegetation_foliage_01_1',
'vegetation_foliage_01_2',
'vegetation_foliage_01_3',
'vegetation_foliage_01_4',
'vegetation_foliage_01_5',
'vegetation_foliage_01_8',
'vegetation_foliage_01_9',
'vegetation_foliage_01_10',
'vegetation_foliage_01_11',
'vegetation_foliage_01_12',
'vegetation_foliage_01_13',
'vegetation_foliage_01_14',
'vegetation_trees_01_0',
'vegetation_trees_01_1',
'vegetation_trees_01_12',
-- Modded
'd_generic_1_0',
'd_generic_1_1',
'd_generic_1_2',
'd_generic_1_3',
'd_generic_1_4',
'd_generic_1_5',
'd_generic_1_6',
'd_generic_1_7',
'd_generic_1_8',
'd_generic_1_9',
'd_generic_1_10',
'd_generic_1_11',
'd_generic_1_12',
'd_generic_1_13',
'd_generic_1_14',
'd_generic_1_15',
'd_generic_1_16',
'd_generic_1_17',
'd_generic_1_18',
'd_generic_1_19',
'd_generic_1_20',
'd_generic_1_21',
'd_generic_1_22',
'd_generic_1_23',
'd_generic_1_24',
'd_generic_1_25',
'd_generic_1_26',
'd_generic_1_27',
'd_generic_1_28',
'd_generic_1_29',
'd_generic_1_30',
'd_generic_1_31',
'd_generic_1_32',
'd_generic_1_33',
'd_generic_1_34',
'd_generic_1_35',
'd_generic_1_36',
'd_generic_1_37',
'd_generic_1_38',
'd_generic_1_39',
'd_generic_1_40',
'd_generic_1_41',
'd_generic_1_42',
'd_generic_1_43',
'd_generic_1_44',
'd_generic_1_45',
'd_generic_1_46',
'd_generic_1_47',
'd_generic_1_48',
'd_generic_1_49',
'd_generic_1_50',
'd_generic_1_51',
'd_generic_1_52',
'd_generic_1_53',
'd_generic_1_54',
'd_generic_1_55',
'd_generic_1_80',
'd_generic_1_81',
'd_generic_1_82',
'd_generic_1_83',
'd_generic_1_84',
'd_generic_1_85',
'd_generic_1_86',
'd_generic_1_87',
'd_plants_1_0',
'd_plants_1_1',
'd_plants_1_2',
'd_plants_1_3',
'd_plants_1_4',
'd_plants_1_5',
'd_plants_1_6',
'd_plants_1_7',
'd_plants_1_8',
'd_plants_1_9',
'd_plants_1_10',
'd_plants_1_11',
'd_plants_1_12',
'd_plants_1_13',
'd_plants_1_14',
'd_plants_1_15',
'd_plants_1_16',
'd_plants_1_17',
'd_plants_1_18',
'd_plants_1_19',
'd_plants_1_20',
'd_plants_1_21',
'd_plants_1_22',
'd_plants_1_23',
'd_plants_1_32',
'd_plants_1_33',
'd_plants_1_34',
'd_plants_1_35',
'd_plants_1_36',
'd_plants_1_37',
'd_plants_1_38',
'd_plants_1_39',
'd_plants_1_48',
'd_plants_1_49',
'd_plants_1_50',
'd_plants_1_51',
'd_plants_1_52',
'd_plants_1_53',
'd_plants_1_54',
'd_plants_1_55'
}

LAYERS = {
	'0_Vegetation',
	'0_Vegetation1'
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
		self:applyChanges('Random Shrub')
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

