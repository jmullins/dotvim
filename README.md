1. Clone repo
    ```
    $ git clone https://github.com/jmullins/dotvim dotvim
    $ cd dotvim; git submodule update --init .vim/bundle/vundle
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
    $ vim  #Open vim and run :BundleInstall
    ```

4. Restart vim
