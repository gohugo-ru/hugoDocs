---
title: Ссылки и перекрестные ссылки
description: Шорткоды для создания ссылок на документы.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-03-31
categories: [content management]
keywords: ["cross references","references", "anchors", "urls"]
menu:
  docs:
    parent: "content-management"
    weight: 100
weight: 100	#rem
aliases: [/extras/crossreferences/]
toc: true
---

Шорткоды `ref` и `relref` отображают абсолютные и относительные постоянные ссылки на документ соответственно.

## Использование `ref` и `relref`

```go-html-template
{{</* ref "document" */>}}
{{</* ref "document#anchor" */>}}
{{</* ref "document.md" */>}}
{{</* ref "document.md#anchor" */>}}
{{</* ref "#anchor" */>}}
{{</* ref "/blog/my-post" */>}}
{{</* ref "/blog/my-post.md" */>}}
{{</* relref "document" */>}}
{{</* relref "document.md" */>}}
{{</* relref "#anchor" */>}}
{{</* relref "/blog/my-post.md" */>}}
```

Чтобы сгенерировать гиперссылку с помощью `ref` или `relref` в разметке:

```md
[About]({{</* ref "/page/about" */>}} "About Us")
```

Для шорткодов `ref` и `relref` требуется один параметр: путь к документу содержимого, с расширением файла или без него, с привязкой или без нее.

**Пути без начального символа `/` сначала разрешаются относительно текущей страницы, а затем - относительно остальной части сайта.**

Hugo выдает ошибку или предупреждение, если документ не может быть однозначно разрешен. Поведение при ошибке настраивается; Смотри ниже.

### Ссылка на другую языковую версию

Чтобы создать ссылку на версию документа на другом языке, используйте этот синтаксис:

```go-html-template
{{</* relref path="document.md" lang="ja" */>}}
```

### Получить другой формат вывода

Чтобы создать ссылку на другой формат вывода документа, используйте этот синтаксис:

```go-html-template
{{</* relref path="document.md" outputFormat="rss" */>}}
```

### Идентификаторы заголовков

При использовании типов документов Markdown Hugo генерирует идентификаторы элементов для каждого заголовка на странице. Например:

```md
## Отсылка
```

создает этот HTML:

```html
<h2 id="reference">Отсылка</h2>
```

Получите постоянную ссылку на заголовок, добавив идентификатор к пути при использовании коротких кодов `ref` или `relref`:

```go-html-template
{{</* ref "document.md#reference" */>}}
{{</* relref "document.md#reference" */>}}
```

Создайте собственный идентификатор заголовка, включив атрибут. Например:

```md
## Reference A {#foo}
## Reference B {id="bar"}
```

создает этот HTML:

```html
<h2 id="foo">Reference A</h2>
<h2 id="bar">Reference B</h2>
```

Hugo сгенерирует уникальные идентификаторы элементов, если один и тот же заголовок появляется на странице более одного раза. Например:

```md
## Reference
## Reference
## Reference
```

создает этот HTML:

```html
<h2 id="reference">Reference</h2>
<h2 id="reference-1">Reference</h2>
<h2 id="reference-2">Reference</h2>
```

## Конфигурация Ref и RelRef

Начиная с Hugo 0.45 поведение можно настроить в `config.toml`:

refLinksErrorLevel ("ERROR")
: При использовании `ref` или `relref` для разрешения ссылок на страницы и ссылка не может быть разрешена, она будет занесена в журнал с этим уровнем журнала. Допустимые значения: `ERROR` (по умолчанию) или `WARNING`. Любая `ERROR` приведет к сбою сборки (`exit -1`).

refLinksNotFoundURL
: URL-адрес, который будет использоваться в качестве заполнителя, когда ссылка на страницу не может быть найдена в `ref` или `relref`. Используется как есть.

[lists]: /templates/lists/
[output formats]: /templates/output-formats/
[shortcode]: /content-management/shortcodes/
[bfext]: /content-management/formats/#blackfriday-extensions
