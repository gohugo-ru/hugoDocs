---
title: Управление URL-адресами
linktitle: Управление URL-адресами
description: Hugo поддерживает постоянные ссылки, псевдонимы, канонизацию ссылок и несколько вариантов обработки относительных и абсолютных URL-адресов.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-03-09
keywords: [aliases,redirects,permalinks,urls]
categories: [content management]
menu:
  docs:
    parent: "content-management"
    weight: 110
weight: 110	#rem
draft: false
aliases: [/extras/permalinks/,/extras/aliases/,/extras/urls/,/doc/redirects/,/doc/alias/,/doc/aliases/]
toc: true
---

## Постоянные ссылки

По умолчанию целевой каталог Hugo для Вашего созданного веб-сайта - `public/`. Однако Вы можете изменить это значение, указав другой `publishDir` в Вашей [конфигурации сайта][config]. Каталоги, созданные во время сборки для раздела, отражают положение каталога содержимого в папке `content` и пространство имен, соответствующее его макету в иерархии `contentdir`.

Параметр `permalinks` в Вашей [конфигурации сайта][config] позволяет Вам настраивать пути к каталогам (то есть URL-адреса) для каждого раздела. Это изменит место записи файлов и изменит внутреннее «каноническое» расположение страницы, так что ссылки шаблона на `.RelPermalink` будут учитывать корректировки, сделанные в результате сопоставлений в этой опции.

{{% note "Default Publish and Content Folders" %}}
В этих примерах используются значения по умолчанию для `publishDir` и `contentDir`; т.е. `public` и `content`, соответственно. Вы можете переопределить значения по умолчанию в Вашем [файле `config` Вашего сайта]](/getting-started/configuration/).
{{% /note %}}

Например, если один из Ваших [разделов][sections] вызывает `posts` и Вы хотите настроить канонический путь так, чтобы он был иерархическим на основе года, месяца и заголовка публикации, Вы можете настроить следующие конфигурации в YAML и TOML соответственно.

### Пример конфигурации постоянных ссылок

{{< code-toggle file="config" copy="false" >}}
permalinks:
  posts: /:year/:month/:title/
{{< /code-toggle >}}

Только контент в `posts/` будет иметь новую структуру URL-адреса. Например, файл `content/posts/sample-entry.md` с `date: 2017-02-27T19:20:00-05:00` в front matter будет отображаться как `public/2017/02/sample-entry/index.html` во время сборки и, следовательно, доступен по адресу `https://example.com/2017/02/sample-entry/`.

Чтобы настроить параметр `permalinks` для страниц в «корневом» разделе, используйте **/** в качестве ключа:

{{< code-toggle file="config" copy="false" >}}
permalinks:
  /: /:year/:month/:filename/
{{< /code-toggle >}}

Если стандартная конфигурация постоянной ссылки на основе даты не соответствует Вашим требованиям, Вы также можете отформатировать сегменты URL с помощью [директив форматирования времени Go](https://golang.org/pkg/time/#Time.Format). Например, структура URL-адреса с двумя цифрами года и месяца и дня без заполнения нулями может быть выполнена с помощью:

{{< code-toggle file="config" copy="false" >}}
permalinks:
  posts: /:06/:1/:2/:title/
{{< /code-toggle >}}

Вы также можете настроить постоянные ссылки таксономий с тем же синтаксисом, используя форму множественного числа таксономии вместо раздела. Вероятно, Вы захотите использовать только значения конфигурации `:slug` или `:title`.

### Значения конфигурации постоянной ссылки

Ниже приводится список значений, которые можно использовать в определении `permalink` в файле конфигурации Вашего сайта `config`. Все ссылки на время зависят от даты содержания.

`:year`
: 4-значный год

`:month`
: 2-значный месяц

`:monthname`
: название месяца

`:day`
: 2-значный день

`:weekday`
: 1-значный день недели (воскресенье = 0)

`:weekdayname`
: название дня недели

`:yearday`
: день года, состоящий из 1–3 цифр

`:section`
: раздел содержимого

`:sections`
: иерархия разделов контента

`:title`
: заголовок контента

`:slug`
: заголовок контента (или заголовок, если заголовок не указан во вступительной части)

`:filename`
: имя файла содержимого (без расширения)

Кроме того, может использоваться строка формата времени Go с префиксом `:`.

## Псевдонимы

Псевдонимы могут использоваться для создания перенаправлений на Вашу страницу с других URL-адресов.

Псевдонимы бывают двух видов:

1. Начиная с `/`, они относятся к `BaseURL`, например: `/posts/my-blogpost/`
2. Они относятся к странице `Page`, в которой они определены, например: `my-blogpost` или даже что-то вроде `../blog/my-blogpost` (новое в Hugo 0.55).

### Пример: Псевдонимы

Предположим, Вы создаете новый фрагмент контента по адресу `content/posts/my-awesome-blog-post.md`. Контент представляет собой отредактированный вариант Вашей предыдущей публикации по адресу `content/posts/my-original-url.md`. Вы можете создать поле `aliases` в начале Вашего нового `my-awesome-blog-post.md`, куда Вы можете добавить предыдущие пути. В следующих примерах показано, как создать это поле в материалах TOML и YAML соответственно.

#### TOML Front Matter

{{< code file="content/posts/my-awesome-post.md" copy="false" >}}
+++
aliases = [
    "/posts/my-original-url/",
    "/2010/01/01/even-earlier-url.html"
]
+++
{{< /code >}}

#### YAML Front Matter

{{< code file="content/posts/my-awesome-post.md" copy="false" >}}
---
aliases:
    - /posts/my-original-url/
    - /2010/01/01/even-earlier-url.html
---
{{< /code >}}

Теперь, когда Вы посещаете любое из мест, указанных в псевдонимах --- т.е. *при условии, что это тот же домен сайта* --- Вы будете перенаправлены на страницу, на которой они указаны. Например, посетитель на `example.com/posts/my-original-url/` будет немедленно перенаправлен на `example.com/posts/my-awesome-post/`.

### Пример: псевдонимы в многоязычности

На [многоязычных сайтах][multilingual] каждый перевод сообщения может иметь уникальные псевдонимы. Чтобы использовать один и тот же псевдоним на нескольких языках, добавьте к нему код языка.

В `/posts/my-new-post.es.md`:

```
---
aliases:
    - /es/posts/my-original-post/
---
```

Начиная с Hugo 0.55 Вы также можете использовать псевдонимы, относящиеся к странице, поэтому `/es/posts/my-original-post/` можно упростить до более переносимого `my-original-post/`

### Как работают псевдонимы Хьюго

Когда псевдонимы указаны, Хьюго создает каталог, соответствующий записи псевдонима. Внутри каталога Хьюго создает файл `.html`, определяющий канонический URL-адрес страницы и новую цель перенаправления.

Например, файл содержимого по адресу `posts/my-intended-url.md` со следующим текстом в front matter:

```
---
title: My New post
aliases: [/posts/my-old-url/]
---
```

Предполагая, что `baseURL` - это `example.com`, содержимое автоматически сгенерированного псевдонима `.html`, найденного по адресу `https://example.com/posts/my-old-url/`, будет содержать следующее:

```
<!DOCTYPE html>
<html>
  <head>
    <title>https://example.com/posts/my-intended-url</title>
    <link rel="canonical" href="https://example.com/posts/my-intended-url"/>
    <meta name="robots" content="noindex">
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="refresh" content="0; url=https://example.com/posts/my-intended-url"/>
  </head>
</html>
```

Строка `http-equiv="refresh"` - это то, что выполняет перенаправление, в данном случае за 0 секунд. Если конечный пользователь Вашего веб-сайта перейдет на `https://example.com/posts/my-old-url`, он будет автоматически перенаправлен на более новый правильный URL. Добавление `<meta name="robots" content="noindex">` позволяет роботам поисковых систем знать, что они не должны сканировать и индексировать Вашу страницу с новым псевдонимом.

### Кастомизация
Вы можете настроить эту страницу псевдонима, создав шаблон `alias.html` в папке макетов вашего сайта (например, `layouts/alias.html`). В этом случае в шаблон передаются данные

`Permalink`
: ссылка на страницу с псевдонимом

`Page`
: данные страницы для страницы с псевдонимом

### Важное поведение псевдонимов

1. Хьюго не делает никаких предположений относительно псевдонимов. Они также не меняются в зависимости от Ваших настроек `UglyURL`. Вам необходимо указать абсолютные пути к корневому веб-каталогу и полное имя файла или каталог.
2. Псевдонимы отображаются *до* отображения любого содержимого и поэтому будут перезаписаны любым содержимым с тем же расположением.

## Красивые URL-адреса

По умолчанию Hugo отображает Ваш контент с "красивыми" URL. Для работы этих красивых URL-адресов не требуется нестандартной конфигурации на стороне сервера.

Следующее демонстрирует концепцию:

```
content/posts/_index.md
=> example.com/posts/index.html
content/posts/post-1.md
=> example.com/posts/post-1/
```

## Уродливые URL-адреса

Если Вы хотите, чтобы у Вас были так называемые "уродливые URL" (например, example.com/urls.html), установите `uglyurls = true` или `uglyurls: true` в файле `config.toml` или `config.yaml` соответственно. Вы также можете установить для переменной окружения `HUGO_UGLYURLS` значение `true` при запуске `hugo` или `hugo server`.

Если Вы хотите, чтобы конкретный фрагмент контента имел точный URL-адрес, Вы можете указать это в [front matter][] под ключом `url`. Ниже приведены примеры того же каталога содержимого и того, какой будет конечная структура URL-адресов, когда Hugo будет работать со своим поведением по умолчанию.

Смотрите [организацию контента][contentorg] для получения более подробной информации о путях.

```
.
└── content
    └── about
    |   └── _index.md  // <- https://example.com/about/
    ├── posts
    |   ├── firstpost.md   // <- https://example.com/posts/firstpost/
    |   ├── happy
    |   |   └── ness.md  // <- https://example.com/posts/happy/ness/
    |   └── secondpost.md  // <- https://example.com/posts/secondpost/
    └── quote
        ├── first.md       // <- https://example.com/quote/first/
        └── second.md      // <- https://example.com/quote/second/
```

Вот та же организация, работающая с `hugo --uglyURLs`:

```
.
└── content
    └── about
    |   └── _index.md  // <- https://example.com/about.html
    ├── posts
    |   ├── firstpost.md   // <- https://example.com/posts/firstpost.html
    |   ├── happy
    |   |   └── ness.md    // <- https://example.com/posts/happy/ness.html
    |   └── secondpost.md  // <- https://example.com/posts/secondpost.html
    └── quote
        ├── first.md       // <- https://example.com/quote/first.html
        └── second.md      // <- https://example.com/quote/second.html
```

## Канонизация

По умолчанию все относительные URL-адреса, встречающиеся во входных данных, остаются неизменными, например: `/css/foo.css` останется как `/css/foo.css`. Поле `canonifyURLs` на Вашем сайте `config` имеет значение по умолчанию `false`.

Если установить для `canonifyURLs` значение `true`, все относительные URL-адреса будут *канонизированы* с использованием `baseURL`. Например, если у Вас есть `baseURL = https://example.com/`, относительный URL-адрес `/css/foo.css` будет преобразован в абсолютный URL-адрес `https://example.com/css/foo.css`.

Преимущества канонизации включают фиксацию всех URL-адресов как абсолютных, что может помочь в некоторых задачах синтаксического анализа. Обратите внимание, однако, что все современные браузеры без проблем справляются с этим на клиенте.

Преимущества неканонизации включают возможность включения ресурсов в зависимости от схемы; например, чтобы можно было выбрать `http` vs `https` в соответствии с тем, как была получена страница.

{{% note "`canonifyURLs` default change" %}}
В выпуске Hugo v0.11, выпущенном в мае 2014 года, значение по умолчанию `canonifyURLs` было изменено с `true` на `false`, что, по нашему мнению, является лучшим значением по умолчанию и должно оставаться таковым в будущем. Пожалуйста, проверьте и настройте свой веб-сайт соответствующим образом, если Вы обновляетесь с v0.10 или более старых версий.
{{% /note %}}

Чтобы узнать текущее значение `canonifyURLs` для Вашего сайта, Вы можете использовать удобную команду `hugo config`, добавленную в v0.13.

```
hugo config | grep -i canon
```

Или, если Вы работаете в Windows и не установили `grep`:

```
hugo config | FINDSTR /I canon
```

## Установка URL-адреса в Front Matter

Помимо указания значений постоянных ссылок в конфигурации вашего сайта для различных разделов контента, Hugo обеспечивает еще более детальный контроль над отдельными частями контента.

И `slug` и `url` могут быть определены в индивидуальном первичном документе. Для получения дополнительной информации о местах назначения контента во время сборки смотрите [организацию контента][contentorg].

Начиная с Hugo 0.55, Вы можете использовать URL-адреса относительно текущего контекста сайта (языка), что упрощает обслуживание. Для японского перевода оба следующих примера получат один и тот же URL:

```markdown
---
title: "Custom URL!"
url: "/jp/custom/foo"
---
```

```markdown
---
title: "Custom URL!"
url: "custom/foo"
---
```

## Относительные URL-адреса

По умолчанию все относительные URL-адреса не меняются Hugo, что может быть проблематичным, если Вы хотите сделать свой сайт доступным для просмотра из локальной файловой системы.

Установка для параметра `relativeURLs` значения `true` в Вашей [конфигурации сайта][config] заставит Хьюго переписать все относительные URL-адреса относительно текущего контента.

Например, если Ваша страница `/posts/first/` содержит ссылку на `/about/`, Хьюго перепишет URL-адрес на `../../about/`.

[config]: /getting-started/configuration/
[contentorg]: /content-management/organization/
[front matter]: /content-management/front-matter/
[multilingual]: /content-management/multilingual/
[sections]: /content-management/sections/
[usage]: /getting-started/usage/