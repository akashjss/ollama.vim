" vim: ts=4 sts=4 expandtab
" ollama.vim - vim plugin for code completion using Ollama

" Ensure configuration exists
if !exists('g:ollama_config')
    let g:ollama_config = {}
endif

" Set default model if not specified
if !has_key(g:ollama_config, 'model')
    let g:ollama_config.model = 'gemma3:12b'
endif

" register commands
call ollama#setup_commands()

" enable the plugin by default
call ollama#init()
