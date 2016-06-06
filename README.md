1. Clone repo
    ```
    $ git clone --recursive https://github.com/jmullins/dotvim dotvim
    ```

2. Update vim config
    ```
    $ mv ~/.vimrc ~/.vimrc.sav
    $ mv ~/.vim ~/.vim.sav
    $ cp dotvim/.vimrc ~
    $ cp -r dotvim/.vim ~
    ```

3. Install bundles
    ```
    $ vim +PluginInstall +qall
    ```

4. Restart vim
