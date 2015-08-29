# stylus-skeuomorphic
![header](./images/header.png)<br>
skeuomorphic UI parts generated by stylus.

## Quick Start

### Install


```shell
npm i sylus-skeuomorphic
```

### Edit

edit `index.html` and `main.styl`.

directory structure is...

```
.
├── index.html
├── main.styl
└── node_modules
    └── stylus-skeuomorphic
        └── stylus
            ├── skeu.styl
            └── theme
                └── gray
                    ├── active.styl
                    ├── hover.styl
                    ├── material.styl
                    └── normal.styl
```


1. edit `index.html`.<br>
    ```html
    <div class="my-class">OK</div>
    ```

2. edit `main.styl` as follows.<br>
    ```stylus
    $theme_prefix = 'foobar'

    // define variables.
    $material = './node_modules/stylus-skeuomorphic/stylus/theme/gray/material.styl'
    $normal   = './node_modules/stylus-skeuomorphic/stylus/theme/gray/normal.styl'
    $hover    = './node_modules/stylus-skeuomorphic/stylus/theme/gray/hover.styl'
    $active   = './node_modules/stylus-skeuomorphic/stylus/theme/gray/active.styl'

    // make original mixins.
    @import './node_modules/stylus-skeuomorphic/stylus/skeu.styl'

    // use mixins with @extend syntax.
    .my-class
      @extend $foobar_skeu
      &:hover
        @extend $foobar_skeu_hover
      &:active
        @extend $foobar_skeu_active

    // more styles...
    .my-class
      size 200px 50px
      text-align center
      font 'sans-serif'
    ```

### Compile

compile `main.styl` file.<br>
this tutorial require global install `stylus` and `nib`.

```shell
npm i -g stylus nib
stylus -u nib main.styl
```

## API

these are stylus objects in stylus-skeuomorphic.<br>
you can use these objects in your project.

```stylus
@import 'stylus-skeuomorphic/stylus/skeu.styl'
```

### Placeholder

with `@extend` syntax.<br>
__`(pre)`__ is replaced with `$theme_prefix`.

```stylus
$theme_prefix = 'funky'

.my-class
  @extend $funky_skeu
```

#### Draw normal state

- __`$(pre)_skeu`__<br>
    draw UI defined by __`$normal`__.<br>
    ![normal](./images/normal.png)

- __`$(pre)_skeu_chain`__<br>
    as chinable both sides.<br>
    ![chain](./images/chain.png)

- __`$(pre)_skeu_chain_l`__<br>
    as chinable only left side.<br>
    ![chain left](./images/chain_l.png)

- __`$(pre)_skeu_chain_r`__<br>
    as chinable only right side.<br>
    ![chain right](./images/chain_r.png)


#### Draw hover state

- __`$(pre)_skeu_hover`__<br>
    draw UI defined by __`$hover`__.<br>

- __`$(pre)_skeu_chain_hover`__<br>
    as chinable both sides.<br>

- __`$(pre)_skeu_chain_l_hover`__<br>
    as chinable only left side.<br>

- __`$(pre)_skeu_chain_r_hover`__<br>
    as chinable only right side.<br>

#### Draw active state

- __`$(pre)_skeu_active`__<br>
    draw UI defined by __`$active`__.<br>
    ![active](./images/active.png)

### Functions

#### `bg_color()`

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


#### `circle()`<br>
add `border-radius: 50%` CSS style.<br>
![circle](./images/circle.png)

### variables

+ __`$material`__<br>
    assign the path of material defining file.<br>
    this is loaded in `skeu.styl`.
+ __`$normal`__<br>
    assign the path of normal color defining file.<br>
    this is loaded in `skeu.styl`.
+ __`$hover`__<br>
    assign the path of hover color defining file.<br>
    this is loaded in `skeu.styl`.
+ __`$active`__<br>
    assign the path of active color defining file.<br>
    this is loaded in `skeu.styl`.
+ __`$shadow_length`__<br>
    length of shadow on bottom side.
+ __`$active_depth`__<br>
    depth of depressed button when using `$(pre)_skeu_active` placeholder.

### Theme Editing

theme consists of two types of `.styl` files.<br>
one defines color, ohter defines material.

#### Color Definition<br>
you should define 5 variables.
```stylus
// theme color
$theme_color = #a9a19c

// modulation config
$lightness_mod  = -38
$saturation_mod = 0
$spin_mod       = -5deg

// text color
$txt_color = #eee
```
+ __`$theme_color`__<br>
    all colors will be generated this color to the original.
+ __`$lightness_mod`__<br>
    set the amount to modulate lightness.<br>
    normally, set this value darker.
+ __`$saturation_mod`__<br>
    set the amount to modulate saturation.
+ __`$spin_mod`__<br>
    set the amount to spin hue.<br>
    you should use 'deg' unit.
+ __`$txt_color`__<br>
    set the text color.

#### Material Definition<br>

`$duration`, `$texture`, `$texture_param`, `$texture_opacity`, `$bg_color` are optional.
```stylus
$duration        ?=  100ms
$texture         =   'flare'
$texture_param   =   5
$texture_opacity =   .3

// outer background color
$bg_color = #edded4

// $vignette_effect: 0..1
$vignette_effect = .3

// $diffusion: 0..1
$diffusion = .1

// top_reflection
$top_blend    = .25
$top_alpha    = .8
$bottom_blend = .18
$bottom_alpha = .5
```
+ __`$duration`__<br>
    set the duration of CSS transition from a state to another.
+ __`$texture`__<br>
    set the type of texture.
    * __`'image'`__<br>
        paramator: string - image url (e.g. `$texture_param = '../../images/stone.png'`).<br>
        ![texture image](./images/texture_image.png)
    * __`'flare'`__<br>
        paramator: integer - repeated times of horizontal directional changing.
    * __`'v_stripe'`__<br>
        paramator: integer - number of stripes.
    * __`'v_stripe_abs'`__<br>
        paramator: integer - number of pixels of stripe width.
    * __`'h_stripe'`__<br>
        paramator: integer - number of stripes.
    * __`'h_stripe_abs'`__<br>
        paramator: integer - number of pixels of stripe width.
    * __`'tl_stripe'`__<br>
        paramator: integer - number of stripes.
    * __`'tl_stripe_abs'`__<br>
        paramator: integer - number of pixels of stripe width. (e.g. `$texture_param = 2`)<br>
        ![texture top left stripes](./images/texture_tl_stripe.png)
    * __`'tr_stripe'`__<br>
        paramator: integer - number of stripes.
    * __`'tr_stripe_abs'`__<br>
        paramator: integer - number of pixels of stripe width.
+ __`$texture_param`__<br>
    paramator for `$texture`.<br>
    this depends on the type of `$texture`.
+ __`$texture_opacity`__<br>
    opacity of texture.<br>
    can not use when `$texute = 'image'`.
+ __`$image_size`__<br>
    set width and height of image (e.g. `$image_size = '300px 300px'`).<br>
    you can set when `$texute = 'image'`.
+ __`$bg_color`__<br>
    this color is used with `bg_color()` function.
+ __`$vignette_effect`__<br>
    opacity of vignette effect (e.g. `$vignette_effect = .9`).<br>
    ![texture top left stripes](./images/vignette.png)
+ __`$diffusion`__<br>
    opacity of white light diffusion (e.g. `$diffusion = .8`).<br>
    ![texture top left stripes](./images/diffusion.png)
+ top light reflection
    * __`$top_blend`__<br>
        the amount of white light on top side in reflection.
    * __`$top_alpha`__<br>
        hiding power to hide the background on top side in reflection.
    * __`$bottom_blend`__<br>
        the amount of white light on bottom side in reflection.
    * __`$bottom_alpha`__<br>
        hiding power to hide the background on bottom side in reflection.

### import theme
assign the path to file into `$material`, `$normal`, `$hover` and `$active`, then import `skeu.styl`.
```stylus
$theme_prefix = 'gray'
$material = './node_modules/stylus-skeuomorphic/stylus/theme/gray/material.styl' // material file
$normal   = './node_modules/stylus-skeuomorphic/stylus/theme/gray/normal.styl'   // color file
$hover    = './node_modules/stylus-skeuomorphic/stylus/theme/gray/hover.styl'    // color file
$active   = './node_modules/stylus-skeuomorphic/stylus/theme/gray/active.styl'   // color file

@import './node_modules/stylus-skeuomorphic/stylus/skeu.styl'
```

or, you can create an import file, and read it.

`import_gray.styl`
```stylus
$theme_prefix = 'gray'
$material     = './node_modules/stylus-skeuomorphic/stylus/theme/gray/material.styl'
$normal       = './node_modules/stylus-skeuomorphic/stylus/theme/gray/normal.styl'
$hover        = './node_modules/stylus-skeuomorphic/stylus/theme/gray/hover.styl'
$active       = './node_modules/stylus-skeuomorphic/stylus/theme/gray/active.styl'
```
`main.styl`
```stylus
@import './import_gray.styl'
@import './node_modules/stylus-skeuomorphic/stylus/skeu.styl'
```

## import multiple themes
import another theme that you want and `skeu.styl` with using `@import` keyword.


```stylus
@import './node_modules/stylus-skeuomorphic/examples/_import_theme/gray.styl'
@import './node_modules/stylus-skeuomorphic/stylus/skeu.styl'

// import another theme...
@import './node_modules/stylus-skeuomorphic/examples/_import_theme/pink.styl'
@import './node_modules/stylus-skeuomorphic/stylus/skeu.styl'

.gray_button
  @extend $gray_skeu
  &:hover
    @extend $gray_skeu_hover
  &:active
    @extend $gray_skeu_active

.pink_button
  @extend $pink_skeu
  &:hover
    @extend $pink_skeu_hover
  &:active
    @extend $pink_skeu_active
```
