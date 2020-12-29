---
title: Комментарии
linktitle: Комментарии
description: Hugo поставляется с внутренним шаблоном Disqus, но это не единственная система комментариев, которая будет работать с Вашим новым веб-сайтом Hugo.
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-03-09
keywords: [sections,content,organization]
categories: [project organization, fundamentals]
menu:
  docs:
    parent: "content-management"
    weight: 140
weight: 140	#rem
draft: false
aliases: [/extras/comments/]
toc: true
---

Hugo поставляется с поддержкой [Disqus](https://disqus.com/), сторонней службы, которая предоставляет веб-сайты возможность комментирования и сообщества через JavaScript.

Ваша тема может уже поддерживать Disqus, но если нет, ее легко добавить в Ваши шаблоны с помощью [Частично встроенный Disqus в Хьюго][disquspartial].

## Добавить Disqus

Hugo поставляется со всем кодом, необходимым для загрузки Disqus в Ваши шаблоны. Перед добавлением Disqus на свой сайт Вам необходимо [создать учетную запись][disqussetup].

### Настроить Disqus

Комментарии Disqus требуют, чтобы Вы установили одно значение в [файл конфигурации сайта][configuration], например:

{{< code-toggle copy="false" >}}
disqusShortname = "yourdiscussshortname"
{{</ code-toggle >}}

Для многих сайтов такой конфигурации вполне достаточно. Тем не менее, у Вас также есть возможность установить следующие параметры в [front matter][] одного файла содержимого:

* `disqus_identifier`
* `disqus_title`
* `disqus_url`

### Отрисовка встроенного частичного шаблона Disqus от Hugo

У Disqus есть собственный [внутренний шаблон](https://gohugo.io/templates/internal/#disqus), чтобы он отображался, добавьте следующий код там, где Вы хотите, чтобы комментарии отображались:

```
{{ template "_internal/disqus.html" . }}
```

## Альтернативы комментариев

There are a few alternatives to commenting on static sites for those who do not want to use Disqus:

* [Staticman](https://staticman.net/)
* [Talkyard](https://www.talkyard.io/blog-comments) (Открытый исходный код и бессерверный хостинг)
* [IntenseDebate](https://intensedebate.com/)
* [Graph Comment][]
* [Muut](https://muut.com/)
* [Isso](https://posativ.org/isso/) (Самостоятельное размещение, Python)
  * [Учебник по реализации Isso с Hugo][issotutorial]
* [Utterances](https://utteranc.es/) (Открытый исходный код, виджет комментариев GitHub, основанный на проблемах GitHub)
* [Remark](https://github.com/umputun/remark) (Открытый исходный код, Golang, Простой в использовании докер)
* [Commento](https://commento.io/) (Открытый исходный код, доступный в виде службы, локальной установки или образа докера)
* [Hyvor Talk](https://talk.hyvor.com/) (Доступно как услуга)

[configuration]: /getting-started/configuration/
[disquspartial]: /templates/partials/#disqus
[disqussetup]: https://disqus.com/profile/signup/
[forum]: https://discourse.gohugo.io
[front matter]: /content-management/front-matter/
[Graph Comment]: https://graphcomment.com/
[kaijuissue]: https://github.com/spf13/kaiju/issues/new
[issotutorial]: https://stiobhart.net/2017-02-24-isso-comments/
[partials]: /templates/partials/
[MongoDB]: https://www.mongodb.com/
[tweet]: https://twitter.com/spf13
