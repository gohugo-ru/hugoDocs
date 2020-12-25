---
title: Основы использования
linktitle: Основы использования
description: Интерфейс командной строки Hugo является полнофункциональным, но простым в использовании даже для тех, у кого очень ограниченный опыт работы из командной строки.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
categories: [getting started]
keywords: [usage,livereload,command line,flags,основы использования,использование,командная строка,флаги,перезагрузка в реальном времени]
menu:
  docs:
    parent: "getting-started"
    weight: 40
weight: 40
sections_weight: 40
draft: false
aliases: [/overview/usage/,/extras/livereload/,/doc/usage/,/usage/]
toc: true
---

Ниже приводится описание наиболее распространенных команд, которые Вы будете использовать при разработке проекта Hugo. Смотрите [справочник по командной строке][commands] для полного обзора интерфейса командной строки Hugo CLI.

## Тестирование установки

После того, как Вы [установили Hugo][install], убедитесь, что он находится в Вашем `PATH`. Вы можете проверить правильность установки Hugo с помощью команды `help`:

```
hugo help
```

Вывод, который вы видите в консоли, должен быть похож на следующий:

```
hugo is the main command, used to build your Hugo site.

Hugo is a Fast and Flexible Static Site Generator
built with love by spf13 and friends in Go.

Complete documentation is available at https://gohugo.io/.

Usage:
  hugo [flags]
  hugo [command]

Available Commands:
  check       Contains some verification checks
  config      Print the site configuration
  convert     Convert your content to different formats
  env         Print Hugo version and environment info
  gen         A collection of several useful generators.
  help        Help about any command
  import      Import your site from others.
  list        Listing out various types of content
  new         Create new content for your site
  server      A high performance webserver
  version     Print the version number of Hugo

Flags:
  -b, --baseURL string         hostname (and path) to the root, e.g. https://spf13.com/
  -D, --buildDrafts            include content marked as draft
  -E, --buildExpired           include expired content
  -F, --buildFuture            include content with publishdate in the future
      --cacheDir string        filesystem path to cache directory. Defaults: $TMPDIR/hugo_cache/
      --cleanDestinationDir    remove files from destination not found in static directories
      --config string          config file (default is path/config.yaml|json|toml)
      --configDir string       config dir (default "config")
  -c, --contentDir string      filesystem path to content directory
      --debug                  debug output
  -d, --destination string     filesystem path to write files to
      --disableKinds strings   disable different kind of pages (home, RSS etc.)
      --enableGitInfo          add Git revision, date and author info to the pages
  -e, --environment string     build environment
      --forceSyncStatic        copy all files when static is changed.
      --gc                     enable to run some cleanup tasks (remove unused cache files) after the build
  -h, --help                   help for hugo
      --i18n-warnings          print missing translations
      --ignoreCache            ignores the cache directory
  -l, --layoutDir string       filesystem path to layout directory
      --log                    enable Logging
      --logFile string         log File path (if set, logging enabled automatically)
      --minify                 minify any supported output format (HTML, XML etc.)
      --noChmod                don't sync permission mode of files
      --noTimes                don't sync modification time of files
      --path-warnings          print warnings on duplicate target paths etc.
      --quiet                  build in quiet mode
      --renderToMemory         render to memory (only useful for benchmark testing)
  -s, --source string          filesystem path to read files relative from
      --templateMetrics        display metrics about template executions
      --templateMetricsHints   calculate some improvement hints when combined with --templateMetrics
  -t, --theme strings          themes to use (located in /themes/THEMENAME/)
      --themesDir string       filesystem path to themes directory
      --trace file             write trace to file (not useful in general)
  -v, --verbose                verbose output
      --verboseLog             verbose logging
  -w, --watch                  watch filesystem for changes and recreate as needed

Use "hugo [command] --help" for more information about a command.
```

## Команда `hugo`

Чаще всего используется, вероятно, запуск `hugo` с Вашим текущим каталогом, который является входным каталогом.

По умолчанию Ваш веб-сайт будет помещен в каталог `public/`, хотя Вы можете настроить выходной каталог в [конфигурации сайта][config], изменив поле `publishDir`.

Команда `hugo` рендерит Ваш сайт в директорию `public/` и готовит к развертыванию на Вашем веб-сервере:

```
hugo
0 draft content
0 future content
99 pages created
0 paginator pages created
16 tags created
0 groups created
in 90 ms
```

## Черновик, будущий и истекший контент

Hugo позволяет Вам установить `draft`, `publishdate` и даже `expirydate` в [основной части][front matter]. По умолчанию Hugo не публикует:

1. Контент с будущим значением `publishdate`
2. Контент со статусом `draft: true`
3. Контент с прошлым значением `expirydate`

Все три из них могут быть переопределены как во время локальной разработки, *так и* развертывания путем добавления следующих флагов к `hugo` и `hugo server`, соответственно, или путем изменения логических значений, присвоенных полям с тем же именем (без `--`) в Вашей [конфигурации][config]:

1. `--buildFuture`
2. `--buildDrafts`
3. `--buildExpired`

## LiveReload

Hugo поставляется со встроенным [LiveReload](https://github.com/livereload/livereload-js). Никаких дополнительных пакетов для установки не требуется. Обычный способ использования Hugo при разработке сайта - это заставить Hugo запустить сервер с помощью команды `hugo server` и следить за изменениями:

```
hugo server
0 draft content
0 future content
99 pages created
0 paginator pages created
16 tags created
0 groups created
in 120 ms
Watching for changes in /Users/yourname/sites/yourhugosite/{data,content,layouts,static}
Serving pages from /Users/yourname/sites/yourhugosite/public
Web Server is available at http://localhost:1313/
Press Ctrl+C to stop
```

Это запустит полностью функционирующий веб-сервер, одновременно наблюдая за Вашей файловой системой на предмет добавления, удаления или изменений в следующих областях Вашей [организации проекта][dirs]:

* `/static/*`
* `/content/*`
* `/data/*`
* `/i18n/*`
* `/layouts/*`
* `/themes/<CURRENT-THEME>/*`
* `config`

Каждый раз, когда Вы вносите изменения, Хьюго одновременно перестраивает сайт и продолжает предоставлять контент. Как только сборка будет завершена, LiveReload сообщает браузеру, что нужно перезагрузить страницу.

Большинство сборок Hugo настолько быстрые, что Вы можете не заметить изменения, если не посмотрите прямо на сайт в своем браузере. Это означает, что сохранение сайта открытым на втором мониторе (или другой половине Вашего текущего монитора) позволяет Вам видеть самую последнюю версию Вашего сайта, не выходя из текстового редактора.

{{% note "Closing `</body>` Tag"%}}
Hugo вставляет LiveReload `<script>` перед закрывающим `</body>` в Ваши шаблоны и поэтому не будет работать, если этот тег отсутствует.
{{% /note %}}

### Отключение LiveReload

LiveReload работает путем внедрения JavaScript в страницы, которые создает Hugo. Сценарий создает соединение от клиента веб-сокета браузера к серверу веб-сокета Hugo.

LiveReload отлично подходит для разработки. Однако некоторые пользователи Hugo могут использовать `hugo server` в производственной среде для мгновенного отображения обновленного контента. Следующие методы позволяют легко отключить LiveReload:

```
hugo server --watch=false
```

Или...

```
hugo server --disableLiveReload
```

Последний флаг можно опустить, добавив следующую пару "ключ-значение" в Ваш файл `config.toml` или `config.yml`, соответственно:

```
disableLiveReload = true
```

```
disableLiveReload: true
```

## Деплой Вашего веб-сайта

После запуска `hugo server` для локальной веб-разработки Вам необходимо выполнить последний запуск `hugo` *без серверной `server` части команды*, чтобы восстановить Ваш сайт. Затем Вы можете развернуть свой сайт, скопировав каталог `public/` на рабочий веб-сервер.

Поскольку Hugo создает статический веб-сайт, Ваш сайт может быть размещен *где угодно* с помощью любого веб-сервера. Смотрите [хостинг и развертывание][hosting] для получения информации о методах размещения и автоматизации развертываний, предоставленных сообществом Hugo.

{{% warning "Generated Files are **NOT** Removed on Site Build" %}}
Запуск `hugo` *не* удаляет сгенерированные файлы перед сборкой. Это означает, что Вы должны удалить свой каталог `public/` (или каталог публикации, указанный Вами с помощью флага или файла конфигурации) перед запуском команды `hugo`. Если Вы не удалите эти файлы, Вы рискуете, что на созданном сайте останутся неправильные файлы (например, черновики или будущие сообщения).
{{% /warning %}}


[commands]: /commands/
[config]: /getting-started/configuration/
[dirs]: /getting-started/directory-structure/
[front matter]: /content-management/front-matter/
[hosting]: /hosting-and-deployment/
[install]: /getting-started/installing/
