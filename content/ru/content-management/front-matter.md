---
title: Front Matter
linktitle:
description: Hugo позволяет добавлять front matter в файлы содержимого на языках yaml, toml или json.
date: 2017-01-09
publishdate: 2017-01-09
lastmod: 2017-02-24
categories: [content management]
keywords: ["front matter", "yaml", "toml", "json", "metadata", "archetypes"]
menu:
  docs:
    parent: "content-management"
    weight: 30
weight: 30	#rem
draft: false
aliases: [/content/front-matter/]
toc: true
---

**Front matter** позволяет хранить метаданные, прикрепленные к экземпляру [типов контента][content type], т.е. встроенные в файл контента, и это одна из многих функций, которые придают Hugo его силу.

{{< youtube Yh2xKRJGff4 >}}

## Форматы Front Matter

Hugo поддерживает четыре формата для front matter, каждый со своими собственными идентификационными токенами.

TOML
: определяется открытием и закрытием `+++`.

YAML
: определяется открытием и закрытием `---`.

JSON
: один объект JSON, окруженный символами '`{`' и '`}`', за которым следует новая строка.

ORG
: группа ключевых слов Org  режима в формате '`#+KEY: VALUE`'. Любая строка, которая не начинается с `#+`, завершает раздел вводной части.
  Значения ключевых слов могут быть строками (`#+KEY: VALUE`) или списком строк, разделенных пробелами (`#+KEY[]: VALUE_1 VALUE_2`).

### Пример

{{< code-toggle >}}
title = "spf13-vim 3.0 release and new website"
description = "spf13-vim is a cross platform distribution of vim plugins and resources for Vim."
tags = [ ".vimrc", "plugins", "spf13-vim", "vim" ]
date = "2012-04-06"
categories = [
  "Development",
  "VIM"
]
slug = "spf13-vim-3-0-release-and-new-website"
{{< /code-toggle >}}

## Переменные Front Matter

### Предопределенный

Есть несколько предопределенных переменных, о которых Хьюго знает. Смотрите [Переменные страницы][pagevars], чтобы узнать, как вызывать многие из этих предопределенных переменных в Ваших шаблонах.

aliases
: массив из одного или нескольких псевдонимов (например, старых опубликованных путей переименованного контента), которые будут созданы в структуре выходного каталога. Подробнее смотрите [псевдонимы][aliases].

audio
: массив путей к аудиофайлам, относящимся к странице; используется `opengraph` [внутренний шаблон](/templates/internal) для заполнения `og:audio`.

cascade
: карта ключей Front Matter, значения которых передаются потомкам страницы, если они не перезаписываются самим собой или каскадом более близких предков. Смотрите [Front Matter Cascade](#front-matter-cascade) для получения подробной информации.

date
: дата и время, назначенное этой странице. Обычно это выбирается из поля `date` в начале сообщения, но это поведение можно настроить.

description
: описание для контента.

draft
: если `true`, контент не будет отображаться, если флаг `--buildDrafts` не передан команде `hugo`.

expiryDate
: дата и время, при которых контент больше не должен публиковаться Hugo; Просроченный контент не будет отображаться, если флаг `--buildExpired` не передан команде `hugo`.

headless
: если `true`, устанавливает для leaf bundle значение [headless][headless-bundle].

images
: массив путей к изображениям, относящимся к странице; используется [внутренними шаблонами](/templates/internal), такими как `_internal/twitter_cards.html`.

isCJKLanguage
: если `true`, Hugo будет явно рассматривать контент как язык CJK; как `.Summary` так и `.WordCount` корректно работают на CJK языках.

keywords
: мета-ключевые слова для содержания.

layout
: макет Хьюго должен выбирать из [порядок поиска][lookup] при рендеринге содержимого. Если `type` не указан во вступительной части, Hugo будет искать макет с тем же именем в каталоге макета, который соответствует разделу содержимого. Смотрите ["Определение типа контента"][definetype]

lastmod
: дата и время последнего изменения содержимого.

linkTitle
: используется для создания ссылок на контент; если установлено, Хьюго по умолчанию использует `linktitle` перед `title`. Хьюго также может [упорядочить списки контента по `linktitle`][bylinktitle].

markup
: **экспериментальный**; укажите `"rst"` для reStructuredText (требуется `rst2html`) или `"md"` (по умолчанию) для Markdown.

outputs
: позволяет указать форматы вывода, специфичные для содержимого. Смотрите [форматы вывода][outputs].

publishDate
: если в будущем контент не будет отображаться, если флаг `--buildFuture` не передан в `hugo`.

resources
: используется для настройки ресурсов пакета страниц. Смотрите [Ресурсы страницы][page-resources].

series
: массив серий, к которым принадлежит эта страница, как подмножество `series` [таксономия](/content-management/taxonomies/); используется `opengraph` [внутренний шаблон](/templates/internal) для заполнения `og:see_also`.

slug
: отображается в конце выходного URL. Значение, указанное в заголовке, переопределит сегмент URL-адреса на основе имени файла.

summary
: текст, используемый при предоставлении резюме статьи в переменной страницы `.Summary`; подробности доступны в разделе [резюме содержания](/content-management/summaries/).

title
: название содержания.

type
: тип контента; это значение будет автоматически получено из каталога (т. е., [раздел][section]), если не указано в предварительном сообщении.

url
: полный путь к содержимому из корня сети. Он не делает никаких предположений о пути к файлу содержимого. Он также игнорирует любые языковые префиксы многоязычной функции.

videos
: массив путей к видео, относящимся к странице; используется в `opengraph` [внутреннего шаблона](/templates/internal) для заполнения `og:video`.

weight
: используется для [упорядочивания вашего контента в списках][ordering]. Меньший вес имеет более высокий приоритет. Так что довольство меньшим весом будет на первом месте. Если установлено, веса должны быть ненулевыми, поскольку 0 интерпретируется как *неустановленный* вес.

\<taxonomies\>
: имя поля в форме *множественного числа* индекса. Смотрите `tags` и `categories` в примерах выше. _Обратите внимание, что форма множественного числа определяемых пользователем таксономий не может совпадать с любой из предопределенных первичных переменных._

{{% note "Hugo's Default URL Destinations" %}}
Если ни `slug`, ни `url` отсутствуют и [постоянные ссылки не настроены иначе в файле `config` конфигурации Вашего сайта](/content-management/urls/#permalinks), Hugo будет использовать имя файла вашего контента для создания вывода URL-адреса. Смотрите [организация контента](/content-management/organization) для объяснения путей в Hugo и [Управление URL-адресами](/content-management/urls/) для получения информации о способах настройки поведения Hugo по умолчанию.
{{% /note %}}

### Определяемые пользователем

Вы можете произвольно добавлять поля в свой вступительный документ в соответствии со своими потребностями. Эти определяемые пользователем пары "ключ-значение" помещаются в одну переменную `.Params` для использования в Ваших шаблонах.

Доступ к следующим полям можно получить через `.Params.include_toc` и `.Params.show_comments` соответственно. В разделе [Переменные][Variables] представлена дополнительная информация об использовании переменных уровня страницы и сайта Hugo в Ваших шаблонах.

{{< code-toggle copy="false" >}}
include_toc: true
show_comments: false
{{</ code-toggle >}}

## Каскад Front Matter

Любой узел или раздел может передать потомкам набор значений Front Matter, если они определены под зарезервированным ключом Front Matter `cascade`.

### Целевые определенные страницы

{{< new-in "0.76.0" >}}

Начиная с Hugo 0.76, блок `cascade` может быть срезом с необязательным ключевым словом `_target`, что позволяет использовать несколько значений `cascade` для разных наборов страниц.

{{< code-toggle copy="false" >}}
title ="Blog"
[[cascade]]
background = "yosemite.jpg"
[cascade._target]
path="/blog/**"
lang="en"
kind="page"
[[cascade]]
background = "goldenbridge.jpg"
[cascade._target]
kind="section"
{{</ code-toggle >}}

Ключевые слова, доступные для `_target`:

path
: Шаблон [Glob](https://github.com/gobwas/glob) , соответствующий пути к содержимому ниже `/content`. Ожидает косые черты в стиле Unix. Обратите внимание, что это виртуальный путь, поэтому он начинается с корня монтирования. Сопоставление поддерживает двойные звездочки, поэтому Вы можете сопоставить шаблоны вроде `/blog/*/**`, чтобы сопоставить все, начиная с третьего уровня и ниже.

kind
: Шаблон Glob, соответствующий типу страницы, например: "{home,section}".

lang
: Шаблон Glob, соответствующий языку страницы, например: "{en,sv}".

Любое из вышеперечисленного можно опустить.

### Пример

В `content/blog/_index.md`

{{< code-toggle copy="false" >}}
title: Blog
cascade:
  banner: images/typewriter.jpg
{{</ code-toggle >}}

В приведенном выше примере страница раздела блога и ее потомки будут возвращать `images/typewriter.jpg` при вызове `.Params.banner`, если:

- Указанный потомок имеет собственное установленное значение `banner`.
- Или для более близкого узла-предка установлено собственное значение `cascade.banner`.

## Порядок контента через Front Matter

Вы можете назначить `weight` , зависящий от контента, в начале Вашего контента. Эти значения особенно полезны для [упорядочивания][ordering] в представлениях списка. Вы можете использовать `weight` для упорядочивания контента и соглашение [`<TAXONOMY>_weight`][taxweight] для упорядочивания контента в таксономии. Смотрите [Упорядочивание и группировка списков Hugo][lists], чтобы увидеть, как `weight` можно использовать для организации Вашего контента в представлениях списков.

## Переопределить глобальную конфигурацию разметки

Можно установить некоторые параметры для рендеринга Markdown в заголовке контента в качестве замены [параметров рендеринга BlackFriday, заданных в конфигурации Вашего проекта][config].

## Технические характеристики формата Front Matter

* [TOML Spec][toml]
* [YAML Spec][yaml]
* [JSON Spec][json]

[variables]: /variables/
[aliases]: /content-management/urls/#aliases
[archetype]: /content-management/archetypes/
[bylinktitle]: /templates/lists/#by-link-title
[config]: /getting-started/configuration/ "Hugo documentation for site configuration"
[content type]: /content-management/types/
[contentorg]: /content-management/organization/
[definetype]: /content-management/types/#defining-a-content-type "Learn how to specify a type and a layout in a content's front matter"
[headless-bundle]: /content-management/page-bundles/#headless-bundle
[json]: https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf "Specification for JSON, JavaScript Object Notation"
[lists]: /templates/lists/#ordering-content "See how to order content in list pages; for example, templates that look to specific _index.md for content and front matter."
[lookup]: /templates/lookup-order/ "Hugo traverses your templates in a specific order when rendering content to allow for DRYer templating."
[ordering]: /templates/lists/ "Hugo provides multiple ways to sort and order your content in list templates"
[outputs]: /templates/output-formats/ "With the release of v22, you can output your content to any text format using Hugo's familiar templating"
[page-resources]: /content-management/page-resources/
[pagevars]: /variables/page/
[section]: /content-management/sections/
[taxweight]: /content-management/taxonomies/
[toml]: https://github.com/toml-lang/toml "Specification for TOML, Tom's Obvious Minimal Language"
[urls]: /content-management/urls/
[variables]: /variables/
[yaml]: https://yaml.org/spec/ "Specification for YAML, YAML Ain't Markup Language"
