for _, source in ipairs {
  'autocommands',
  'pack',
  'options',
  'mapping',
  'color'
} do
  local status_ok = pcall(require, source)
  if not status_ok then
    return
  end
end

