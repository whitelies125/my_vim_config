print('require config begin')

-- require 将会从 runtimepath 中指出的每个目录下的 lua 文件夹中(如果存在)搜索
require('basic_config')
require('keymaps')


print('require config end, success!')

