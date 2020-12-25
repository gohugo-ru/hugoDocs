---
title: Переключение кода
description: Переключение кода - опробование и демонстрация.
date: 2018-03-16
categories: [getting started,fundamentals]
keywords: [configuration,toml,yaml,json]
weight: 60
sections_weight: 60
draft: false
toc: true
---

## Конфигурация переключателя

Это пример шорткода переключателя конфигурации.
Его цель - позволить пользователям выбрать язык конфигурации, щелкнув соответствующую вкладку. После этого каждый переключатель кода на странице будет переключен на целевой язык. Кроме того, целевой язык будет сохранен в `localStorage` пользователя, поэтому, когда они переходят на другие страницы, переключатель кода отображает их последний «переключенный» язык конфигурации.

{{% note %}}
Шорткод `code-toggler` не является внутренним шорткодом Hugo. Цель этой страницы - протестировать настраиваемую функцию, которую мы используем на этом сайте. Смотрите: https://github.com/gohugoio/gohugoioTheme/blob/master/layouts/shortcodes/code-toggle.html
{{% /note %}}

## Этот переключатель конфигурации

{{< code-toggle file="config">}}

baseURL: "https://yoursite.example.com/"
title: "My Hugo Site"
footnoteReturnLinkContents: "↩"
permalinks:
  posts: /:year/:month/:title/
params:
  Subtitle: "Hugo is Absurdly Fast!"
  AuthorName: "Jon Doe"
  GitHubUser: "spf13"
  ListOfFoo:
    - "foo1"
    - "foo2"
  SidebarRecentLimit: 5
{{< /code-toggle >}}

## Другой переключатель конфигурации

{{< code-toggle file="theme">}}

# Шаблон theme.toml для темы Hugo

name = "Hugo Theme"
license = "MIT"
licenselink = "https://github.com/budparr/gohugo.io/blob/master/LICENSE.md"
description = ""
homepage = "https://github.com/budparr/gohugo.io"
tags = ["website"]
features = ["", ""]
min_version = 0.18

[author]
  name = "Bud Parr"
  homepage = "https://github.com/budparr"

{{< /code-toggle >}}

## Два обычных блока кода

{{< code file="bf-config.toml" >}}
[blackfriday]
  angledQuotes = true
  fractions = false
  plainIDAnchors = true
  extensions = ["hardLineBreak"]
{{< /code >}}

{{< code file="bf-config.yml" >}}
blackfriday:
  angledQuotes: true
  fractions: false
  plainIDAnchors: true
  extensions:
    - hardLineBreak
{{< /code >}}
