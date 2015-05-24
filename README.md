# stylus-skeuomorphic
![header](./images/header.png)<br>
skeuomorphic UI parts generated by stylus.

## quick start

### before installation

stylus-skeuomorphic require __Node.js__ and __Gulp__.

[__Node.js: nodejs.org__](https://nodejs.org)

install Gulp after Node.js installation.

```shell
npm install -g gulp
```

### install

1. clone repository.
    ```shell
    git clone https://github.com/all-user/stylus-skeuomorphic.git
    ```

2. go into the directory.
    ```shell
    cd stylus-skeuomorphic
    ```

3. install npm packages.
    ```shell
    npm install
    ```

### edit

edit `index.html` and `main.styl`.

1. make new directory in `./examples`.
    ```shell
    cd examples
    mkdir my_example
    ```

2. make `index.html` and `main.styl`.
    ```shell
    cd my_example
    touch index.html main.styl
    ```

3. edit `index.html` as follows.
    ```html
    <!doctype html>
    <html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="main.css">
    </head>
    <body>
        <div class="my-class">hello world!</div>
    </body>
    </html>
    ```

4. edit `main.styl` as follows.
    ```stylus
    $skeu_prefix = 'my'
    @import '../path_to_theme/gray.styl'
    @import '../../stylus/skeu.styl'

    body
      bg_color()
      margin 20%

    .my-class
      @extend $my_skeu
      padding .5em
      font-size 50px
      font-family sans-serif
      &:hover
        @extend $my_skeu_hover
      &:active
        @extend $my_skeu_active
    ```

### compile

compile `main.styl` files in `./examples/**`.

```shell
gulp stylus
```

preview `index.html`.

```shell
open index.html
```

## API

these are stylus objects in stylus-skeuomorphic.<br>
you can use these objects in your project.

```stylus
@import 'stylus-skeuomorphic/stylus/skeu.styl'
```

### Placeholder

use __`@extend`__ keyword to use placeholder.<br>
__`(pre)`__ is replaced __`$skeu_prefix`__.<br>
you should assign any strings to __`$skeu_prefix`__ before importing skeu.styl.

```stylus
$skeu_prefix = 'my'
@import 'stylus-skeuomorphic/examples/path_to_theme/gray.styl'
@import 'stylus-skeuomorphic/stylus/skeu.styl'

.my-class
  @extend $my_skeu
```

+ draw __`$usual`__ placeholders

    - __`$(pre)_skeu`__<br>
        draw UI defined by __`$usual`__.<br>
        ![usual](./images/usual.png)

    - __`$(pre)_skeu_chain`__<br>
        as chinable both sides.<br>
        ![usual](./images/chain.png)

    - __`$(pre)_skeu_chain_l`__<br>
        as chinable only left side.<br>
        ![usual](./images/chain_l.png)

    - __`$(pre)_skeu_chain_r`__<br>
        as chinable only right side.<br>
        ![usual](./images/chain_r.png)


+ draw __`$hover`__ placeholders

    - __`$(pre)_skeu_hover`__<br>
        draw UI defined by __`$hover`__.<br>
        ![usual](./images/hover.png)

    - __`$(pre)_skeu_chain_hover`__<br>
        as chinable both sides.<br>
        ![usual](./images/chain_hover.png)

    - __`$(pre)_skeu_chain_l_hover`__<br>
        as chinable only left side.<br>
        ![usual](./images/chain_l_hover.png)

    - __`$(pre)_skeu_chain_r_hover`__<br>
        as chinable only right side.<br>
        ![usual](./images/chain_r_hover.png)

+ draw __`$active`__ placeholder

    - __`$(pre)_skeu_active`__<br>
        draw UI defined by __`$active`__.<br>
        ![usual](./images/active.png)

### Functions

+ __`bg_color()`__<br>
    draw color defined by __`$bg_color`__ to `background` .<br>
    stylus<br>
    ```stylus
    body
      bg_color()
    ```
    css<br>
    ```css
    body {
        background: #edded4;
    }
    ```


+ __`circle()`__<br>
    add `border-radius: 50%` CSS style.<br>
    ![usual](./images/circle.png)

### Variables

