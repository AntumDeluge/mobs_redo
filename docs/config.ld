title = 'Mobs Redo mod for Minetest'
project = 'mobs_redo'
format = 'markdown'
add_language_extension('ld', 'lua')
not_luadoc = true
wrap = true

local function tagoutput(value)
	return '<i>' .. value .. '</i>'
end

new_type('setting', 'Settings')
custom_tags = {
	{
		'default',
		format = tagoutput,
	},
	{
		'type2',
		title = 'Type',
		format = tagoutput,
	},
	{
		'dfield',
		title = 'Definition Fields',
	},
	
}

--file = {'api.ld'}
