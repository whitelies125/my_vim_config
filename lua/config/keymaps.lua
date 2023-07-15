-- 按键映射相关配置

-- 修改 <Leader> 键为空格键，默认值为反斜杠 \
vim.g.mapleader = " "

local opt_default = { noremap = true, silent = true }
local mode_i = { 'i' }

-- 插入模式映射
-- inoremap int8 int8_t
-- vim.keymap.set('i', 'int8', 'int8_t', {noremap = true, silent = true})
--
local keymaps = {
    { mode = mode_i, from = 'i8', to = 'int8_t',  opt = opt_default },
    { mode = mode_i, from = 'i16', to = 'int16_t',  opt = opt_default },
    { mode = mode_i, from = 'i32', to = 'int32_t',  opt = opt_default },
    { mode = mode_i, from = 'i8m', to = 'INT8_MAX',  opt = opt_default },
    { mode = mode_i, from = 'i16m', to = 'INT16_MAX',  opt = opt_default },
    { mode = mode_i, from = 'i32m', to = 'INT32_MAX',  opt = opt_default },

    { mode = mode_i, from = 'u8', to = 'uint8_t',  opt = opt_default },
    { mode = mode_i, from = 'u16', to = 'uint16_t',  opt = opt_default },
    { mode = mode_i, from = 'u32', to = 'uint32_t',  opt = opt_default },
    { mode = mode_i, from = 'u8m', to = 'UINT8_MAX',  opt = opt_default },
    { mode = mode_i, from = 'u16m', to = 'UINT16_MAX',  opt = opt_default },
    { mode = mode_i, from = 'u32m', to = 'UINT32_MAX',  opt = opt_default },
}

for _, v in ipairs(keymaps) do
    vim.keymap.set(v.mode, v.from, v.to, v.opt)
end
