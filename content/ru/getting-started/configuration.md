---
title: Настройка Хьюго
linktitle: Настройка
description: Как настроить свой сайт Hugo.
date: 2013-07-01
publishdate: 2017-01-02
lastmod: 2017-03-05
categories: [getting started,fundamentals]
keywords: [configuration,toml,yaml,json,настройка,конфигурация]
menu:
  docs:
    parent: "getting-started"
    weight: 60
weight: 60
sections_weight: 60
draft: false
aliases: [/overview/source-directory/,/overview/configuration/]
toc: true
---


## Конфигурационный файл

Хьюго использует файлы `config.toml`, `config.yaml` или `config.json` (если он находится в корне сайта) в качестве файла конфигурации сайта по умолчанию.

Пользователь может выбрать переопределение этого значения по умолчанию с помощью одного или нескольких файлов конфигурации сайта, используя переключатель командной строки `--config`.

Примеры:

```
hugo --config debugconfig.toml
hugo --config a.toml,b.toml,c.toml
```

{{% note %}}
Несколько файлов конфигурации сайта могут быть указаны в виде строки, разделенной запятыми, в параметре `--config`.
{{% /note %}}

{{< todo >}}TODO: отдельный config.toml и другие (корневые объектные файлы){{< /todo >}}

## Каталог конфигурации

В дополнение к использованию одного файла конфигурации сайта, можно использовать каталог `configDir` (по умолчанию `config/`), чтобы упростить организацию и настройки, специфичные для среды.

- Каждый файл представляет собой корневой объект конфигурации, такой как `params.toml` для `[Params]`, `menu(s).toml` для `[Menu]`, `languages.toml` для `[Languages]` и т.д...
- Содержимое каждого файла должно быть верхнего уровня, например:

  В `config.toml` находится:
  ```toml
  [Params]
    foo = "bar"
  ```
  В `params.toml` находится:
  ```
  foo = "bar"
  ```
- Каждый каталог содержит группу файлов, содержащих настройки, уникальные для конкретной среды.
- Файлы могут быть локализованы для соответствия языку.


```
├── config
│   ├── _default
│   │   ├── config.toml
│   │   ├── languages.toml
│   │   ├── menus.en.toml
│   │   ├── menus.zh.toml
│   │   └── params.toml
│   ├── production
│   │   ├── config.toml
│   │   └── params.toml
│   └── staging
│       ├── config.toml
│       └── params.toml
```

Учитывая приведенную выше структуру, при запуске `hugo --environment staging`, Hugo будет использовать все настройки из `config/_default` и объединить `staging` поверх них.
{{% note %}}
Среды по умолчанию: __development__ с `hugo server` и __production__ с `hugo`.
{{%/ note %}}
## Все настройки конфигурации

Ниже приводится полный список переменных, определенных Hugo, со значениями по умолчанию в скобках. Пользователи могут выбрать переопределение этих значений в файлах конфигурации своего сайта.

archetypeDir ("archetypes")
: Каталог, в котором Хьюго находит файлы архетипов (шаблоны содержимого). {{% module-mounts-note %}}

assetDir ("assets")
: Каталог, в котором Хьюго находит файлы ресурсов, используемые в [Hugo Pipes](/hugo-pipes/). {{% module-mounts-note %}}

baseURL
: Имя хоста (и путь) к корню, например, https://bep.is/

blackfriday
: Смотрите [Настройка Blackfriday](/getting-started/configuration-markup#blackfriday)

build
: Смотрите [Настройка сборки](#configure-build)

buildDrafts (false)
: Учитывать черновики при сборке.

buildExpired  (false)
: Включить контент, срок действия которого уже истек.

buildFuture (false)
: Включите контент с датой публикации в будущем.

caches
: Смотрите [Настройка кеша файлов](#configure-file-caches)

canonifyURLs (false)
: Включите, чтобы превратить относительные URL-адреса в абсолютные.

contentDir ("content")
: Каталог, из которого Хьюго читает файлы контента. {{% module-mounts-note %}}

dataDir ("data")
: Каталог, из которого Хьюго читает файлы данных. {{% module-mounts-note %}}

defaultContentLanguage ("en")
: Контент без индикатора языка по умолчанию будет использовать этот язык.

defaultContentLanguageInSubdir (false)
: Отобразите язык содержимого по умолчанию в подкаталоге, например, `content/en/`. Затем корень сайта `/` будет перенаправлен на `/en/`.

disableAliases (false)
: Отключит генерацию переадресации псевдонимов. Обратите внимание, что даже если установлен `disableAliases`, сами псевдонимы сохраняются на странице. Мотивация при этом состоит в том, чтобы иметь возможность генерировать 301 редирект в файле `.htaccess`, Netlify `_redirects` или подобном с использованием настраиваемого формата вывода.

disableHugoGeneratorInject (false)
: По умолчанию Hugo вставляет метатег генератора в заголовок HTML на _только домашнюю страницу_. Вы можете отключить его, но мы будем очень признательны, если Вы этого не сделаете, так как это хороший способ наблюдать за ростом популярности Хьюго.

disableKinds ([])
: Разрешить отключение всех страниц указанного *Вида*. Допустимые значения в этом списке: `"page"`, `"home"`, `"section"`, `"taxonomy"`, `"term"`, `"RSS"`, `"sitemap"`, `"robotsTXT"`, `"404"`.

disableLiveReload (false)
: Отключить автоматическую перезагрузку окна браузера в реальном времени.

disablePathToLower (false)
: Не переводить URL/path в нижний регистр.

enableEmoji (false)
: Включить поддержку смайлов Emoji для содержимого страницы; смотрите [Памятку по эмодзи](https://www.webpagefx.com/tools/emoji-cheat-sheet/).

enableGitInfo (false)
: Включите объект `.GitInfo` для каждой страницы (если версия сайта Hugo поддерживается Git). Затем это обновит параметр `Lastmod` для каждой страницы, используя дату последней фиксации git для этого файла содержимого.

enableInlineShortcodes (false)
: Включите встроенную поддержку шорткода. Смотрите [Встроенные шорткоды](/templates/shortcode-templates/#inline-shortcodes).

enableMissingTranslationPlaceholders (false)
: Показать заполнитель вместо значения по умолчанию или пустой строки, если перевод отсутствует.

enableRobotsTXT (false)
: Включите создание файла `robots.txt`.

frontmatter
: Смотрите [Конфигурация основного материала](#configure-front-matter).

footnoteAnchorPrefix ("")
: Префикс для якорей сноски.

footnoteReturnLinkContents ("")
: Текст, отображаемый для обратных ссылок сноски.

googleAnalytics ("")
: Идентификатор отслеживания Google Analytics.

hasCJKLanguage (false)
: Если true, автоматически определять китайский/японский/корейский языки в содержимом. Это заставит `.Summary` и `.WordCount` вести себя правильно для CJK языков.

imaging
: Смотрите [Конфигурация обработки изображений](/content-management/image-processing/#image-processing-config).

languages
: Смотрите [Конфигурация языков](/content-management/multilingual/#configure-languages).

languageCode ("")
: Код языка сайта. Он используется в [шаблоне RSS по умолчанию](/templates/rss/#configure-rss) и может быть полезен для [многоязычных сайтов](/content-management/multilingual/#configure-multilingual-multihost).

languageName ("")
: Название языка сайта.

disableLanguages
: Смотрите [Отключение языка](/content-management/multilingual/#disable-a-language)

layoutDir ("layouts")
: Каталог, из которого Хьюго читает макеты (шаблоны).

log (false)
: Включить ведение журнала.

logFile ("")
: Путь к файлу журнала (если задан, ведение журнала включается автоматически).

markup
: Смотрите [Настройку разметки](/getting-started/configuration-markup).{{< new-in "0.60.0" >}}

menu
: Смотрите [Добавление записей, не относящихся к содержанию, в меню](/content-management/menus/#add-non-content-entries-to-a-menu).

minify
: Смотрите [Настройку Minify](#configure-minify)

module
: Смотрите настройку модуля [Конфигурация модуля](/hugo-modules/configuration/).{{< new-in "0.56.0" >}}

newContentEditor ("")
: Редактор для использования при создании нового контента.

noChmod (false)
: Не синхронизировать режим разрешений файлов.

noTimes (false)
: Не синхронизировать время модификации файлов.

paginate (10)
: Количество элементов на странице по умолчанию в [пагинации](/templates/pagination/).

paginatePath ("page")
: Элемент пути, используемый при разбивке на страницы (https://example.com/page/2).

permalinks
: Смотрите [Управление содержанием](/content-management/urls/#permalinks).

pluralizeListTitles (true)
: Множественное число заголовков в списках.

publishDir ("public")
: Каталог, в который Хьюго запишет окончательный статический сайт (файлы HTML и т.д.).

related
: Смотрите [Связанный контент](/content-management/related/#configure-related-content).{{< new-in "0.27" >}}

relativeURLs (false)
: Включите это, чтобы сделать все относительные URL-адреса относительно корня содержимого. Обратите внимание, что это не влияет на абсолютные URL-адреса.

refLinksErrorLevel ("ERROR")
: При использовании `ref` или `relref` для разрешения ссылок на страницы и ссылка не может быть разрешена, она будет регистрироваться с этим уровнем журнала. Допустимые значения `ERROR` (по умолчанию) или `WARNING`. Любая `ERROR` приведет к сбою сборки (`exit -1`).

refLinksNotFoundURL
: URL-адрес, который будет использоваться в качестве заполнителя, когда ссылка на страницу не может быть найдена в `ref` или` relref`. Используется как есть.

rssLimit (unlimited)
: Максимальное количество элементов в RSS-ленте.

sectionPagesMenu ("")
: Смотрите ["Меню раздела для отложенных блогеров"](/templates/menu-templates/#section-menu-for-lazy-bloggers).

sitemap
: По умолчанию [конфигурация карты сайта](/templates/sitemap-template/#configure-sitemap-xml).

staticDir ("static")
: Каталог или список каталогов, из которых Хьюго читает [статические файлы][static-files]. {{% module-mounts-note %}}

summaryLength (70)
: Длина текста в словах, отображаемого в [`.Summary`](/content-management/summaries/#hugo-defined-automatic-summary-splitting).

taxonomies
: Смотрите [конфигурацию таксономии](/content-management/taxonomies#configure-taxonomies).

theme ("")
: Тема для использования (по умолчанию находится в `/themes/THEMENAME/`).

themesDir ("themes")
: Каталог, из которого Хьюго читает темы.

timeout (10000)
: Тайм-аут для создания содержимого страницы в миллисекундах (по умолчанию 10&nbsp;секунд). *Примечание:* это используется для отказа от создания рекурсивного контента, если Ваши страницы генерируются медленно (например, потому что они требуют обработки больших изображений или зависят от удаленного содержимого), Вам может потребоваться увеличить этот предел.

title ("")
: Название сайта.

titleCaseStyle ("AP")
: Смотрите [настройку регистра заголовка](#configure-title-case)

uglyURLs (false)
: Когда этот параметр включен, создает URL-адрес в виде `/filename.html` вместо `/filename/`.

verbose (false)
: Включить подробный вывод.

verboseLog (false)
: Включить подробное ведение журнала.

watch (false)
: Следите за изменениями файловой системы и воссоздайте ее по мере необходимости.

{{% note %}}
Если Вы разрабатываете свой сайт на  \*nix-машине, вот удобный ярлык для поиска параметра конфигурации из командной строки:
```
cd ~/sites/yourhugosite
hugo config | grep emoji
```

который показывает вывод как

```
enableemoji: true
```
{{% /note %}}

## Настройка сборки

{{< new-in "0.66.0" >}}

Раздел конфигурации `build` содержит глобальные параметры конфигурации, связанные со сборкой.

{{< code-toggle file="config">}}
[build]
useResourceCacheWhen="fallback"
writeStats = false
noJSConfigInAssets = false
{{< /code-toggle >}}


useResourceCacheWhen
: Когда использовать кэшированные ресурсы в `/resources/_gen` для PostCSS и ToCSS. Допустимые значения `never`, `always` и `fallback`. Последнее значение означает, что кеш будет проверяться, если PostCSS/расширенная версия недоступна.

writeStats {{< new-in "0.69.0" >}}
: Если этот параметр включен, в корень Вашего проекта будет записан файл с именем `hugo_stats.json` с некоторыми агрегированными данными о сборке, например список объектов HTML, опубликованных для использования для [сокращения CSS](/hugo-pipes/postprocess/#css-purging-with-postcss). Если Вы используете его только для производственной сборки, Вам следует подумать о том, чтобы разместить его ниже [config/production](/getting-started/configuration/#configuration-directory). Также стоит упомянуть, что из-за характера частичных сборок сервера новые HTML-объекты будут добавляться, когда Вы добавляете или изменяете их во время работы сервера, но старые значения не будут удалены, пока Вы не перезапустите сервер или не запустите обычную сборку `hugo`.

noJSConfigInAssets {{< new-in "0.78.0" >}}
: Отключите запись `jsconfig.js` в папку `/assets` с отображением импорта из запущенного [js.Build](https://gohugo.io/hugo-pipes/js). Этот файл предназначен для помощи с intellisense / навигацией внутри редакторов кода, таких как [VS Code](https://code.visualstudio.com/). Обратите внимание, что если Вы не используете `js.Build`, файл не будет записан.

## Настройка сервера

{{< new-in "0.67.0" >}}

Это актуально только при запуске `hugo server` и позволяет устанавливать заголовки HTTP во время разработки, что позволяет Вам протестировать свою Политику безопасности контента и тому подобное. Формат конфигурации соответствует [Netlify's](https://docs.netlify.com/routing/headers/#syntax-for-the-netlify-configuration-file) с чуть более мощным [Glob matching](https://github.com/gobwas/glob):


{{< code-toggle file="config">}}
[server]
[[server.headers]]
for = "/**.html"

[server.headers.values]
X-Frame-Options = "DENY"
X-XSS-Protection = "1; mode=block"
X-Content-Type-Options = "nosniff"
Referrer-Policy = "strict-origin-when-cross-origin"
Content-Security-Policy = "script-src localhost:1313"
{{< /code-toggle >}}

Поскольку это "только разработка", возможно, имеет смысл поместить его под средой `development`:


{{< code-toggle file="config/development/server">}}
[[headers]]
for = "/**.html"

[headers.values]
X-Frame-Options = "DENY"
X-XSS-Protection = "1; mode=block"
X-Content-Type-Options = "nosniff"
Referrer-Policy = "strict-origin-when-cross-origin"
Content-Security-Policy = "script-src localhost:1313"
{{< /code-toggle >}}


{{< new-in "0.72.0" >}}

Вы также можете указать простые правила перенаправления для сервера. Синтаксис снова аналогичен синтаксису Netlify.

Обратите внимание, что код статуса `status` 200 вызовет [перезапись URL](https://docs.netlify.com/routing/redirects/rewrites-proxies/), что Вы и хотите в ситуациях SPA, например:

{{< code-toggle file="config/development/server">}}
[[redirects]]
from = "/myspa/**"
to = "/myspa/"
status = 200
force = false
{{< /code-toggle >}}

{{< new-in "0.76.0" >}}

Установка `force=true` приведет к перенаправлению, даже если в пути уже есть контент. Обратите внимание, что до Hugo 0.76 `force` был поведением по умолчанию, но это соответствует тому, как это делает Netlify.

## Настройка регистра заголовка

Установите `titleCaseStyle`, чтобы указать стиль заголовка, используемый функцией шаблона [заголовка](/functions/title/), и автоматические заголовки разделов в Hugo. По умолчанию для заголовка используется [AP Stylebook](https://www.apstylebook.com/), но Вы также можете установить его на `Chicago` или `Go` (каждое слово начинается с заглавной буквы).

## Настройка переменных среды разработки

HUGO_NUMWORKERMULTIPLIER
: Можно настроить на увеличение или уменьшение количества рабочих процессов, используемых при параллельной обработке в Hugo. Если не установлен, будет использовано количество логических ЦП.

## Настройка порядка поиска

Подобно шаблону [порядка поиска][lookup order], Hugo имеет стандартный набор правил для поиска файла конфигурации в корне исходного каталога Вашего веб-сайта в качестве поведения по умолчанию:

1. `./config.toml`
2. `./config.yaml`
3. `./config.json`

В Вашем файле `config` Вы можете указать Хьюго, как Вы хотите отображать свой веб-сайт, управлять меню своего веб-сайта и произвольно определять параметры сайта, специфичные для Вашего проекта.

## Пример конфигурации

Ниже приведен типичный пример файла конфигурации. Значения, вложенные в `params:`, будут заполнять переменную [`.Site.Params`][] для использования в [шаблонах][templates]:

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

## Настройка с помощью переменных среды разработки

В дополнение к 3 уже упомянутым параметрам конфигурации, пары "ключ-значение" конфигурации могут быть определены через переменные среды операционной системы.

Например, следующая команда эффективно устанавливает заголовок веб-сайта в Unix-подобных системах:

```
$ env HUGO_TITLE="Some Title" hugo
```

Это действительно полезно, если Вы используете такую службу, как Netlify, для развертывания своего сайта. Посмотрите в качестве примера документацию Hugo [файл конфигурации Netlify](https://github.com/gohugoio/hugoDocs/blob/master/netlify.toml).

{{% note "Setting Environment Variables" %}}
Имена должны начинаться с префикса `HUGO_`, а ключ конфигурации должен быть указан в верхнем регистре при установке переменных среды операционной системы.

Чтобы установить параметры конфигурации, добавьте к имени префикс `HUGO_PARAMS_`
{{% /note %}}

{{< new-in "0.79.0" >}} Если Вы используете имена переменных snake_cased, приведенное выше не будет работать, поэтому, поскольку Hugo 0.79.0, Hugo определяет разделитель, который будет использоваться первым символом после `HUGO`. Это позволяет Вам определять переменные среды в форме `HUGOxPARAMSxAPI_KEY=abcdefgh`, используя любой [разрешенный](https://stackoverflow.com/questions/2821043/allowed-characters-in-linux-environment-variable-names#:~:text=So%20names%20may%20contain%20any,not%20begin%20with%20a%20digit.) разделитель.

{{< todo >}}
Параметры настройки теста и документа через JSON env var.
{{< /todo >}}

## Игнорировать файлы содержимого при рендеринге

Следующий оператор внутри `./config.toml` заставит Hugo игнорировать файлы содержимого, заканчивающиеся на `.foo` и `.boo` при рендеринге:

```
ignoreFiles = [ "\\.foo$", "\\.boo$" ]
```

Выше приведен список регулярных выражений. Обратите внимание, что символ обратной косой черты (`\`) в этом примере экранирован, чтобы сохранить TOML счастливым.

## Настройка переднего плана

### Настройка даты

Даты важны в Hugo, и Вы можете настроить, как Hugo назначает даты Вашим информационным страницам. Вы делаете это, добавляя раздел `frontmatter` в Ваш `config.toml`.

Конфигурация по умолчанию:

```toml
[frontmatter]
date = ["date", "publishDate", "lastmod"]
lastmod = [":git", "lastmod", "date", "publishDate"]
publishDate = ["publishDate", "date"]
expiryDate = ["expiryDate"]
```

Если у Вас, например, есть нестандартный параметр даты в каком-либо из Ваших материалов, Вы можете переопределить настройку для `date`:

 ```toml
[frontmatter]
date = ["myDate", ":default"]
```

`:default` - это ярлык для настроек по умолчанию. Вышеупомянутое установит `.Date` в значение даты в `myDate`, если оно присутствует, в противном случае мы посмотрим на `date`,`publishDate`, `lastmod` и выберем первую действительную дату.

В списке справа значения, начинающиеся с ":", являются обработчиками дат со специальным значением (см. ниже). Остальные - это просто имена параметров даты (без учета регистра) в Вашей конфигурации. Также обратите внимание, что у Hugo есть несколько встроенных псевдонимов для вышеуказанного: `lastmod` => `modified`, `publishDate` => `pubdate`, `published` и `expiryDate` => `unpublishdate`. При этом, в качестве примера, использование `pubDate` в качестве даты перед публикацией по умолчанию будет присвоено `.PublishDate`.

К специальным обработчикам дат относятся:

`:fileModTime`
: Получает дату из метки времени последнего изменения файла содержимого.

Пример:

 ```toml
[frontmatter]
lastmod = ["lastmod", ":fileModTime", ":default"]
```

Вышеупомянутое сначала попытается извлечь значение для `.Lastmod` , начиная с переднего параметра `lastmod`, а затем отметку времени модификации файла содержимого. Последний, `:default`, здесь не нужен, но Хьюго наконец будет искать действительную дату в `:git`, `date`, а затем в `publishDate`.

`:filename`
: Получает дату из имени файла файла содержимого. Например, `2018-02-22-mypage.md` извлечет дату `2018-02-22`. Кроме того, если `slug` не установлен, `mypage` будет использоваться как значение для `.Slug`.

Пример:

```toml
[frontmatter]
date  = [":filename", ":default"]
```

Вышеупомянутое сначала попытается извлечь значение для `.Date` из имени файла, затем оно будет смотреть в параметрах `date`, `publishDate` и, наконец, `lastmod`.

`:git`
: Это дата создания Git последней редакции этого файла содержимого. Это будет установлено, только если установлен параметр `--enableGitInfo` или `enableGitInfo = true` в конфигурации сайта.

## Настройка дополнительных форматов вывода

В Hugo v0.20 появилась возможность отображать Ваш контент в нескольких форматах вывода (например, в JSON, AMP html или CSV). Смотрите [Форматы вывода][Output Formats] для получения информации о том, как добавить эти значения в файл конфигурации Вашего проекта Hugo.

## Настройка Minify

{{< new-in "0.68.0" >}}

Конфигурация по умолчанию:

{{< code-toggle config="minify" />}}

## Настройка кеши файлов

Начиная с Hugo 0.52 Вы можете настраивать не только `cacheDir`. Это конфигурация по умолчанию:

{{< code-toggle >}}
[caches]
[caches.getjson]
dir = ":cacheDir/:project"
maxAge = -1
[caches.getcsv]
dir = ":cacheDir/:project"
maxAge = -1
[caches.images]
dir = ":resourceDir/_gen"
maxAge = -1
[caches.assets]
dir = ":resourceDir/_gen"
maxAge = -1
[caches.modules]
dir = ":cacheDir/modules"
maxAge = -1
{{< /code-toggle >}}

Вы можете переопределить любую из этих настроек кеша в Вашем собственном файле `config.toml`.

### Объяснение ключевых слов

`:cacheDir`
: Это значение параметра конфигурации `cacheDir`, если оно установлено (также может быть установлено через переменную env ОС `HUGO_CACHEDIR`). Он вернется к `/opt/build/cache/hugo_cache/` на Netlify или к каталогу `hugo_cache` ниже временного каталога ОС для остальных. Это означает, что если Вы запустите свои сборки на Netlify, все кеши, настроенные с помощью `:cacheDir`, будут сохранены и восстановлены при следующей сборке. Для других поставщиков CI, пожалуйста, прочтите их документацию. Смотрите пример CircleCI [этой конфигурации](https://github.com/bep/hugo-sass-test/blob/6c3960a8f4b90e8938228688bc49bdcdd6b2d99e/.circleci/config.yml).

`:project`
: Имя базового каталога текущего проекта Hugo. Это означает, что в настройках по умолчанию каждый проект будет иметь отдельные кеши файлов, а это значит, что когда Вы выполняете `hugo --gc`, Вы не будете касаться файлов, связанных с другими проектами Hugo, запущенными на том же ПК.

`:resourceDir`
: Это значение параметра конфигурации `resourceDir`.

maxAge
: Это время до того, как запись в кэше будет удалена, -1 означает навсегда, а 0 эффективно отключает этот конкретный кеш. Использует Go `time.Duration`, поэтому допустимые значения: `"10s"` (10 секунд), `"10m"` (10 минут) и `"10h"` (10 часов).

dir
: Абсолютный путь к месту хранения файлов этого кеша. Допустимые начальные заполнители: `:cacheDir` и `:resourceDir` (смотрите выше).

## Спецификации формата конфигурации

* [Спецификация формата TOML][toml]
* [Спецификация формата YAML][yaml]
* [Спецификация формата JSON][json]

[`.Site.Params`]: /variables/site/
[directory structure]: /getting-started/directory-structure
[json]: https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf "Specification for JSON, JavaScript Object Notation"
[lookup order]: /templates/lookup-order/
[Output Formats]: /templates/output-formats/
[templates]: /templates/
[toml]: https://github.com/toml-lang/toml
[yaml]: https://yaml.org/spec/
[static-files]: /content-management/static-files/
