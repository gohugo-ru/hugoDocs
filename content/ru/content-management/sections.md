---
title: Разделы контента
linktitle: Разделы
description: "Хьюго создает **дерево разделов**, соответствующее Вашему контенту."
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: [content management]
keywords: [lists,sections,content types,organization]
menu:
  docs:
    parent: "content-management"
    weight: 50
weight: 50	#rem
draft: false
aliases: [/content/sections/]
toc: true
---

**Раздел** - это набор страниц, который определяется на основе организационной структуры в каталоге `content/`.

По умолчанию все **каталоги первого уровня** в разделе `content/` образуют свои собственные разделы (**корневые разделы**).

Если пользователю необходимо определить раздел `foo` на более глубоком уровне, ему нужно создать каталог с именем `foo` с файлом `_index.md` (смотрите [связки веток][branch bundles] для получения дополнительной информации).


{{% note %}}
**Раздел** не может быть определен или переопределен параметром первичного сообщения --- он строго определяется структурой организации контента.
{{% /note %}}

## Вложенные разделы

Разделы могут быть вложены настолько глубоко, насколько Вам нужно.

```bash
content
└── blog        <-- Section, because first-level dir under content/
    ├── funny-cats
    │   ├── mypost.md
    │   └── kittens         <-- Section, because contains _index.md
    │       └── _index.md
    └── tech                <-- Section, because contains _index.md
        └── _index.md
```

**Важно понимать, что для того, чтобы дерево разделов было полностью навигационным, по крайней мере, для самого нижнего раздела требуется файл содержимого. (например, `_index.md`).**

{{% note %}}
Когда мы говорим о **разделе** в корреляции с выбором шаблона, в настоящее время это всегда только *корневой раздел* (`/blog/funny-cats/mypost/ => blog`).

Если Вам нужен конкретный шаблон для подраздела, Вам нужно настроить либо `type`, либо `layout` во front matter.
{{% /note %}}

## Пример: Навигация по хлебным крошкам

С помощью доступных [переменных и методов раздела](#section-page-variables-and-methods) Вы можете создать мощную навигацию. Одним из распространенных примеров может быть частичное отображение навигации хлебных крошек:

{{< code file="layouts/partials/breadcrumb.html" download="breadcrumb.html" >}}
<ol  class="nav navbar-nav">
  {{ template "breadcrumbnav" (dict "p1" . "p2" .) }}
</ol>
{{ define "breadcrumbnav" }}
{{ if .p1.Parent }}
{{ template "breadcrumbnav" (dict "p1" .p1.Parent "p2" .p2 )  }}
{{ else if not .p1.IsHome }}
{{ template "breadcrumbnav" (dict "p1" .p1.Site.Home "p2" .p2 )  }}
{{ end }}
<li{{ if eq .p1 .p2 }} class="active"{{ end }}>
  <a href="{{ .p1.Permalink }}">{{ .p1.Title }}</a>
</li>
{{ end }}
{{< /code >}}

## Переменные и методы страницы раздела

Смотрите также [переменные страницы](/variables/page/).

{{< readfile file="/content/en/readfiles/sectionvars.md" markdown="true" >}}

## Списки разделов контента

Hugo автоматически создаст страницы для каждого *корневого раздела*, на котором будет перечислено все содержимое этого раздела. Смотрите документацию по [шаблонам раздела][section templates] для получения подробной информации о настройке способа отображения этих страниц.

## Контент *Раздел* vs Контент *Тип*

По умолчанию все, что создано в разделе, будет использовать [контент `type`][content type], который соответствует имени *корневого раздела*. Например, Хьюго предположит, что `posts/post-1.md` имеет контент `posts` типа `type`. Если Вы используете [архитипы][archetype] для своего раздела `posts`, Hugo сгенерирует главный материал в соответствии с тем, что он находит в `archetypes/posts.md`.

[archetype]: /content-management/archetypes/
[content type]: /content-management/types/
[directory structure]: /getting-started/directory-structure/
[section templates]: /templates/section-templates/
[branch bundles]: /content-management/page-bundles/#branch-bundles
