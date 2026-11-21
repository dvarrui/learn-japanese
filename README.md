
[![Gem Version](https://badge.fury.io/rb/learn-japanese.svg)](https://badge.fury.io/rb/learn-japanese)

# Learn Japanese

`learn-japanese` helps us to learn japanese.

> WARNING: just only Hiragana (groups 1-6) for now.
>
> Every few week will be grow with more functions... at the same time I'm learning too... I hope.

## Installation

1. Install Ruby on your system.
2. Open a terminal and run `sudo gem install learn-japanese`, to install the Ruby gem.

## Usage

* Open a terminal and run `learn-japanese` command to show available functions.

```
$ ./learn-japanese 

Commands:
  learn-japanese choose          # Choose the right answer
  learn-japanese help [COMMAND]  # Describe available commands or one specific command
  learn-japanese romaji          # You have to Write Romaji for every Hiragana word
  learn-japanese short           # Write right answer
  learn-japanese sound           # Util: Write sounds and show Hiragana
  learn-japanese tree            # Print a tree of all available commands
  learn-japanese version         # Show the program version```
```

# Games

## Choose

```
$ ./learn-japanese choose

[ 1/10 ] ご, や, きゃ, す su? (1,2,3,4) 4
[ 2/10 ] にゃ, れ, ぱ, ぐ re? (1,2,3,4) 2
[ 3/10 ] だ, にゃ, ふ, ひゅ hyu? (1,2,3,4) 4
[ 4/10 ] め, じ, れ, ち me? (1,2,3,4) 3
La respuesta es め
[ 4/10 ] く, みゅ, りゅ, りょ myu? (1,2,3,4) 
```

## Short

```
$ ./learn-japanese short 

[ 1/10 ] ぱ ? ha
La respuesta es pa
[ 1/10 ] ぴ ? gi
La respuesta es pi
[ 1/10 ] た ? ta
[ 2/10 ] ぢゃ ? sha
La respuesta es dja
[ 2/10 ] ぷ ? 
```

## Romaji

```
$ ./learn-japanese romaji

[ 1/10 ] Write Romaji for おはよう: ohayou
         Buenos días (casual) (ohayou)
[ 2/10 ] Write Romaji for え: e
         pintura (e)
[ 3/10 ] Write Romaji for こんにちは: konnichiwa
         hola (konnichiwa)
[ 3/10 ] Write Romaji for おかね: okane
         dinero (okane)
[ 4/10 ] Write Romaji for あか: aka
         rojo (aka)
[ 5/10 ] Write Romaji for おかね: 
```

## Sounds

```
$ ./learn-japanese sound 

====================
SOUNDS TO HIRAGANA
Example: a i => あい （amor - ái）
====================

Write sounds ? a a ro n
Hiragana    => ああろん
Spanish     => ?
Pronounce   => ?

Write sounds ? a ka
Hiragana    => あか
Spanish     => rojo
Pronounce   => aka
```

# ANEXO

## Hiragana

> Enlaces de interés:
> * [Hiragana](https://unicode-table.com/en/blocks/hiragana/)
> * https://unicode-table.com/en/blocks/hiragana/
> * https://www.nhk.or.jp/lesson/es/letters/hiragana.html
