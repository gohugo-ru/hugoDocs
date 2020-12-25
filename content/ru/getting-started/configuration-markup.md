---
title: Конфигурация разметки
description: Как обрабатывать Markdown и другую конфигурацию, связанную с разметкой.
date: 2019-11-15
categories: [getting started,fundamentals]
keywords: [configuration,highlighting]
weight: 65
sections_weight: 65
slug: configuration-markup
toc: true
---

## Конфигурация разметки

{{< new-in "0.60.0" >}}

Смотрите [Goldmark](#goldmark) для настроек, связанных с обработчиком Markdown по умолчанию в Hugo.

Ниже приведены все конфигурации, связанные с разметкой в Hugo, с настройками по умолчанию:

{{< code-toggle config="markup" />}}

**Смотрите подробности в каждом разделе ниже.**

### Goldmark

[Goldmark](https://github.com/yuin/goldmark/) взят из Hugo 0.60 - библиотеки по умолчанию, используемой для Markdown. Это быстро, совместимо с [CommonMark](https://spec.commonmark.org/0.29/) и очень гибко. Обратите внимание, что набор функций Goldmark vs Blackfriday отличается; Вы много приобретаете, но и теряете что-то, но мы будем работать над устранением пробелов в следующих версиях Hugo.

Это конфигурация по умолчанию:

{{< code-toggle config="markup.goldmark" />}}

Подробнее о расширениях смотрите [этот раздел](https://github.com/yuin/goldmark/#built-in-extensions) документации Goldmark.

Пояснения к некоторым настройкам:

unsafe
: По умолчанию Goldmark не отображает необработанный HTML и потенциально опасные ссылки. Если у Вас много встроенного HTML и/или JavaScript, Вам может потребоваться включить это.

typographer
: Это расширение заменяет знаки препинания типографскими объектами, такими как [smartypants](https://daringfireball.net/projects/smartypants/).

autoHeadingIDType ("github") {{< new-in "0.62.2" >}}
: Стратегия, используемая для создания автоматических идентификаторов (имен привязок). Доступные типы: `github`, `github-ascii` и `blackfriday`. `github` создает идентификаторы, совместимые с GitHub, `github-ascii` удаляет все символы, отличные от Ascii, после нормализации акцента, а `blackfriday` заставляет идентификаторы работать так же, как с [Blackfriday](#blackfriday), движком Markdown по умолчанию до Hugo 0,60. Обратите внимание: если Goldmark является Вашим механизмом Markdown по умолчанию, эта же стратегия используется в функции шаблона [anchorize](/functions/anchorize/).

### Blackfriday

[Blackfriday](https://github.com/russross/blackfriday) был механизмом рендеринга Markdown по умолчанию для Hugo, теперь замененным на Goldmark. Но Вы все равно можете использовать его: просто установите для `defaultMarkdownHandler` значение `blackfriday` в конфигурации разметки верхнего уровня `markup`.

Это конфигурация по умолчанию:

{{< code-toggle config="markup.blackFriday" />}}

### Highlight

Это конфигурация подсветки `highlight` по умолчанию. Обратите внимание, что некоторые из этих настроек могут быть установлены для каждого блока кода, смотрите [подсветку синтаксиса](/content-management/syntax-highlighting/).

{{< code-toggle config="markup.highlight" />}}

Для стилей `style`, смотрите эти галереи:

* [Short snippets](https://xyproto.github.io/splash/docs/all.html)
* [Long snippets](https://xyproto.github.io/splash/docs/longer/all.html)

Для CSS смотрите [создание CSS-выделения синтаксиса](/content-management/syntax-highlighting/#generate-syntax-highlighter-css).

### Содержание

{{< code-toggle config="markup.tableOfContents" />}}

Эти настройки работают только для средства визуализации Goldmark:

startLevel
: Уровень заголовка, значения начинаются с 1 (`h1`), чтобы начать рендеринг оглавления.

endLevel
: Уровень заголовка включительно для остановки отображения оглавления.

ordered
: Следует ли создавать упорядоченный список вместо неупорядоченного списка.

## Хуки рендеринга разметки

{{< new-in "0.62.0" >}}

Обратите внимание, что это поддерживается только средством визуализации [Goldmark](#goldmark).

Хуки рендеринга позволяют настраиваемым шаблонам переопределять функциональность рендеринга уценки. Вы можете сделать это, создав шаблоны с базовыми именами `render-{feature}` в `layouts/_default/_markup`.

Вы также можете создать хуки для конкретного типа/раздела в `layouts/[type/section]/_markup`, например: `layouts/blog/_markup`.{{< new-in "0.71.0" >}}

В настоящее время поддерживаются следующие функции:

* `image`
* `link`
* `heading` {{< new-in "0.71.0" >}}

При необходимости вы можете определить специальные шаблоны [Формат вывода](/templates/output-formats) и [язык](/content-management/multilingual/). Ваша папка `layout` может выглядеть так:

```bash
layouts
└── _default
    └── _markup
        ├── render-image.html
        ├── render-image.rss.xml
        └── render-link.html
```

Некоторые варианты использования для вышеуказанного:

* Разрешение ссылки на ссылки с помощью `.GetPage`. Это сделало бы ссылки переносимыми, поскольку вы могли бы перевести `./my-post.md` (и аналогичные конструкции, которые будут работать на GitHub) в `/blog/2019/01/01/my-post/` и т.д.
* Добавление `target=_blank` к внешним ссылкам.
* Решение и [обработка](/content-management/image-processing/) изображения.
* Добавление [ссылок заголовка](https://remysharp.com/2014/08/08/automatic-permalinks-for-blog-posts).

### Шаблоны хуков рендеринга

Шаблоны `render-link` и `render-image` получат этот контекст:

Page
: Отображаемая [Страница](/variables/page/).

Destination
: URL-адрес.

Title
: Атрибут title.

Text
: Отображаемый текст ссылки (HTML).

PlainText
: Простой вариант вышеперечисленного.

Шаблон `render-heading` получит этот контекст:

Page
: Отображаемая [Страница](/variables/page/).

Level
: Уровень заголовка (1--6).

Anchor
: Автоматически сгенерированный html-идентификатор, уникальный для заголовка на странице.

Text
: Отображаемый текст (HTML).

PlainText
: Простой вариант вышеперечисленного.

#### Ссылка с заголовком примера разметки

```md
[Text](https://www.gohugo.io "Title")
```

Вот пример кода, как может выглядеть шаблон render-link.html:

{{< code file="layouts/_default/_markup/render-link.html" >}}
<a href="{{ .Destination | safeURL }}"{{ with .Title}} title="{{ . }}"{{ end }}{{ if strings.HasPrefix .Destination "http" }} target="_blank" rel="noopener"{{ end }}>{{ .Text | safeHTML }}</a>
{{< /code >}}

#### Пример разметки изображения

```md
![Text](https://d33wubrfki0l68.cloudfront.net/c38c7334cc3f23585738e40334284fddcaf03d5e/2e17c/images/hugo-logo-wide.svg "Title")
```

Вот пример кода, как может выглядеть шаблон render-image.html:

{{< code file="layouts/_default/_markup/render-image.html" >}}
<p class="md__image">
  <img src="{{ .Destination | safeURL }}" alt="{{ .Text }}" {{ with .Title}} title="{{ . }}"{{ end }} />
</p>
{{< /code >}}

#### Пример ссылки заголовка

Учитывая этот файл шаблона

{{< code file="layouts/_default/_markup/render-heading.html" >}}
<h{{ .Level }} id="{{ .Anchor | safeURL }}">{{ .Text | safeHTML }} <a href="#{{ .Anchor | safeURL }}">¶</a></h{{ .Level }}>
{{< /code >}}

и эта разметка

```md
### Секция А
```

Визуализированный html будет

```html
<h3 id="section-a">Секция А <a href="#section-a">¶</a></h3>
```
