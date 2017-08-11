title = 'Mobs Redo mod for Minetest'
project = 'Mobs Redo'
format = 'discount'
add_language_extension('ldoc', 'lua')
not_luadoc = true
wrap = true
--boilerplate = true
ignore = true
--one = true
output = 'api'

file = {
	'api.ldoc',
}


local function italic(value)
	return '<i>' .. value .. '</i>'
end

new_type('setting', 'Configuration Settings')
new_type('notes', 'Notes')
new_type('examples', 'Examples')
custom_tags = {
	{'settype',
		title = 'Type',
		format = italic,
	},
	{'note',
		title = 'Notes',
	},
}
