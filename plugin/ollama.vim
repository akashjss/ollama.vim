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

" Ensure all required keys exist
for [key, value] in items(s:default_config)
    if !has_key(g:ollama_config, key)
        let g:ollama_config[key] = value
    endif
endfor

" register commands
call ollama#setup_commands()

" enable the plugin by default
call ollama#init()
