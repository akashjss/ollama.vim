# ollama.vim

Local LLM-assisted text completion.

<img width="485" alt="image" src="https://github.com/user-attachments/assets/a950e38c-3b3f-4c46-94fe-0d6e0f790fc6">

---

![llama vim-spec-1](https://github.com/user-attachments/assets/404ebc2a-e4b8-4119-999b-e5365ec3208d)

## Features

- Auto-suggest on cursor movement in `Insert` mode
- Toggle the suggestion manually by pressing `Ctrl+F`
- Accept a suggestion with `Tab`
- Accept the first line of a suggestion with `Shift+Tab`
- Control max text generation time
- Configure scope of context around the cursor
- Ring context with chunks from open and edited files and yanked text
- [Supports very large contexts even on low-end hardware via smart context reuse](https://github.com/ggml-org/llama.cpp/pull/9787)
- Speculative FIM support
- Speculative Decoding support
- Display performance stats

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
sample ~/.vimrc

```bash
```

Please refer to `:help ollama_config` or the [source](./autoload/ollama.vim)
for the full list of options.

### Ollama setup

The plugin requires a [ollama](https://ollama.com/) server instance to be running at [`g:ollama_config.endpoint`](https://github.com/akashjss/ollama.vim/blob/master/autoload/ollama.vim#L37).

#### Mac OS

```bash
brew install llama.cpp
```

#### Any other OS

Either build from source or use the latest binaries: https://github.com/ggml-org/llama.cpp/releases

### Ollama settings

Here are recommended settings, depending on the amount of VRAM that you have:

- More than 16GB VRAM:

  ```bash
  ollama run qwen2.5-coder
  ```

- Less than 16GB VRAM:

  ```bash
  ollama run qwen2.5-coder:3b
  ```

- Less than 8GB VRAM:

  ```bash
  ollama run qwen2.5-coder:1.5b
  ```

Use `:help ollama` for more details.

### Recommended LLMs

The plugin requires FIM-compatible models: [HF collection](https://huggingface.co/collections/ggml-org/llamavim-6720fece33898ac10544ecf9)

## Examples

<img width="1758" alt="image" src="https://github.com/user-attachments/assets/8f5748b3-183a-4b7f-90e1-9148f0a58883">

### Using `ollama.vim` on M3 Pro with `Qwen2.5-Coder 7B Q8_0`:

<img width="1512" alt="image" src="https://github.com/user-attachments/assets/0ccb93c6-c5c5-4376-a5a3-cc99fafc5eef">

The orange text is the generated suggestion. The green text contains performance stats for the FIM request: the currently used context is `15186` tokens and the maximum is `32768`. There are `30` chunks in the ring buffer with extra context (out of `64`). So far, `1` chunk has been evicted in the current session and there are `0` chunks in queue. The newly computed prompt tokens for this request were `260` and the generated tokens were `24`. It took `1245 ms` to generate this suggestion after entering the letter `c` on the current line.

### Using `ollama.vim` on M2 Ultra with `Qwen2.5-Coder 7B Q8_0`:

https://github.com/user-attachments/assets/1f1eb408-8ac2-4bd2-b2cf-6ab7d6816754

Demonstrates that the global context is accumulated and maintained across different files and showcases the overall latency when working in a large codebase.

### Another example on a small Swift code

![llama vim-swift](https://github.com/user-attachments/assets/206c8399-ff73-495d-ba67-65725138c021)

## Implementation details

The plugin aims to be very simple and lightweight and at the same time to provide high-quality and performant local FIM completions, even on consumer-grade hardware. Read more on how this is achieved in the following links:

- Initial implementation and techincal description: https://github.com/ggml-org/llama.cpp/pull/9787
- Classic Vim support: https://github.com/ggml-org/llama.cpp/pull/9995

## Other IDEs

- VS Code: https://github.com/ggml-org/llama.vscode
