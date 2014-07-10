{spawn, exec} = require 'child_process'
os = require 'os'

cmd = (name) ->
	if os.platform() is 'win32' then name + '.cmd' else name

npm = cmd 'npm'
brunch = cmd 'brunch'
forever = cmd 'forever'
nodemon = cmd 'nodemon'
bower = cmd 'bower'

task 'install', 'Install dependencies', ->
	spawn npm, ['install'], {cwd: '', stdio: 'inherit'}
	spawn bower, ['install'], {cwd: '', stdio: 'inherit'}

task 'update', 'Update dependencies', ->
	spawn npm, ['update'], {cwd: '', stdio: 'inherit'}
	spawn bower, ['update'], {cwd: '', stdio: 'inherit'}

task 'watch', 'Launch application (development mode)', ->
	client = spawn brunch, ['watch', '--server'], {stdio: 'inherit'}