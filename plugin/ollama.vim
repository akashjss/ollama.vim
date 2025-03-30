" vim: ts=4 sts=4 expandtab
" ollama.vim - vim plugin for code completion using Ollama

" Initialize configuration with better defaults
if !exists('g:ollama_config')
    let g:ollama_config = {}
endif

" Set default values for all required configuration options
let g:ollama_default_config = {
    \ 'endpoint': 'http://127.0.0.1:11434/api/generate',
    \ 'model': 'gemma3:12b',  " Using gemma3:12b as default since it's available
    \ 'api_key': '',
    \ 'n_prefix': 256,
    \ 'n_suffix': 64,
    \ 'n_predict': 128,
    \ 't_max_prompt_ms': 500,
    \ 't_max_predict_ms': 1000,
    \ 'show_info': 2,
    \ 'auto_fim': v:true,
    \ 'max_line_suffix': 8,
    \ 'max_cache_keys': 250,
    \ 'ring_n_chunks': 16,
    \ 'ring_chunk_size': 64,
    \ 'ring_scope': 1024,
    \ 'ring_update_ms': 1000,
    \ 'keymap_trigger': '<C-F>',
    \ 'keymap_accept_full': '<Tab>',
    \ 'keymap_accept_line': '<S-Tab>',
    \ 'keymap_accept_word': '<C-B>'
    \ }

" Merge defaults with existing config
for [key, value] in items(g:ollama_default_config)
    if !has_key(g:ollama_config, key)
        let g:ollama_config[key] = value
    endif
endfor

" register commands
call ollama#setup_commands()

" enable the plugin by default
call ollama#init()
