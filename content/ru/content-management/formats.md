---
title: Форматы контента
linktitle: Форматы контента
description: И HTML, и Markdown являются поддерживаемыми форматами контента.
date: 2017-01-10
publishdate: 2017-01-10
lastmod: 2017-04-06
categories: [content management]
keywords: [markdown,asciidoc,mmark,pandoc,content format]
menu:
  docs:
    parent: "content-management"
    weight: 20
weight: 20	#rem
draft: false
aliases: [/content/markdown-extras/,/content/supported-formats/,/doc/supported-formats/]
toc: true
---

Вы можете поместить файлы любого типа в каталоги `/content`, но Hugo использует начальное значение `markup`, если установлено, или расширение файла (смотрите `Markup identifiers` в таблице ниже), чтобы определить, нужно ли обрабатывать разметку, например:

* Markdown преобразован в HTML
* Обработка [Шорткодов](/content-management/shortcodes/)
* Примененный макет

## Список форматов контента

Текущий список форматов контента в хьюго:

| Название | Идентификаторы разметки | Комментарий |
| ------------- | ------------- |-------------|
| Goldmark | md, markdown, goldmark | Обратите внимание, что Вы можете установить обработчик по умолчанию для `md` и` markdown` на что-нибудь другое, смотрите [настройку разметки](/getting-started/configuration-markup/).{{< new-in "0.60.0" >}} |
| Blackfriday | blackfriday | Поддержка Blackfriday в со временем будет прекращена. |
| MMark | mmark | Mmark устарел и будет удален в следующем выпуске. |
| Emacs Org-Mode | org | Смотрите [go-org](https://github.com/niklasfasching/go-org). |
| AsciiDoc | asciidocext, adoc, ad | Необходим установленный [Asciidoctor][ascii]. |
| RST | rst | Необходим установленный [RST](http://docutils.sourceforge.net/rst.html). |
| Pandoc | pandoc, pdc | Необходим установленный [Pandoc](https://www.pandoc.org/). |
| HTML | html, htm | Чтобы его можно было рассматривать как файл содержимого с макетом, шорткодами и т.д., он должен иметь предварительную информацию. В противном случае он будет скопирован как есть. |

`markup identifier` извлекается либо из переменной `markup` в начале, либо из расширения файла. Для конфигурации, связанной с разметкой, смотрите [Настройка разметки](/getting-started/configuration-markup/).

## Внешние помощники

Для некоторых форматов, указанных в таблице выше, на Вашем компьютере должны быть установлены внешние помощники. Например, для файлов AsciiDoc Хьюго попытается вызвать команду `asciidoctor`. Это означает, что Вам необходимо установить соответствующий инструмент на свой компьютер, чтобы использовать эти форматы.

По умолчанию Хьюго передает этим внешним помощникам разумные аргументы по умолчанию:

- `asciidoctor`: `--no-header-footer -`
- `rst2html`: `--leave-comments --initial-header-level=2`
- `pandoc`: `--mathjax`

{{% warning "Performance of External Helpers" %}}
Поскольку дополнительные форматы являются внешними командами, производительность генерации будет в значительной степени зависеть от производительности внешнего инструмента, который Вы используете. Поскольку эта функция все еще находится в зачаточном состоянии, отзывы приветствуются.
{{% /warning %}}

### Внешний помощник AsciiDoc

[AsciiDoc](https://github.com/asciidoc/asciidoc) реализация EOLs в январе 2020 г. и больше не поддерживается.
Разработка AsciiDoc продолжается в [Asciidoctor](https://github.com/asciidoctor). Формат AsciiDoc
остается конечно. Продолжайте реализацию Asciidoctor.

### Внешний помощник Asciidoctor

Сообщество Asciidoctor предлагает широкий набор инструментов для формата AsciiDoc, которые можно установить дополнительно к Hugo.
[Смотрите инструкции по установке в документации Asciidoctor](https://asciidoctor.org/docs/install-toolchain/). Убедитесь, что при необходимости установлены все дополнительные расширения, такие как `asciidoctor-diagram` или `asciidoctor-html5s`.

{{% note %}}
Внешняя команда `asciidoctor` требует рендеринга Hugo на _диск_ в конкретный целевой каталог. Требуется запустить Hugo с параметром команды `--destination`.
{{% /note %}}

Некоторые параметры [Asciidoctor](https://asciidoctor.org/man/asciidoctor/) можно настроить в Hugo:

Параметр | Комментарий
--- | ---
backend | Не меняйте это, если Вы не знаете, что делаете.
doctype | В настоящее время в Hugo поддерживается только тип документа `article`.
extensions | Возможные расширения: `asciidoctor-html5s`, `asciidoctor-bibtex`, `asciidoctor-diagram`, `asciidoctor-interdoc-reftext`, `asciidoctor-katex`, `asciidoctor-latex`, `asciidoctor-mathematical`, `asciidoctor-question`, `asciidoctor-rouge`.
attributes | Переменные, на которые следует ссылаться в Вашем файле AsciiDoc. Это список отображений имен и значений переменных. Смотрите [атрибуты Asciidoctor](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/#attributes-and-substitutions).
noHeaderOrFooter | Выведите встраиваемый документ, исключая заголовок, нижний колонтитул и все, что находится за пределами тела документа. Не меняйте это, если Вы не знаете, что делаете.
safeMode | Уровень безопасного режима `unsafe`, `safe`, `server` или `secure`. Не меняйте это, если вы не знаете, что делаете.
sectionNumbers | Авто-нумерация заголовков разделов.
verbose | Подробно распечатайте информацию об обработке и проверках файла конфигурации в stderr.
trace | Включите информацию об ошибках.
failureLevel | Минимальный уровень ведения журнала, при котором запускается ненулевой код выхода (сбой).

Hugo предоставляет дополнительные настройки, которые не сопоставляются напрямую с параметрами интерфейса командной строки Asciidoctor:

workingFolderCurrent
: Устанавливает рабочий каталог таким же, как и у обрабатываемого файла AsciiDoc, так что [включение](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/#include-files) будет работать с относительными путями. Этот параметр использует `asciidoctor` cli параметр `--base-dir` и атрибут `outdir=`. Для отображения диаграмм с [asciidoctor-diagram](https://asciidoctor.org/docs/asciidoctor-diagram/), `workingFolderCurrent` должно быть установлено значение `true`.

preserveTOC
: По умолчанию Hugo удаляет оглавление, созданное Asciidoctor, и предоставляет его с помощью встроенной переменной [`.TableOfContents`](/content-management/toc/), чтобы обеспечить дальнейшую настройку и лучшую интеграцию с различными темами Hugo. Для этой опции можно установить значение `true`, чтобы сохранить содержание Asciidoctor на сгенерированной странице.

Ниже приведены все настройки, связанные с AsciiDoc в Hugo, со значениями по умолчанию:

{{< code-toggle config="markup.asciidocExt" />}}

Пример того, как установить расширения и атрибуты:

```
[markup.asciidocExt]
    extensions = ["asciidoctor-html5s", "asciidoctor-diagram"]
    workingFolderCurrent = true
    [markup.asciidocExt.attributes]
        my-base-url = "https://example.com/"
        my-attribute-name = "my value"
```

В сложной среде Asciidoctor иногда бывает полезно отладить точный вызов Вашего внешнего помощника со всеми параметрами. Запустите Hugo с `-v`. Вы получите результат вроде

```
INFO 2019/12/22 09:08:48 Rendering book-as-pdf.adoc with C:\Ruby26-x64\bin\asciidoctor.bat using asciidoc args [--no-header-footer -r asciidoctor-html5s -b html5s -r asciidoctor-diagram --base-dir D:\prototypes\hugo_asciidoc_ddd\docs -a outdir=D:\prototypes\hugo_asciidoc_ddd\build -] ...
```

## Изучение разметки

Синтаксис Markdown достаточно прост, чтобы изучить его за один присест. Ниже приведены отличные ресурсы, которые помогут Вам начать работу:

* [Дерзкий огненный шар: Markdown, Джон Грубер (создатель Markdown)][fireball]
* [Шпаргалка по Markdown, Адам Притчард][mdcheatsheet]
* [Учебное пособие по Markdown (интерактивное), Гарен Торикян][mdtutorial]
* [Руководство по Markdown, Мэтт Коун][mdguide]

[`emojify` function]: /functions/emojify/
[ascii]: https://asciidoctor.org/
[bfconfig]: /getting-started/configuration/#configuring-blackfriday-rendering
[blackfriday]: https://github.com/russross/blackfriday
[mmark]: https://github.com/miekg/mmark
[config]: /getting-started/configuration/
[developer tools]: /tools/
[emojis]: https://www.webpagefx.com/tools/emoji-cheat-sheet/
[fireball]: https://daringfireball.net/projects/markdown/
[gfmtasks]: https://guides.github.com/features/mastering-markdown/#syntax
[helperssource]: https://github.com/gohugoio/hugo/blob/77c60a3440806067109347d04eb5368b65ea0fe8/helpers/general.go#L65
[hl]: /content-management/syntax-highlighting/
[hlsc]: /content-management/shortcodes/#highlight
[hugocss]: /css/style.css
[ietf]: https://tools.ietf.org/html/
[mathjaxdocs]: https://docs.mathjax.org/en/latest/
[mdcheatsheet]: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet
[mdguide]: https://www.markdownguide.org/
[mdtutorial]: https://www.markdowntutorial.com/
[Miek Gieben's website]: https://miek.nl/2016/march/05/mmark-syntax-document/
[mmark]: https://github.com/mmarkdown/mmark
[org]: https://orgmode.org/
[pandoc]: https://www.pandoc.org/
[Pygments]: https://pygments.org/
[rest]: https://docutils.sourceforge.io/rst.html
[sc]: /content-management/shortcodes/
[sct]: /templates/shortcode-templates/
