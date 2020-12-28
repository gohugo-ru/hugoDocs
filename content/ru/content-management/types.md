---
title: Типы контента
description: Hugo построен на содержании, организованном по разделам.
date: 2017-02-01
categories: [content management]
keywords: [lists,sections,content types,types,organization]
menu:
  docs:
    parent: "content-management"
    weight: 60
weight: 60	#rem
draft: false
aliases: [/content/types]
toc: true
---

**Тип контента** - это способ организации Вашего контента. Hugo определяет тип контента либо из `type` в front matter, либо, если не установлен, из первого каталога в пути к файлу. Например, `content/blog/my-first-event.md` будет контент типа `blog`, если не задан тип `type`.

Тип контента используется для

* Определите, как отображается контент. Смотрите [порядок поиска шаблонов](/templates/lookup-order/) и [представления контента](https://gohugo.io/templates/views) для получения дополнительной информации.
* Определите, какой [архетип](/content-management/archetypes/) шаблон использовать для нового контента.
