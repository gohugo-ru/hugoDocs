---
title: Настройка модулей
linktitle: Настройка модулей
description: На этой странице описаны параметры конфигурации модуля.
date: 2019-07-24
categories: [hugo modules]
keywords: [themes, source, organization, directories]
menu:
  docs:
    parent: "modules"
    weight: 10
weight: 10
sections_weight: 10
toc: true
---

## Конфигурация модуля: Верхний уровень

{{< code-toggle file="config">}}
[module]
noVendor = ""
proxy = "direct"
noProxy = "none"
private = "*.*"
replacements = ""
{{< /code-toggle >}}

noVendor {{< new-in "0.75.0" >}}
: Необязательные пути модуля сопоставления с шаблоном Glob, которые следует пропустить при продаже, например, "github.com/**"

proxy
: Определяет прокси-сервер для загрузки удаленных модулей. По умолчанию это `direct`, что означает "git clone" и т.п.

noProxy
: Пути соответствия глобальных списков, разделенных запятыми, которые не должны использовать настроенный выше прокси.

private
: Пути соответствия глобальных списков, разделенных запятыми, которые следует рассматривать как частные.

replacements {{< new-in "0.77.0" >}}
: Разделенный запятыми (или фрагмент) список пути модуля к сопоставлению замены каталога, например, `"github.com/bep/myprettytheme -> ../..,github.com/bep/shortcodes -> /some/path`. Это в основном полезно для временной локальной разработки модуля, а затем имеет смысл установите его как переменную среды ОС, например: `env HUGO_MODULE_REPLACEMENTS="github.com/bep/myprettytheme -> ../.."`. Любой относительный путь относится к [themesDir](https://gohugo.io/getting-started/configuration/#all-configuration-settings), и абсолютные пути разрешены.

Обратите внимание, что приведенные выше термины напрямую соответствуют своим аналогам в модулях Go. Некоторые из этих параметров могут быть естественными для установки в качестве переменных среды ОС. Чтобы настроить прокси-сервер для использования, например:

```
env HUGO_MODULE_PROXY=https://proxy.example.org hugo
```

{{< gomodules-info >}}

## Конфигурация модуля: hugoVersion

Если Вашему модулю для работы требуется определенная версия Hugo, Вы можете указать это в разделе `module`, и пользователь будет предупрежден, если будет использовать слишком старую/новую версию.

{{< code-toggle file="config">}}
[module]
[module.hugoVersion]
  min = ""
  max = ""
  extended = false

{{< /code-toggle >}}

Любое из вышеперечисленного можно опустить.

min
: Минимальная поддерживаемая версия Hugo, например: `0.55.0`

max
: Максимальная поддерживаемая версия Hugo, например: `0.55.0`

extended
: Требуется ли расширенная версия Hugo.

## Конфигурация модуля: imports

{{< code-toggle file="config">}}
[module]
[[module.imports]]
  path = "github.com/gohugoio/hugoTestModules1_linux/modh1_2_1v"
  ignoreConfig = false
  disable = false
[[module.imports]]
  path = "my-shortcodes"
{{< /code-toggle >}}

path
: Может быть действительным путем к модулю модуля Go, например: `github.com/gohugoio/myShortcodes` или имя каталога для модуля, хранящегося в папке Ваших тем.

ignoreConfig
: Если включено, любой файл конфигурации модуля, например `config.toml` не загружается. Обратите внимание, что это также остановит загрузку любых транзитивных зависимостей модуля.

disable
: Установите значение `true`, чтобы отключить модуль, сохраняя при этом любую информацию о версии в файлах `go.*`.

{{< gomodules-info >}}


## Конфигурация модуля: mounts

{{% note %}}
Когда конфигурация `mounts` была представлена в Hugo 0.56.0, мы старались сохранить существующую конфигурацию `staticDir` и аналогичную конфигурацию, чтобы все существующие сайты продолжали работать. Но у Вас не должно быть обоих: если Вы добавляете раздел `mounts`, Вы должны удалить старые настройки `staticDir` и т.д.
{{% /note %}}

{{% warning %}}
Когда Вы добавляете монтирование, монтирование по умолчанию для соответствующего целевого корня игнорируется: обязательно добавьте его явно.
{{% /warning %}}

**mounts по умолчанию**
{{< code-toggle file="config">}}
[module]
[[module.mounts]]
    source="content"
    target="content"
[[module.mounts]]
    source="static"
    target="static"
[[module.mounts]]
    source="layouts"
    target="layouts"
[[module.mounts]]
    source="data"
    target="data"
[[module.mounts]]
    source="assets"
    target="assets"
[[module.mounts]]
    source="i18n"
    target="i18n"
[[module.mounts]]
    source="archetypes"
    target="archetypes"
{{< /code-toggle >}}

source
: Исходный каталог монтирования. Для основного проекта это может быть как относительная к проекту, так и абсолютная и даже символическая ссылка. Для других модулей он должен относиться к проекту.

target
: Где он должен быть смонтирован в виртуальной файловой системе Хьюго. Он должен начинаться с одной из папок компонентов Хьюго: `static`, `content`, `layouts`, `data`, `assets`, `i18n` или `archetypes`. Например: `content/blog`.

lang
: Код языка, например: "en". Применимо только для монтирования контента `content` и `static` статического монтирования в режиме мультихоста.
