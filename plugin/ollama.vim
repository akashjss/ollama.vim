" vim: ts=4 sts=4 expandtab
" ollama.vim - vim plugin for code completion using Ollama

" Initialize configuration with better defaults
if !exists('g:ollama_config')
    let g:ollama_config = {}
endif

" Using gemma3:12b as default since it's available
let g:ollama_config.endpoint = get(g:ollama_config, 'endpoint', 'http://127.0.0.1:11434/api/generate')
let g:ollama_config.model = get(g:ollama_config, 'model', 'gemma3:12b')
let g:ollama_config.api_key = get(g:ollama_config, 'api_key', '')
let g:ollama_config.n_prefix = get(g:ollama_config, 'n_prefix', 256)
let g:ollama_config.n_suffix = get(g:ollama_config, 'n_suffix', 64)
let g:ollama_config.n_predict = get(g:ollama_config, 'n_predict', 128)
let g:ollama_config.t_max_prompt_ms = get(g:ollama_config, 't_max_prompt_ms', 500)
let g:ollama_config.t_max_predict_ms = get(g:ollama_config, 't_max_predict_ms', 1000)
let g:ollama_config.show_info = get(g:ollama_config, 'show_info', 2)
let g:ollama_config.auto_fim = get(g:ollama_config, 'auto_fim', v:true)
let g:ollama_config.max_line_suffix = get(g:ollama_config, 'max_line_suffix', 8)
let g:ollama_config.max_cache_keys = get(g:ollama_config, 'max_cache_keys', 250)
let g:ollama_config.ring_n_chunks = get(g:ollama_config, 'ring_n_chunks', 16)
let g:ollama_config.ring_chunk_size = get(g:ollama_config, 'ring_chunk_size', 64)
let g:ollama_config.ring_scope = get(g:ollama_config, 'ring_scope', 1024)
let g:ollama_config.ring_update_ms = get(g:ollama_config, 'ring_update_ms', 1000)
let g:ollama_config.keymap_trigger = get(g:ollama_config, 'keymap_trigger', '<C-F>')
let g:ollama_config.keymap_accept_full = get(g:ollama_config, 'keymap_accept_full', '<Tab>')
let g:ollama_config.keymap_accept_line = get(g:ollama_config, 'keymap_accept_line', '<S-Tab>')
let g:ollama_config.keymap_accept_word = get(g:ollama_config, 'keymap_accept_word', '<C-B>')

" register commands
call ollama#setup_commands()

" enable the plugin by default
call ollama#init()
