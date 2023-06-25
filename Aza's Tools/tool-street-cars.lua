DATA = {}
function add3d(f) DATA[#DATA+1] = f end
loadToolData 'street-cars'

dofile(scriptDirectory..'/tool-four-directions.lua')
