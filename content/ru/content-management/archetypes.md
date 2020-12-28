---
title: Архетипы
linktitle: Архетипы
description: Архетипы - это шаблоны, используемые при создании нового контента.
date: 2017-02-01
publishdate: 2017-02-01
keywords: [archetypes,generators,metadata,front matter]
categories: ["content management"]
menu:
  docs:
    parent: "content-management"
    weight: 70
  quicklinks:
weight: 70	#rem
draft: false
aliases: [/content/archetypes/]
toc: true
---

## Что такое архетипы?

**Архетипы** - это файлы шаблонов контента в [директории архетипов][archetypes directory] Вашего проекта, которые содержат предварительно сконфигурированный [front matter][] и, возможно, также размещение контента для [типов контента][content types] Вашего веб-сайта. Они будут использоваться, когда Вы запустите `hugo new`.

`hugo new` использует раздел `content-section` для поиска наиболее подходящего шаблона архетипа в Вашем проекте. Если Ваш проект не содержит файлов архетипа, он также будет искать в теме.

{{< code file="archetype-example.sh" >}}
hugo new posts/my-first-post.md
{{< /code >}}

Вышеупомянутое создаст новый файл содержимого в `content/posts/my-first-post.md`, используя первый найденный файл архетипа:

1. `archetypes/posts.md`
2. `archetypes/default.md`
3. `themes/my-theme/archetypes/posts.md`
4. `themes/my-theme/archetypes/default.md`

Последние два элемента списка применимы только в том случае, если Вы используете тему, и в качестве примера используется имя темы `my-theme`.

## Создать новый шаблон архетипа

Вымышленный пример для раздела `newsletter` и архетипа файла `archetypes/newsletter.md`. Создайте новый файл в `archetypes/newsletter.md` и откройте его в текстовом редакторе.

{{< code file="archetypes/newsletter.md" >}}
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
---

**Вставьте здесь ведущий абзац.**

## Новые интересные сообщения

{{ range first 10 ( where .Site.RegularPages "Type" "cool" ) }}
* {{ .Title }}
{{ end }}
{{< /code >}}

Когда Вы создаете новый информационный бюллетень с:

```bash
hugo new newsletter/the-latest-cool.stuff.md
```

Он создаст новый тип информационного бюллетеня для файла содержимого на основе шаблона архетипа.

**Примечание:** сайт будет создан только в том случае, если в файле архетипа используется `.Site`, а это может занять много времени для больших сайтов.

Приведенный выше _архетип рассылки_ иллюстрирует возможности: в файле архетипа можно использовать полную версию Hugo `.Site` и все функции шаблона Hugo.

## Архетипы на основе каталогов

Начиная с Hugo `0.49` Вы можете использовать полные каталоги в качестве шаблонов архетипов. Учитывая этот каталог архетипов:

```bash
archetypes
├── default.md
└── post-bundle
    ├── bio.md
    ├── images
    │   └── featured.jpg
    └── index.md
```

```bash
hugo new --kind post-bundle posts/my-post
```

Создает новую папку в `/content/posts/my-post` с тем же набором файлов, что и в папке архетипов `post-bundle`. Все файлы содержимого (`index.md` и т.д.) могут содержать логику шаблона и будут получать правильный `.Site` для языка содержимого.

[archetypes directory]: /getting-started/directory-structure/
[content types]: /content-management/types/
[front matter]: /content-management/front-matter/
