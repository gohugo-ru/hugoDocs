---
title: Компоненты темы
linktitle: Компоненты темы
description: Hugo обеспечивает расширенную поддержку тем с помощью компонентов темы.
date: 2017-02-01
categories: [hugo modules]
keywords: [themes, theme, source, organization, directories]
menu:
  docs:
    parent: "modules"
    weight: 50
weight: 50
sections_weight: 50
draft: false
aliases: [/themes/customize/,/themes/customizing/]
toc: true
---

{{% note %}}
В этом разделе содержится информация, которая может быть устаревшей и находится в процессе перезаписи.
{{% /note %}}
Начиная с Hugo `0.42`, проект может сконфигурировать тему как композицию из любого количества необходимых вам компонентов:

{{< code-toggle file="config">}}
theme = ["my-shortcodes", "base-theme", "hyde"]
{{< /code-toggle >}}

Вы даже можете вложить это, и чтобы сам компонент темы включал компоненты темы в свой собственный файл `config.toml` (наследование темы).[^1]

В приведенном выше примере определения темы в `config.toml` создается тема с 3 компонентами темы с приоритетом слева направо.

Для любого заданного файла, ввода данных и т.д., Хьюго сначала будет искать в проекте, а затем в `my-shortcode`, `base-theme` и, наконец, в `hyde`.

Hugo использует два разных алгоритма для объединения файловых систем в зависимости от типа файла:

* Для файлов `i18n` и `data` Hugo выполняет глубокое слияние, используя идентификатор перевода и ключ данных внутри файлов.
* Для файлов `static`, `layouts` (шаблоны) и `archetypes` они объединяются на уровне файла. Таким образом, будет выбран самый левый файл.

Имя, используемое в определении темы `theme` выше, должно соответствовать папке в `/your-site/themes`, например: `/your-site/themes/my-shortcodes`. Есть планы улучшить это и получить схему URL, чтобы это можно было разрешить автоматически.

Также обратите внимание, что компонент, являющийся частью темы, может иметь собственный файл конфигурации, например `config.toml`. В настоящее время существуют некоторые ограничения на то, что компонент темы может настраивать:

* `params` (глобальный и для каждого языка)
* `menu` (глобальный и для каждого языка)
* `outputformats` и `mediatypes`

Здесь применяются те же правила: самый левый параметр/меню и т.д. С тем же идентификатором побеждает. В приведенном выше описании есть некоторая поддержка скрытых и экспериментальных пространств имен, над которой мы будем работать в будущем, но авторам тем рекомендуется создавать свои собственные пространства имен, чтобы избежать конфликтов имен.

[^1]: Для тем, размещенных на [Витрине тем хьюго](https://themes.gohugo.io/), необходимо добавить компоненты как подмодули git, которые указывают на каталог `exampleSite/themes`
