Vim Configuration
===================



About
-------------------

My own personal vim configuration; includes most standard features such as ruler, number, and hlsearch etc.
It does not use any plugins.
It is mostly configured to easily write/compile/run Python, Java, and C++ code as well as LaTeX editing.
It is intended for use on Unix machines only. 
Includes the  [Gotham](https://github.com/whatyouhide/vim-gotham "vim-gotham") theme.

```
$ git clone https://github.com/albertxie/vimrc.git ~/ 
```
To get a more comprehensive list of colorschemes, you may wish to include
[this](https://github.com/flazz/vim-colorschemes "flazz/vim-colorscheme").
```
$ git clone https://github.com/flazz/vim-colorschemes.git ~/.vim
```

Mappings
-------------------
#### General
* **jkl** in sequential order to escape
* **,** as leader
* **leader + w** as save
* **leader + q** to quit
* **leader + space** to clear last query
* **leader + arrow key** to resize a split window
* **F2** to add current file to an existing git repository


#### Python
* **F5** to run in Python3.x
* **F7** to run in Python2.x
* Highlights the 79 character
* shows whitespace
* uses 4 spaces as tab

#### Java
* **F5** to compile
* **F6** to run

#### C++
* **F5** to compile
* **F6** to run

#### LaTeX
* **F5** to compile to PDF
