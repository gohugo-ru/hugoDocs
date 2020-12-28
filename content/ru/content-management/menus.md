---
title: Меню
linktitle: Меню
description: У Хьюго простая, но мощная система меню.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-03-31
categories: [content management]
keywords: [menus]
draft: false
menu:
  docs:
    parent: "content-management"
    weight: 120
weight: 120	#rem
aliases: [/extras/menus/]
toc: true
---

{{% note "Lazy Blogger"%}}
Если все, что Вам нужно, это простое меню для Ваших разделов, смотрите [«Меню раздела для ленивых блоггеров» в шаблонах меню](/templates/menu-templates/#section-menu-for-lazy-bloggers).
{{% /note %}}

Ты можешь это сделать:

* Размещение контента в одном или нескольких меню
* Обработка вложенных меню с неограниченной глубиной
* Создание пунктов меню без привязки к какому-либо контенту
* Различать активный элемент (и активную ветвь)

## Что такое меню в Hugo?

**menu** - это именованный массив пунктов меню, доступных по имени через [переменную сайта `.Site.Menus`][sitevars]. Например, Вы можете получить доступ к главному меню `main` Вашего сайта через `.Site.Menus.main`.

{{% note "Menus on Multilingual Sites" %}}
Если Вы используете [функцию многоязычности](/content-management/multilingual/), Вы можете определять независимые от языка меню.
{{% /note %}}

Смотрите [свойства элемента меню][me-props] для получения информации обо всех переменных и функциях, связанных с элементом меню.

## Добавить контент в меню

Hugo позволяет Вам добавлять контент в меню через [front matter](/content-management/front-matter/).

### Простое

Если все, что Вам нужно сделать, это добавить запись в меню, простая форма подойдет.

#### Одиночное меню

```
---
menu: "main"
---
```

#### Мультименю

```
---
menu: ["main", "footer"]
---
```

#### Продвинутое

```
---
menu:
  docs:
    parent: 'extras'
    weight: 20
---
```

## Добавление записей, не относящихся к содержанию, в меню

Вы также можете добавлять элементы в меню, которые не связаны с частью контента. Это происходит в файле [`config` file][config] Вашего проекта Hugo.

Вот пример фрагмента, извлеченного из файла конфигурации:

{{< code-toggle file="config" >}}
[[menu.main]]
    name = "about hugo"
    pre = "<i class='fa fa-heart'></i>"
    weight = -110
    identifier = "about"
    url = "/about/"
[[menu.main]]
    name = "getting started"
    pre = "<i class='fa fa-road'></i>"
    post = "<span class='alert'>New!</span>"
    weight = -100
    url = "/getting-started/"
{{< /code-toggle >}}

{{% note %}}
URL-адреса должны быть относительно корня контекста. Если `baseURL` - это `https://example.com/mysite/`, тогда URL-адреса в меню не должны включать корневой контекст `mysite`. Использование абсолютного URL-адреса заменит базовый URL-адрес. Если значение, используемое для `URL` в приведенном выше примере, равно `https://subdomain.example.com/`, вывод будет `https://subdomain.example.com`.
{{% /note %}}

## Вложенность

Все вложение контента выполняется через поле `parent`.

Родительский элемент записи должен быть идентификатором другой записи. Идентификатор должен быть уникальным (в пределах меню).

Для определения идентификатора используется следующий порядок:

`.Name > .LinkTitle > .Title`

Это означает, что `.Title` будет использоваться, если не присутствует `.LinkTitle` и т.д. На практике, `.Name` и `.Identifier` используются только для структурирования отношений и поэтому никогда не отображаются.

В этом примере верхний уровень меню определен в Вашем [файле сайта `config`][config]. Все записи содержимого прикрепляются к одной из этих записей через поле `.Parent`.

## Параметры

Вы также можете добавить определяемый пользователем контент в пункты меню через поле `params`.

Типичным вариантом использования является определение настраиваемого параметра для добавления класса css к определенному пункту меню.

{{< code-toggle file="config" >}}
[[menu.main]]
    name = "about hugo"
    pre = "<i class='fa fa-heart'></i>"
    weight = -110
    identifier = "about"
    url = "/about/"
    [menu.main.params]
      class = "highlight-menu-item"
{{</ code-toggle >}}

## Рендеринг меню

Смотрите [шаблоны меню](/templates/menu-templates/) для получения информации о том, как отображать меню Вашего сайта в Ваших шаблонах.

[config]: /getting-started/configuration/
[multilingual]: /content-management/multilingual/
[sitevars]: /variables/
[me-props]: /variables/menus/
