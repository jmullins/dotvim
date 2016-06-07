1. Clone repo
    ```
    $ git clone --recursive https://github.com/jmullins/dotvim dotvim
    ```

2. Backup existing vim config
    ```
    $ mv ~/.vimrc ~/.vimrc.sav
    $ mv ~/.vim ~/.vim.sav
    ```
2. Link new vim config
    ```
    $ ln -s dotvim/.vimrc ~/.vimrc
    $ ln -s dotvim/.vim ~/.vim
    ```

3. Install bundles
    ```
    $ vim +PluginInstall +qall
    ```

4. Restart vim
