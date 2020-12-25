---
title: Использование модулей Hugo
linktitle: Использование модулей Hugo
description: Как использовать модули Hugo для создания и управления Вашим сайтом.
date: 2019-07-24
categories: [hugo modules]
keywords: [install, themes, source, organization, directories,usage,modules]
menu:
  docs:
    parent: "modules"
    weight: 20
weight: 20
sections_weight: 20
draft: false
aliases: [/themes/usage/,/themes/installing/,/installing-and-using-themes/]
toc: true
---

## Предпосылка

{{< gomodules-info >}}

## Инициализация нового модуля

Используйте `hugo mod init` для инициализации нового модуля Hugo. Если не удается угадать путь к модулю, Вы должны указать его в качестве аргумента, например:

```bash
hugo mod init github.com/gohugoio/myShortcodes
```

Также смотрите [CLI документацию](/commands/hugo_mod_init/).

## Использование модуля для темы
Самый простой способ использовать модуль для темы - это импортировать его в `config`.

1. Инициализируйте систему модулей hugo: `hugo mod init github.com/<your_user>/<your_project>`
2. Импортируйте тему в Ваш `config.toml`:

```toml
[module]
  [[module.imports]]
    path = "github.com/spf13/hyde"
```

## Обновление модулей

Модули будут загружены и добавлены, когда Вы добавите их в качестве импорта в Вашу конфигурацию, смотрите [импорт модулей](/hugo-modules/configuration/#module-config-imports).

Для обновления или управления версиями Вы можете использовать `hugo mod get`.

Несколько примеров:

### Обновление всех модулей

```bash
hugo mod get -u
```

### Рекурсивное обновление всех модулей

{{< new-in "0.65.0" >}}

```bash
hugo mod get -u ./...
```

### Обновление одного модуля

```bash
hugo mod get -u github.com/gohugoio/myShortcodes
```

### Получить конкретную версию

```bash
hugo mod get github.com/gohugoio/myShortcodes@v1.0.7
```

Также смотрите [CLI документацию](/commands/hugo_mod_get/).

## Внесите и протестируйте изменения в модуле

Один из способов выполнить локальную разработку модуля, импортированного в проект, - это добавить директиву replace в локальный каталог с источником в `go.mod`:

```bash
replace github.com/bep/hugotestmods/mypartials => /Users/bep/hugotestmods/mypartials
```

Если у вас запущен `hugo server`, конфигурация будет перезагружена и `/Users/bep/hugotestmods/mypartials` будет помещен в список наблюдения.

Обратите внимание, что начиная с версии v.0.77.0 Вы можете использовать параметр конфигурации модулей [`replacements`](https://gohugo.io/hugo-modules/configuration/#module-config-top-level). {{< new-in "0.77.0" >}}

## Печать графика зависимостей

Используйте `hugo mod graph` из соответствующего каталога модуля, и он распечатает граф зависимостей, включая вендор, замену модуля или отключенный статус.

Например:

```
hugo mod graph

github.com/bep/my-modular-site github.com/bep/hugotestmods/mymounts@v1.2.0
github.com/bep/my-modular-site github.com/bep/hugotestmods/mypartials@v1.0.7
github.com/bep/hugotestmods/mypartials@v1.0.7 github.com/bep/hugotestmods/myassets@v1.0.4
github.com/bep/hugotestmods/mypartials@v1.0.7 github.com/bep/hugotestmods/myv2@v1.0.0
DISABLED github.com/bep/my-modular-site github.com/spf13/hyde@v0.0.0-20190427180251-e36f5799b396
github.com/bep/my-modular-site github.com/bep/hugo-fresh@v1.0.1
github.com/bep/my-modular-site in-themesdir
```

Также смотрите [CLI документацию](/commands/hugo_mod_graph/).

## Поставщик Ваших модулей

`hugo mod vendor` запишет все зависимости модуля в папку `_vendor`, которая затем будет использоваться для всех последующих сборок.

Обратите внимание, что:

* Вы можете запустить `hugo mod vendor` на любом уровне в дереве модулей.
* Вендоринг не будет хранить модули, хранящиеся в папке `themes`.
* Большинство команд принимают флаг `--ignoreVendorPaths`, который затем не будет использовать поставленные модули в `_vendor` для путей модулей, соответствующих заданному шаблону [Glob](https://github.com/gobwas/glob). Обратите внимание, что до Hugo 0.75 этот флаг назывался `--ignoreVendor` и был «все или ничего». {{< new-in "0.75.0" >}}

Также смотрите [CLI документацию](/commands/hugo_mod_vendor/).

## Приведение в порядок go.mod, go.sum

Запустите `hugo mod tidy`, чтобы удалить неиспользуемые записи в `go.mod` и `go.sum`.

Также смотрите [CLI документацию](/commands/hugo_mod_clean/).

## Очистка кеша модуля

Запустите `hugo mod clean`, чтобы удалить весь кеш модулей.

Обратите внимание, что вы также можете настроить кеш `modules` с помощью `maxAge`, смотрите [кеш файлов](/hugo-modules/configuration/#configure-file-caches).

Также смотрите [CLI документацию](/commands/hugo_mod_clean/).
