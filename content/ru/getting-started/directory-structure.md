---
title: Структура каталогов
linktitle: Структура каталогов
description: Интерфейс командной строки Hugo формирует структуру каталогов проекта, а затем берет этот единственный каталог и использует его в качестве входных данных для создания полного веб-сайта.
date: 2017-01-02
publishdate: 2017-02-01
lastmod: 2017-03-09
categories: [getting started,fundamentals]
keywords: [source, organization, directories, каталоги, структура папок, структура, организация, исходники]
menu:
  docs:
    parent: "getting-started"
    weight: 50
weight: 50
sections_weight: 50
draft: false
aliases: [/overview/source-directory/]
toc: true
---

## Скелет нового сайта

{{< youtube sB0HLHjgQ7E >}}

Запуск генератора `hugo new site` из командной строки создаст структуру каталогов со следующими элементами:

```
.
├── archetypes
├── config.toml
├── content
├── data
├── layouts
├── static
└── themes
```


## Объяснение структуры каталогов

Ниже приводится общий обзор каждого из каталогов со ссылками на каждый из соответствующих разделов в документации Hugo.

[`archetypes`](/content-management/archetypes/)
: Вы можете создавать новые файлы содержимого в Hugo, используя команду `hugo new`.
По умолчанию Hugo будет создавать новые файлы содержимого с как минимум `date`, `title` (выводится из имени файла) и `draft = true`. Это экономит время и обеспечивает единообразие для сайтов, использующих несколько типов контента. Вы также можете создавать свои собственные [архетипы][archetypes] с настраиваемыми предварительно настроенными полями вступительного документа.

[`assets`][]
: Хранит все файлы, которые необходимо обработать [Hugo Pipes]({{< ref "/hugo-pipes" >}}). В каталог `public` будут опубликованы только те файлы, для которых используются файлы `.Permalink` или `.RelPermalink`. Примечание: каталог ресурсов по умолчанию не создается.

[`config`](/getting-started/configuration/)
: Hugo поставляется с большим количеством [директив конфигурации](/getting-started/configuration/#all-variables-yaml).
В [каталоге конфигурации](/getting-started/configuration/#configuration-directory) эти директивы хранятся в виде файлов JSON, YAML или TOML. Каждый объект корневых настроек может быть отдельным файлом и структурирован по средам разработки.
Проекты с минимальными настройками и не требующими внимания к среде могут использовать один файл `config.toml` в своем корне.

Многим сайтам может потребоваться небольшая настройка или вообще ее не нужно, но Hugo поставляется с большим количеством [директив конфигурации][] для более подробных указаний о том, как Вы хотите, чтобы Hugo создавал Ваш сайт. Примечание: по умолчанию каталог `config` не создается.

[`content`][]
: Весь контент Вашего сайта будет находиться внутри этого каталога. Каждая папка верхнего уровня в Hugo считается [раздел содержимого][content section]. Например, если на Вашем сайте три основных раздела --- `blog`, `articles` и `tutorials` --- у Вас будет три каталога в `content/blog`, `content/articles` и `content/tutorials`. Хьюго использует разделы для назначения по умолчанию [типов контента][content types].

[`data`](/templates/data-templates/)
: Этот каталог используется для хранения файлов конфигурации, которые могут быть использованы Хьюго при создании Вашего сайта. Вы можете записать эти файлы в формате YAML, JSON или TOML. В дополнение к файлам, которые Вы добавляете в эту папку, Вы также можете создавать [шаблоны данных][data templates], которые извлекаются из динамического содержимого.

[`layouts`][]
: Сохраняет шаблоны в виде файлов `.html`, которые определяют, как представления Вашего контента будут отображаться на статическом веб-сайте. Шаблоны включают [страницы списков][lists], Вашу [домашнюю страницу][homepage], [шаблоны таксономии][taxonomy templates], [частичные][partials], [одностраничные шаблоны][singles] и многое другое.

[`static`][]
: Хранит весь статический контент: изображения, CSS, JavaScript и т.д. Когда Hugo создает Ваш сайт, все ресурсы внутри Вашего статического каталога копируются как есть. Хороший пример использования папки `static` для [подтверждения права собственности на сайт в Google Search Console][searchconsole], где Вы хотите, чтобы Хьюго скопировал полный HTML-файл без изменения его содержимого.

{{% note %}}
Начиная с **Hugo 0.31** у Вас может быть несколько статических каталогов.
{{% /note %}}

resources
: Кеширует некоторые файлы для ускорения генерации. Может также использоваться авторами шаблонов для распространения встроенных файлов SASS, поэтому Вам не нужно устанавливать препроцессор. Примечание: каталог ресурсов по умолчанию не создается.


[archetypes]: /content-management/archetypes/
[configuration directives]: /getting-started/configuration/#all-variables-yaml
[`content`]: /content-management/organization/
[content section]: /content-management/sections/
[content types]: /content-management/types/
[data templates]: /templates/data-templates/
[homepage]: /templates/homepage/
[`layouts`]: /templates/
[`static`]: /content-management/static-files/
[lists]: /templates/list/
[pagevars]: /variables/page/
[partials]: /templates/partials/
[searchconsole]: https://support.google.com/analytics/answer/1142414?hl=en
[singles]: /templates/single-page-templates/
[starters]: /tools/starter-kits/
[taxonomies]: /content-management/taxonomies/
[taxonomy templates]: /templates/taxonomy-templates/
[types]: /content-management/types/
[`assets`]: {{< ref "/hugo-pipes/introduction#asset-directory" >}}
