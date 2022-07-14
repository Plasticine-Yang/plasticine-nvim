local cmp_status_ok, bufferline = pcall(require, 'bufferline')
if not cmp_status_ok then
  return
end

bufferline.setup()
