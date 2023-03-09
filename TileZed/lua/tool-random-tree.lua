-- Tree Tool Edited by BeeArr#8231 // https://github.com/TheBeeArr/beearr-tiles-and-tools/ // GNU General Public License v3 (GPL-3)
PLANTS = {
'e_americanholly_1_0',
'e_americanholly_1_1',
'e_americanholly_1_2',
'e_americanholly_1_3',
'e_canadianhemlock_1_0',
'e_canadianhemlock_1_1',
'e_canadianhemlock_1_2',
'e_canadianhemlock_1_3',
'e_virginiapine_1_0',
'e_virginiapine_1_1',
'e_virginiapine_1_2',
'e_virginiapine_1_3'
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
		self:applyChanges('Random Tree')
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

