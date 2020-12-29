---
title: Подсветка синтаксиса
description: Hugo поставляется с действительно быстрой подсветкой синтаксиса от Chroma.
date: 2017-02-01
publishdate: 2017-02-01
keywords: [highlighting,chroma,code blocks,syntax]
categories: [content management]
menu:
  docs:
    parent: "content-management"
    weight: 300
weight: 20
sections_weight: 20
draft: false
aliases: [/extras/highlighting/,/extras/highlight/,/tools/syntax-highlighting/]
toc: true
---

Хьюго использует [Chroma](https://github.com/alecthomas/chroma) в качестве подсветки кода; он построен на Go и действительно очень быстр - и по наиболее важным частям совместим с Pygments, который мы использовали раньше.

## Настройка выделения синтаксиса

Смотрите [настройка выделения](/getting-started/configuration-markup#highlight).

## Генерация синтаксиса подсветки CSS

Если Вы работаете с `pygmentsUseClasses=true` в конфигурации Вашего сайта, Вам понадобится таблица стилей.

Вы можете создать ее с помощью Hugo:

```bash
hugo gen chromastyles --style=monokai > syntax.css
```

Запустите `hugo gen chromastyles -h` для получения дополнительных опций. Смотрите https://xyproto.github.io/splash/docs/ для галереи доступных стилей.

## Подсветка шорткода

Подсветка осуществляется с помощью [встроенного шорткода](/content-management/shortcodes/) `highlight`. `highlight` принимает ровно один обязательный параметр для выделения языка программирования и требует закрывающего шорткода. Обратите внимание, что `highlight` *не* используется для выделения javascript на стороне клиента.

Параметры:

* `linenos`: настроить номера строк. Допустимые значения: `true`, `false`, `table` или `inline`. `false` отключит номера строк, если он настроен для включения в конфигурации сайта. {{< new-in "0.60.0" >}} `table` предоставит блоки кода, удобные для копирования и вставки.
* `hl_lines`: перечисляет набор номеров строк или диапазонов номеров строк, которые необходимо выделить.
* `linenostart=199`: начинает отсчет номеров строк с 199.
* `anchorlinenos`: Настроить якоря для номеров строк. Допустимые значения: `true` или `false`;
* `lineanchors`: Настройте префикс для якорей в номерах строк. Будет иметь суффикс `-`, поэтому ссылка на строку номер 1 с опцией `lineanchors=prefix` добавляет к странице привязку `prefix-1`.

### Пример: Подсветка шорткода

```
{{</* highlight go "linenos=table,hl_lines=8 15-17,linenostart=199" */>}}
// ... code
{{</* / highlight */>}}
```

Дает следующее:

{{< highlight go "linenos=table,hl_lines=8 15-17,linenostart=199" >}}
// GetTitleFunc returns a func that can be used to transform a string to
// title case.
//
// The supported styles are
//
// - "Go" (strings.Title)
// - "AP" (see https://www.apstylebook.com/)
// - "Chicago" (see https://www.chicagomanualofstyle.org/home.html)
//
// If an unknown or empty style is provided, AP style is what you get.
func GetTitleFunc(style string) func(s string) string {
  switch strings.ToLower(style) {
  case "go":
    return strings.Title
  case "chicago":
    return transform.NewTitleConverter(transform.ChicagoStyle)
  default:
    return transform.NewTitleConverter(transform.APStyle)
  }
}
{{< / highlight >}}

## Подсветка шаблона функции

Смотрите [подсветка](/functions/highlight/).

## Подсветка в ограничениях кода

По умолчанию выделение в границах кода включено. {{< new-in "0.60.0" >}}

````
```go {linenos=table,hl_lines=[8,"15-17"],linenostart=199}
// ... code
```
````

Дает следующее:

```go {linenos=table,hl_lines=[8,"15-17"],linenostart=199}
// GetTitleFunc returns a func that can be used to transform a string to
// title case.
//
// The supported styles are
//
// - "Go" (strings.Title)
// - "AP" (see https://www.apstylebook.com/)
// - "Chicago" (see https://www.chicagomanualofstyle.org/home.html)
//
// If an unknown or empty style is provided, AP style is what you get.
func GetTitleFunc(style string) func(s string) string {
  switch strings.ToLower(style) {
  case "go":
    return strings.Title
  case "chicago":
    return transform.NewTitleConverter(transform.ChicagoStyle)
  default:
    return transform.NewTitleConverter(transform.APStyle)
  }
}
```

{{< new-in "0.60.0" >}} Обратите внимание, что только Goldmark поддерживает передачу атрибутов, таких как `hl_lines`, и важно, чтобы он не содержал пробелов. Смотрите [goldmark-highlighting](https://github.com/yuin/goldmark-highlighting) для получения дополнительной информации.

Параметры такие же, как и в [highlighting shortcode](/content-management/syntax-highlighting/#highlight-shortcode), включая `linenos=false`, но обратите внимание на немного другой синтаксис атрибута Markdown.

## Список языков выделения цветности

Полный список лексеров Chroma и их псевдонимов (который является идентификатором, используемым в функции шаблона `highlight` или при выделении в ограждениях кода):

{{< chroma-lexers >}}

[Prism]: https://prismjs.com
[prismdownload]: https://prismjs.com/download.html
[Highlight.js]: https://highlightjs.org/
[Rainbow]: https://craig.is/making/rainbows
[Syntax Highlighter]: https://alexgorbatchev.com/SyntaxHighlighter/
[Google Prettify]: https://github.com/google/code-prettify
[Yandex]: https://yandex.ru/
