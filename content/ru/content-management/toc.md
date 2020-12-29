---
title: Оглавление
linktitle: Содержание
description: Hugo может автоматически анализировать контент Markdown и создавать оглавление, которое Вы можете использовать в своих шаблонах.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: [content management]
keywords: [table of contents, toc]
menu:
  docs:
    parent: "content-management"
    weight: 130
weight: 130	#rem
draft: false
aliases: [/extras/toc/]
toc: true
---

{{% note "Уровни заголовков оглавления фиксированы" %}}

Раньше не было готового способа указать, какие уровни заголовков нужно отображать в оглавлении. [См. Соответствующее обсуждение на GitHub (#1778)](https://github.com/gohugoio/hugo/issues/1778). Таким образом, результирующий `<nav id="TableOfContents"><ul></ul></nav>` должен был начинаться с `<h1>` при извлечении из `{{.Content}}`.

Хьюго [v0.60.0](https://github.com/gohugoio/hugo/releases/tag/v0.60.0) переключился на [Goldmark](https://github.com/yuin/goldmark/) в качестве библиотеки по умолчанию для разметки, в которой улучшена и настраивается реализация оглавления. Взгляните [как настроить оглавление](/getting-started/configuration-markup/#table-of-contents) для средства визуализации Goldmark.

{{% /note %}}

## Применение

Создайте уценку, как обычно, с соответствующими заголовками. Вот пример содержания:

```
<!-- Your front matter up here -->

## Introduction

One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin.

## My Heading

He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections. The bedding was hardly able to cover it and seemed ready to slide off any moment.

### My Subheading

A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame. It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather. Drops
```

Хьюго возьмет этот Markdown и создаст оглавление из `## Introduction`, `## My Heading` и `### My Subheading`, а затем сохранит его в [переменные страницы][pagevars]`.TableOfContents`.

Встроенные переменные `.TableOfContents` выводят элемент `<nav id="TableOfContents">` с дочерним элементом `<ul>`, чьи дочерние элементы `<li>` начинаются с соответствующих заголовков HTML. Смотрите [доступные настройки](/getting-started/configuration-markup/#table-of-contents), чтобы настроить, какие уровни заголовков Вы хотите включить в оглавление.

{{% note "Table of contents not available for MMark" %}}
Документы Hugo, созданные на диалекте Markdown [MMark](/content-management/formats/#mmark), в настоящее время не отображают оглавление. Однако оглавления совместимы со всеми другими поддерживаемыми форматами Markdown.
{{% /note %}}

## Пример шаблона: базовое оглавление

Ниже приводится пример очень простого [одностраничного шаблона][single page template]:

{{< code file="layout/_default/single.html" download="single.html" >}}
{{ define "main" }}
<main>
    <article>
    <header>
        <h1>{{ .Title }}</h1>
    </header>
        {{ .Content }}
    </article>
    <aside>
        {{ .TableOfContents }}
    </aside>
</main>
{{ end }}
{{< /code >}}

## Пример шаблона: Частичное содержание оглавления

Ниже приведен [частичный шаблон][partials], который добавляет немного больше логики для управления оглавлением на уровне страницы. Предполагается, что Вы используете поле `toc` в [front matter][] Вашего контента, которое, если специально не установлено на `false`, добавит оглавление на любую страницу с `.WordCount` (смотрите [переменные страницы][pagevars]) больше 400. Этот пример также демонстрирует, как использовать [условные][conditionals] в Вашем шаблоне:

{{< code file="layouts/partials/toc.html" download="toc.html" >}}
{{ if and (gt .WordCount 400 ) (.Params.toc) }}
<aside>
    <header>
    <h2>{{.Title}}</h2>
    </header>
    {{.TableOfContents}}
</aside>
{{ end }}
{{< /code >}}

{{% note %}}
В предыдущем примере даже страницы с > 400 слов *и* `toc`, для которых не установлено значение `false`, не будут отображать оглавление, если на странице нет заголовков для переменной `{{.TableOfContents}}`.
{{% /note %}}

## Использование с AsciiDoc

Hugo поддерживает оглавление с форматом содержимого AsciiDoc.

В заголовке файла содержимого укажите директивы AsciiDoc TOC, необходимые для создания оглавления. Хьюго будет использовать сгенерированное оглавление для заполнения переменной страницы `.TableOfContents` так же, как описано для разметки. Смотрите пример ниже:

```asciidoc
// <!-- Your front matter up here -->
:toc:
// Set toclevels to be at least your hugo [markup.tableOfContents.endLevel] config key
:toclevels: 4

== Introduction

One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin.

== My Heading

He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, slightly domed and divided by arches into stiff sections. The bedding was hardly able to cover it and seemed ready to slide off any moment.

=== My Subheading

A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, gilded frame. It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. Gregor then turned to look out the window at the dull weather. Drops
```

Хьюго возьмет этот AsciiDoc и создаст оглавление и сохранит его в переменной страницы `.TableOfContents`, как описано для Markdown.

[conditionals]: /templates/introduction/#conditionals
[front matter]: /content-management/front-matter/
[pagevars]: /variables/page/
[partials]: /templates/partials/
[single page template]: /templates/single-page-templates/
