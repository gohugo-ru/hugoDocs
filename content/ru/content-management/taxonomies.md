---
title: Таксономии
linktitle:
description: Hugo включает поддержку пользовательских таксономий.
date: 2017-02-01
publishdate: 2017-02-01
keywords: [taxonomies,metadata,front matter,terms]
categories: [content management]
menu:
  docs:
    parent: "content-management"
    weight: 80
weight: 80	#rem
draft: false
aliases: [/taxonomies/overview/,/taxonomies/usage/,/indexes/overview/,/doc/indexes/,/extras/indexes]
toc: true
---

## Что такое таксономия?

Hugo включает поддержку определяемых пользователем групп контента, называемых **таксономиями**. Таксономии - это классификации логических отношений между контентом.

### Определения

Taxonomy
: категоризация, которая может использоваться для классификации контента

Term
: ключ в таксономии

Value
: часть содержания, присвоенная термину

## Пример таксономии: веб-сайт фильмов

Предположим, Вы создаете сайт о фильмах. Вы можете включить следующие таксономии:

* Actors
* Directors
* Studios
* Genre
* Year
* Awards

Затем в каждом из фильмов вы должны указать термины для каждой из этих таксономий (т.е., в [front matter][] каждого файла с содержанием фильма). Исходя из этих условий, Хьюго будет автоматически создавать страницы для каждого Актера, Режиссера, Студии, Жанра, Года и Премии, в каждом из которых будут перечислены все Фильмы, соответствующие конкретному Актеру, Режиссеру, Студии, Жанру, Году и Награде.

### Организация по классификации фильмов

Чтобы продолжить пример сайта с фильмами, следующее демонстрирует отношения контента с точки зрения таксономии:

```
Actor                    <- Taxonomy
    Bruce Willis         <- Term
        The Sixth Sense  <- Value
        Unbreakable      <- Value
        Moonrise Kingdom <- Value
    Samuel L. Jackson    <- Term
        Unbreakable      <- Value
        The Avengers     <- Value
        xXx              <- Value
```

С точки зрения контента отношения выглядят иначе, хотя используемые данные и метки одинаковы:

```
Unbreakable                 <- Value
    Actors                  <- Taxonomy
        Bruce Willis        <- Term
        Samuel L. Jackson   <- Term
    Director                <- Taxonomy
        M. Night Shyamalan  <- Term
    ...
Moonrise Kingdom            <- Value
    Actors                  <- Taxonomy
        Bruce Willis        <- Term
        Bill Murray         <- Term
    Director                <- Taxonomy
        Wes Anderson        <- Term
    ...
```

## Значения по умолчанию для таксономии Hugo {#default-taxonomies}

Hugo изначально поддерживает таксономии.

Не добавляя ни одной строчки в Ваш файл [конфигурации сайта][config], Hugo автоматически создаст таксономии для тегов `tags` и категорий `categories`. Это будет то же самое, что вручную [настройка ваших таксономий](#configuring-taxonomies), как показано ниже:

{{< code-toggle copy="false" >}}
[taxonomies]
  tag = "tags"
  category = "categories"
{{</ code-toggle >}}

Если Вы не хотите, чтобы Hugo создавал какие-либо таксономии, установите для параметра `disableKinds` в Вашем [конфигурации сайта][config] следующее:

{{< code-toggle copy="false" >}}
disableKinds = ["taxonomy","term"]
{{</ code-toggle >}}

{{< new-in "0.73.0" >}} Мы исправили ранее запутанные типы страниц, используемые для таксономий (см. Список ниже), чтобы они соответствовали терминам, используемым, когда мы говорим о таксономиях. Мы были осторожны, чтобы избежать поломки сайта, и Вы должны получить ОШИБКУ в консоли, если Вам нужно настроить раздел `disableKinds`.

{{% page-kinds %}}

### Назначения по умолчанию

Когда используются таксономии --- и предоставляются [шаблоны таксономии][taxonomy templates], Hugo автоматически создает как страницу со списком всех терминов таксономии, так и отдельные страницы со списками контента, связанного с каждым термином. Например, таксономия `categories`, объявленная в Вашей конфигурации и используемая в Вашем информационном фронте, создаст следующие страницы:

* Одна страница в `example.com/categories/`, на которой перечислены все [термины в таксономии][terms within the taxonomy]
* [Индивидуальные страницы списка таксономии][taxonomy templates] (например, `/categories/development/`) для каждого из терминов, которые показывают список всех страниц, отмеченных как часть этой таксономии в [front matter][]

## Настройка таксономии {#configuring-taxonomies}

Пользовательские таксономии, отличные от [по умолчанию](#default-taxonomies), должны быть определены в Вашей [конфигурации сайта][config], прежде чем их можно будет использовать на всем сайте. Для каждой таксономии необходимо указать метки множественного и единственного числа. Например, `singular key = "plural value"` для TOML и `singular key: "plural value"` для YAML.

### Пример: Добавление настраиваемой таксономии под названием "series"

{{% note %}}
При добавлении пользовательских таксономий Вам необходимо также добавить таксономии по умолчанию, _если Вы хотите их сохранить_.
{{% /note %}}

{{< code-toggle copy="false" >}}
[taxonomies]
  tag = "tags"
  category = "categories"
  series = "series"
{{</ code-toggle >}}

### Пример: Удаление таксономий по умолчанию

Если Вы хотите иметь только стандартную таксономию `tags` и удалить таксономию `categories` для Вашего сайта, Вы можете сделать это, изменив значение `taxonomies` в Вашей [конфигурации сайта][config].

{{< code-toggle copy="false" >}}
[taxonomies]
  tag = "tags"
{{</ code-toggle >}}

Если Вы хотите полностью отключить все таксономии, смотрите использование `disableKinds` в [Значения по умолчанию для таксономии Hugo](#default-taxonomies).

{{% note %}}
Вы можете добавить содержание и главный вопрос к своему списку таксономии и страницам терминов таксономии. Смотрите [организацию содержимого](/content-management/organization/) для получения дополнительной информации о том, как добавить `_index.md` для этой цели.

Как и обычные страницы, список таксономии [постоянные ссылки](/content-management/urls/) настраивается, а постоянные ссылки на страницу терминов таксономии - нет.
{{% /note %}}

{{% warning %}}
Параметр конфигурации `preserveTaxonomyNames` был удален в Hugo 0.55.

Теперь Вы можете использовать `.Page.Title` в соответствующем узле таксономии, чтобы получить исходное значение.
{{% /warning %}}

## Добавить таксономии к контенту

Как только таксономия определена на уровне сайта, ей можно назначить любой фрагмент контента, независимо от [типа контента][content type] или [раздела контента][content section].

Присвоение содержания таксономии выполняется в [front matter][]. Просто создайте переменную с *множественным* именем таксономии и назначьте все термины, которые Вы хотите применить к экземпляру типа контента.

{{% note %}}
Если Вам нужна возможность быстро создавать файлы содержимого с предварительно настроенными таксономиями или терминами, прочтите документацию на [архетипах Хьюго](/content-management/archetypes/).
{{% /note %}}

### Пример: Front Matter с таксономиями

{{< code-toggle copy="false">}}
title = "Hugo: A fast and flexible static site generator"
tags = [ "Development", "Go", "fast", "Blogging" ]
categories = [ "Development" ]
series = [ "Go Web Dev" ]
slug = "hugo"
project_url = "https://github.com/gohugoio/hugo"
{{</ code-toggle >}}

## Порядок Таксономии

Файл содержимого может назначать вес для каждой связанной с ним таксономии. Таксономический вес может использоваться для сортировки или упорядочивания содержимого в [шаблонах списков таксономии][taxonomy list templates] и объявляется в [front matter][] файла содержимого. Таксономический вес объявляется по соглашению `taxonomyname_weight`.

В следующих примерах TOML и YAML показан фрагмент контента с весом 22, который можно использовать для упорядочивания при рендеринге страниц, присвоенных значениям «a», «b» и «c» таксономии `tags`. Ему также был присвоен вес 44 при рендеринге страницы категории «d».

### Пример: `weight` таксономии

{{< code-toggle copy="false" >}}
title = "foo"
tags = [ "a", "b", "c" ]
tags_weight = 22
categories = ["d"]
categories_weight = 44
{{</ code-toggle >}}

Используя таксономический вес, один и тот же фрагмент контента может появляться в разных позициях в разных таксономиях.

{{% note "Limits to Ordering Taxonomies" %}}
В настоящее время таксономии поддерживают только [по умолчанию `weight => date` упорядочивание содержимого списка](/templates/lists/#default-weight-date). Для получения дополнительной информации смотрите документацию по [шаблонам таксономии](/templates/taxonomy-templates/).
{{% /note %}}

## Добавить пользовательские метаданные в таксономию или термин

Если Вам нужно добавить пользовательские метаданные в термины таксономии, Вам нужно будет создать страницу для этого термина в `/content/<TAXONOMY>/<TERM>/_index.md` и добавить свои метаданные в нее. Продолжая наш пример «Актеры», предположим, Вы хотите добавить ссылку на страницу Википедии для каждого актера. Ваши страницы условий будут примерно такими:

{{< code file="/content/actors/bruce-willis/_index.md" >}}
---
title: "Bruce Willis"
wikipedia: "https://en.wikipedia.org/wiki/Bruce_Willis"
---
{{< /code >}}


[`urlize` template function]: /functions/urlize/
[content section]: /content-management/sections/
[content type]: /content-management/types/
[documentation on archetypes]: /content-management/archetypes/
[front matter]: /content-management/front-matter/
[taxonomy list templates]: /templates/taxonomy-templates/#taxonomy-page-templates
[taxonomy templates]: /templates/taxonomy-templates/
[terms within the taxonomy]: /templates/taxonomy-templates/#taxonomy-terms-templates "See how to order terms associated with a taxonomy"
[config]: /getting-started/configuration/
