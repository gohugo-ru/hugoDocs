---
title: Параметры сборки
linktitle: Параметры сборки
description: Параметры сборки помогают определить, как Хьюго должен относиться к данной странице при создании сайта.
date: 2020-03-02
publishdate: 2020-03-02
keywords: [build,content,front matter, page resources]
categories: ["content management"]
menu:
  docs:
    parent: "content-management"
    weight: 31
weight: 31	#rem
draft: false
aliases: [/content/build-options/]
toc: true
---

Они хранятся в зарезервированном объекте Front Matter с именем `_build` со следующими значениями по умолчанию:

```yaml
_build:
  render: always
  list: always
  publishResources: true
```

#### render
Если `always`, страница будет рассматриваться как опубликованная, содержащая свои выделенные выходные файлы (`index.html`, и т.д.) и постоянную ссылку.

{{< new-in "0.76.0" >}} Мы расширили это свойство с логического до перечисления в Hugo 0.76.0. Допустимые значения:

never
: Страница не будет включена ни в одну коллекцию страниц.

always (default)
: Страница будет отображена на диск и получит ссылку `RelPermalink` и т.д.

link
: Страница не будет отображаться на диск, но получит ссылку `RelPermalink`.

#### list

Обратите внимание, что в Hugo 0.68.0 мы расширили это свойство с логического до перечисления.

Допустимые значения:

never
: Страница не будет включена ни в одну коллекцию страниц.

always (default)
: Страница будет включена во все коллекции страниц, например: `site.RegularPages`, `$page.Pages`.

local
: Страница будет включена в любую коллекцию _локальных_ страниц, например: `$page.RegularPages`, `$page.Pages`. Одним из вариантов использования этого может быть создание разделов с полностью управляемым, но без заголовка содержимого. {{< new-in "0.68.0" >}}

Если `true`, страница будет рассматриваться как часть коллекций проекта и, при необходимости, возвращаться методами листинга Hugo (`.Pages`, `.RegularPages` и т.д.).

#### publishResources

Если задано значение `true`, будут опубликованы [пакеты ресурсов]({{< relref "content-management/page-bundles" >}}).
Установка этого значения в false по-прежнему будет публиковать ресурсы по запросу (когда ресурс `.Permalink` или `.RelPermalink` вызывается из шаблонов), но пропускает остальные.

{{% note %}}
Любая страница, независимо от ее параметров сборки, всегда будет доступна с использованием методов [`.GetPage`]({{< relref "functions/GetPage" >}}).
{{% /note %}}

------

### Иллюстративные варианты использования

#### Не публикуемая страница

Проекту нужен файл содержимого «Кто мы» для Front Matter и тела, которые будут использоваться на главной странице, но нигде больше.

```yaml
# content/who-we-are.md`
title: Who we are
_build:
 list: false
 render: false
```

```go-html-template
{{/* layouts/index.html */}}
<section id="who-we-are">
{{ with site.GetPage "who-we-are" }}
  {{ .Content }}
{{ end }}
</section>
```

#### Листинг страниц без их публикации

Веб-сайт должен продемонстрировать несколько из сотни «отзывов», доступных в виде файлов содержимого, без публикации каких-либо из них.

Чтобы избежать установки параметров сборки для каждой характеристики, можно использовать [`cascade`]({{< relref "/content-management/front-matter#front-matter-cascade" >}}) в файле содержимого раздела отзывов.

```yaml
#content/testimonials/_index.md
title: Testimonials
# section build options:
_build:
  render: true
# children build options with cascade
cascade:
  _build:
    render: false
    list: true # default
```

```go-html-template
{{/* layouts/_defaults/testimonials.html */}}
<section id="testimonials">
{{ range first 5 .Pages }}
  <blockquote cite="{{ .Params.cite }}">
    {{ .Content }}
  </blockquote>
{{ end }}
</section>
