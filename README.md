# ollama.vim

Local LLM-assisted text completion using Ollama.

<img width="485" alt="image" src="https://github.com/user-attachments/assets/a950e38c-3b3f-4c46-94fe-0d6e0f790fc6">

## Features

- Auto-suggest on cursor movement in `Insert` mode
- Toggle the suggestion manually by pressing `Ctrl+F`
- Accept a suggestion with `Tab`
- Accept the first line of a suggestion with `Shift+Tab`
- Accept the first word of a suggestion with `Ctrl+B`
- Control max text generation time
- Configure scope of context around the cursor
- Ring context with chunks from open and edited files and yanked text
- Supports very large contexts even on low-end hardware via smart context reuse
- Speculative FIM support
- Speculative Decoding support
- Display performance stats
- Better error handling and initialization checks
- Improved code completion quality with stop tokens

## Installation

### Plugin setup

- vim-plug

    ```vim
    Plug 'akashjss/ollama.vim'
    ```

- Vundle

    ```bash
    cd ~/.vim/bundle
    git clone https://github.com/akashjss/ollama.vim
    ```

    Then add `Plugin 'ollama.vim'` to your *.vimrc* in the `vundle#begin()` section.

- lazy.nvim

    ```lua
    {
        'akashjss/ollama.vim',
    }
    ```

### Plugin configuration

You can customize *ollama.vim* by setting the `g:ollama_config` variable.

Examples:

1. Configure LLM Model:

    ```vim
    " put before ollama.vim loads
    let g:ollama_config.model = "deepseek-coder-v2"
    ```

2. Disable the inline info:

    ```vim
    " put before ollama.vim loads
    let g:ollama_config = { 'show_info': 0 }
    ```

3. Same thing but setting directly

    ```vim
    let g:ollama_config.show_info = v:false
    ```

4. Disable auto FIM (Fill-In-the-Middle) completion with lazy.nvim

    ```lua
    {
        'akashjss/ollama.vim',
        init = function()
            vim.g.ollama_config = {
                auto_fim = false,
            }
        end,
    }
    ```

5. Changing accept line keymap

    ```vim
    let g:ollama_config.keymap_accept_full = "<C-S>"
    ```

### Configuration Options

The plugin supports the following configuration options:

- `endpoint`: Ollama server endpoint (default: http://127.0.0.1:11434/api/generate)
- `model`: LLM model to use (default: deepseek-coder-v2)
- `api_key`: API key for authentication (optional)
- `n_prefix`: Number of lines before cursor to include in context (default: 256)
- `n_suffix`: Number of lines after cursor to include in context (default: 64)
- `n_predict`: Maximum number of tokens to predict (default: 128)
- `t_max_prompt_ms`: Maximum time for prompt processing (default: 500)
- `t_max_predict_ms`: Maximum time for prediction (default: 1000)
- `show_info`: Show inference info (0=disabled, 1=statusline, 2=inline)
- `auto_fim`: Auto-trigger FIM on cursor movement (default: true)
- `max_line_suffix`: Max chars after cursor for auto-trigger (default: 8)
- `max_cache_keys`: Max cached completions (default: 250)
- `ring_n_chunks`: Max chunks for extra context (default: 16)
- `ring_chunk_size`: Max lines per chunk (default: 64)
- `ring_scope`: Range around cursor for gathering chunks (default: 1024)
- `ring_update_ms`: Chunk processing interval (default: 1000)
- `keymap_trigger`: Manual trigger key (default: <C-F>)
- `keymap_accept_full`: Accept full suggestion (default: <Tab>)
- `keymap_accept_line`: Accept first line (default: <S-Tab>)
- `keymap_accept_word`: Accept first word (default: <C-B>)

### Ollama setup

The plugin requires a [ollama](https://ollama.com/) server instance to be running at `g:ollama_config.endpoint`.

#### Mac OS

```bash
brew install ollama
```

#### Any other OS

Follow the installation instructions at [ollama.com](https://ollama.com/download)

### Recommended Models

The plugin works best with code-focused models. Here are some recommended models:

- `deepseek-coder-v2`: Best overall code completion model
- `codellama`: Good for general code completion
- `mistral`: Good for general text and code completion
- `neural-chat`: Good for chat and code completion

To use a model, first pull it:

```bash
ollama pull deepseek-coder-v2
```

Then configure it in your vimrc:

```vim
let g:ollama_config.model = "deepseek-coder-v2"
```

## Examples

### Using `ollama.vim` with `deepseek-coder-v2`:

<img width="1512" alt="image" src="https://github.com/user-attachments/assets/0ccb93c6-c5c5-4376-a5a3-cc99fafc5eef">

The orange text is the generated suggestion. The green text contains performance stats for the FIM request.

### Using `ollama.vim` with `codellama`:

<img width="1758" alt="image" src="https://github.com/user-attachments/assets/8f5748b3-183a-4b7f-90e1-9148f0a58883">

## Implementation details

The plugin aims to be very simple and lightweight while providing high-quality and performant local FIM completions, even on consumer-grade hardware. Key features include:

- Smart context management with ring buffer
- Efficient caching of completions
- Speculative decoding for faster responses
- Intelligent chunk selection and eviction
- Robust error handling and initialization checks

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT License
