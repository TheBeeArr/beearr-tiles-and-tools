-- Blood Tool Edited by BeeArr#8231 // https://github.com/TheBeeArr/beearr-tiles-and-tools/ // GNU General Public License v3 (GPL-3)

PLANTS = {
	'overlay_blood_floor_01_0',
	'overlay_blood_floor_01_1',
	'overlay_blood_floor_01_2',
	'overlay_blood_floor_01_3',
	'overlay_blood_floor_01_4',
	'overlay_blood_floor_01_5',
	'overlay_blood_floor_01_6',
	'overlay_blood_floor_01_7',
	'overlay_blood_floor_01_10',
	'overlay_blood_floor_01_11',
	'overlay_blood_floor_01_12',
	'overlay_blood_floor_01_13',
	'overlay_blood_floor_01_14',
	'overlay_blood_floor_01_15',
	'overlay_blood_floor_01_18',
	'overlay_blood_floor_01_19',
	'overlay_blood_floor_01_20',
	'overlay_blood_floor_01_21',
	'overlay_blood_floor_01_22',
	'overlay_blood_floor_01_23',
	'overlay_blood_floor_01_34',
	'overlay_blood_floor_01_35',
	'overlay_blood_floor_01_36',
	'overlay_blood_floor_01_37',
	'overlay_blood_floor_01_38',
	'overlay_blood_floor_01_39',
	'overlay_blood_floor_01_40',
	'overlay_blood_floor_01_41',
	'overlay_blood_floor_01_42',
	'overlay_blood_floor_01_43'
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
		self:applyChanges('Random Blood-Splash')
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

