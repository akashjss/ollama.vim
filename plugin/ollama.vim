" vim: ts=4 sts=4 expandtab
" ollama.vim - vim plugin for code completion using Ollama

" Initialize configuration with better defaults
if !exists('g:ollama_config')
    let g:ollama_config = {}
endif

" Set default values for all required configuration options
let g:ollama_config = extend({
    \ 'endpoint':           'http://127.0.0.1:11434/api/generate',
    \ 'model':             'deepseek-coder-v2',  " Default model
    \ 'api_key':            '',
    \ 'n_prefix':           256,                 " Number of lines before cursor
    \ 'n_suffix':           64,                  " Number of lines after cursor
    \ 'n_predict':          128,                 " Max tokens to predict
    \ 't_max_prompt_ms':    500,                 " Max time for prompt processing
    \ 't_max_predict_ms':   1000,                " Max time for prediction
    \ 'show_info':          2,                   " Show inference info (0=disabled, 1=statusline, 2=inline)
    \ 'auto_fim':           v:true,              " Auto-trigger FIM on cursor movement
    \ 'max_line_suffix':    8,                   " Max chars after cursor for auto-trigger
    \ 'max_cache_keys':     250,                 " Max cached completions
    \ 'ring_n_chunks':      16,                  " Max chunks for extra context
    \ 'ring_chunk_size':    64,                  " Max lines per chunk
    \ 'ring_scope':         1024,                " Range around cursor for gathering chunks
    \ 'ring_update_ms':     1000,                " Chunk processing interval
    \ 'keymap_trigger':     "<C-F>",            " Manual trigger key
    \ 'keymap_accept_full': "<Tab>",            " Accept full suggestion
    \ 'keymap_accept_line': "<S-Tab>",          " Accept first line
    \ 'keymap_accept_word': "<C-B>",            " Accept first word
    \ }, g:ollama_config, 'keep')

" register commands
call ollama#setup_commands()

" enable the plugin by default
call ollama#init()
