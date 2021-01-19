---
title: Шорткоды
linktitle:
description: Короткие коды - это простые фрагменты внутри файлов содержимого, вызывающие встроенные или настраиваемые шаблоны.
godocref:
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2019-11-07
menu:
  docs:
    parent: "content-management"
    weight: 35
weight: 35	#rem
categories: [content management]
keywords: [markdown,content,shortcodes]
draft: false
aliases: [/extras/shortcodes/]
testparam: "Hugo Rocks!"
toc: true
---

## Что такое шорткод

Хьюго любит Markdown из-за его простого формата контента, но бывают случаи, когда Markdown не оправдывает ожиданий. Часто авторы контента вынуждены добавлять необработанный HTML (например, видео `<iframe>`) в контент Markdown. Мы думаем, что это противоречит красивой простоте синтаксиса Markdown.

Хьюго создал **шорткоды**, чтобы обойти эти ограничения.

Шорткод - это простой фрагмент внутри файла содержимого, который Hugo будет отображать с использованием предопределенного шаблона. Обратите внимание, что шорткоды не работают в файлах шаблонов. Если Вам нужна функция вставки, которую предоставляют короткие коды, но в шаблоне, Вам, скорее всего, понадобится [частичный шаблон][partials].

Помимо более чистого Markdown, шорткоды можно обновлять в любое время, чтобы отразить новые классы, методы или стандарты. В момент создания сайта шорткоды Hugo легко объединятся с Вашими изменениями. Вы избегаете потенциально сложной операции поиска и замены.

## Используйте шорткоды

{{< youtube 2xkNJL4gJ9E >}}

В Ваших файлах содержимое шорткода может быть вызвано путем вызова `{{%/* shortcodename parameters */%}}`. Параметры шорткода разделяются пробелами, а параметры с внутренними пробелами могут быть заключены в кавычки.

Первым словом в объявлении шорткода всегда является имя шорткода. Параметры следуют за названием. В зависимости от того, как определен шорткод, параметры могут быть именованными, позиционными или и тем, и другим, хотя Вы не можете смешивать типы параметров в одном вызове. Формат именованных параметров соответствует формату HTML с форматом `name="value"`.

Некоторые шорткоды используют или требуют закрытия шорткодов. Опять же, как и в HTML, открывающий и закрывающий шорткоды совпадают (только имя) с закрывающим объявлением, перед которым стоит косая черта.

Вот два примера парных шорткодов:

```
{{%/* mdshortcode */%}}Stuff to `process` in the *center*.{{%/* /mdshortcode */%}}
```

```
{{</* highlight go */>}} A bunch of code here {{</* /highlight */>}}
```

В приведенных выше примерах используются два разных разделителя, разница состоит в том, что первый символ `%`, а второй -`<>`.

### Шорткоды с необработанными строковыми параметрами

{{< new-in "0.64.1" >}}

Вы можете передать несколько строк в качестве параметров в шорткод, используя необработанные строковые литералы:

```
{{</*  myshortcode `This is some <b>HTML</b>,
and a new line with a "quoted string".` */>}}
```

### Шорткоды с Разметкой

В Hugo `0.55` мы изменили принцип работы разделителя `%`. Шорткоды, использующие символ `%` в качестве крайнего внешнего разделителя, теперь будут полностью отображаться при отправке в средство визуализации контента (например, Blackfriday для Markdown), то есть они могут быть частью сгенерированного оглавления, сносок и т.д.

Если Вам нужно старое поведение, Вы можете поместить следующую строку в начало вашего шаблона шорткода:

```
{{ $_hugo_config := `{ "version": 1 }` }}
```

### Шорткоды без Разметки

Символ `<` указывает, что внутреннее содержимое шорткода *не* нуждается в дальнейшей визуализации. Часто шорткоды без разметки включают внутренний HTML:

```
{{</* myshortcode */>}}<p>Hello <strong>World!</strong></p>{{</* /myshortcode */>}}
```

### Вложенные шорткоды

Вы можете вызывать шорткоды внутри других шорткодов, создавая свои собственные шаблоны, использующие переменную `.Parent`. .Parent позволяет Вам проверить контекст, в котором вызывается шорткод. Смотрите [шаблоны шорткодов][sctemps].

## Используйте встроенные шорткоды Хьюго

Hugo поставляется с набором заранее определенных шорткодов, которые используются очень часто. Эти шорткоды предоставляются для удобства авторов и для того, чтобы Ваш контент уценки был чистым.

### `figure`

`figure`- это расширение синтаксиса изображений в markdown, которое не обеспечивает сокращение для более семантического [HTML5 элемент `<figure>`][figureelement].

Шорткод `figure` может использовать следующие именованные параметры:

src
: URL-адрес отображаемого изображения.

link
: Если изображение требует гиперссылки, URL-адрес назначения.

target
: Необязательный атрибут `target` для URL-адреса, если установлен параметр `link`.

rel
: Необязательный атрибут `rel` для URL-адреса, если установлен параметр `link`.

alt
: Альтернативный текст для изображения, если изображение не может быть отображено.

title
: Заголовок изображения.

caption
: Подпись к изображению. Будет отображена разметка в пределах значения `caption`.

class
: Атрибут `class` HTML-тега `figure`.

height
: Атрибут изображения `height`.

width
: Атрибут изображения `width`.

attr
: Текст атрибуции изображения. Будет отображена уценка в пределах значения `attr`.

attrlink
: Если текст атрибуции требует гиперссылки, URL-адрес назначения.

#### Пример ввода `figure`

{{< code file="figure-input-example.md" >}}
{{</* figure src="/media/spf13.jpg" title="Steve Francia" */>}}
{{< /code >}}

#### Пример вывода `figure`

{{< output file="figure-output-example.html" >}}
<figure>
  <img src="/media/spf13.jpg"  />
  <figcaption>
      <h4>Steve Francia</h4>
  </figcaption>
</figure>
{{< /output >}}

### `gist`

Блогеры часто хотят включать в сообщения GitHub gists. Предположим, мы хотим использовать [суть по следующему URL-адресу][examplegist]:

```
https://gist.github.com/spf13/7896402
```

Мы можем встроить суть в наш контент с помощью имени пользователя и идентификатора сущности, извлеченных из URL:

```
{{</* gist spf13 7896402 */>}}
```

#### Пример ввода `gist`

Если суть содержит несколько файлов и Вы хотите указать в кавычках только один из них, Вы можете передать имя файла (в кавычках) в качестве необязательного третьего аргумента:

{{< code file="gist-input.md" >}}
{{</* gist spf13 7896402 "img.html" */>}}
{{< /code >}}

#### Пример вывода `gist`

{{< output file="gist-output.html" >}}
{{< gist spf13 7896402 >}}
{{< /output >}}

#### Пример отображения `gist`

Чтобы продемонстрировать удивительную эффективность функции шорткода Хьюго, мы встроили на эту страницу пример `spf13` `gist`. Следующее моделирует опыт посетителей вашего веб-сайта. Естественно, окончательное отображение будет зависеть от ваших таблиц стилей и окружающей разметки.

{{< gist spf13 7896402 >}}

### `highlight`

Этот шорткод преобразует предоставленный исходный код в HTML с выделенным синтаксисом. Подробнее о [выделении](/tools/syntax-highlighting/). `highlight` принимает ровно один обязательный параметр `language` и требует закрывающего шорткода.

#### Пример ввода `highlight`

{{< code file="content/tutorials/learn-html.md" >}}
{{</* highlight html */>}}
<section id="main">
  <div>
   <h1 id="title">{{ .Title }}</h1>
    {{ range .Pages }}
        {{ .Render "summary"}}
    {{ end }}
  </div>
</section>
{{</* /highlight */>}}
{{< /code >}}

#### Пример вывода `highlight`

В приведенном выше примере шорткода `highlight` при рендеринге сайта будет создан следующий HTML-код:

{{< output file="tutorials/learn-html/index.html" >}}
<span style="color: #f92672">&lt;section</span> <span style="color: #a6e22e">id=</span><span style="color: #e6db74">&quot;main&quot;</span><span style="color: #f92672">&gt;</span>
  <span style="color: #f92672">&lt;div&gt;</span>
   <span style="color: #f92672">&lt;h1</span> <span style="color: #a6e22e">id=</span><span style="color: #e6db74">&quot;title&quot;</span><span style="color: #f92672">&gt;</span>{{ .Title }}<span style="color: #f92672">&lt;/h1&gt;</span>
    {{ range .Pages }}
        {{ .Render &quot;summary&quot;}}
    {{ end }}
  <span style="color: #f92672">&lt;/div&gt;</span>
<span style="color: #f92672">&lt;/section&gt;</span>
{{< /output >}}

{{% note "More on Syntax Highlighting" %}}
Чтобы увидеть еще больше вариантов добавления блоков кода с подсветкой синтаксиса на Ваш веб-сайт, смотрите [подсветку синтаксиса в инструментах разработчика](/tools/syntax-highlighting/).
{{% /note %}}

### `instagram`

Если вы хотите встроить фотографию из [инстаграм][Instagram], вам понадобится только идентификатор фотографии. Вы можете узнать идентификатор фотографии в Instagram по URL-адресу:

#### Пример ввода `instagram`

У Вас также есть возможность скрыть подпись:

#### Пример вывода `instagram`

Добавив предыдущий пример `hidecaption`, следующий HTML-код будет добавлен в разметку рендера Вашего веб-сайта:

#### Пример отображения `instagram`

Используя предыдущий пример `instagram` с `hidecaption`, приведенный выше, имитирует отображаемый опыт для посетителей Вашего веб-сайта. Естественно, окончательное отображение будет зависеть от Ваших таблиц стилей и окружающей разметки.

{{% note %}}
Шорткод `instagram` относится к конечной точке API Instagram, которая устарела с 24 октября 2020 г. Таким образом, из этой конечной точки API нельзя получить изображения, что приводит к ошибке при использовании шорткода `instagram`. Дополнительные сведения смотрите в выпуске GitHub [#7879](https://github.com/gohugoio/hugo/issues/7879).
{{% /note %}}

### `param`

Получает значение из текущих параметров страницы `Page`, установленных в начале, с возвратом к значению параметра сайта. Будет записана ошибка `ERROR`, если параметр с данным ключом не может быть найден ни в одном из них.

```bash
{{</* param testparam */>}}
```

Так как `testparam` - это параметр, определенный в начале этой страницы со значением `Hugo Rocks!`, то приведенное выше выведет:

{{< param testparam >}}

Чтобы получить доступ к глубоко вложенным параметрам, используйте "точечный синтаксис", например:

```bash
{{</* param "my.nested.param" */>}}
```

### `ref` и `relref`

Эти шорткоды будут искать страницы по их относительному пути (например, `blog/post.md`) или их логическому имени (`post.md`) и возвращать постоянную ссылку (`ref`) или относительную постоянную ссылку (`relref`) для найденной страницы.

`ref` и `relref` также позволяют создавать фрагментарные ссылки, которые работают для ссылок заголовков, созданных Hugo.

{{% note "More on Cross References" %}}
Прочтите более подробное описание `ref` и `relref` в документации [перекрестных ссылок](/content-management/cross-references/).
{{% /note %}}

`ref` и `relref` принимают ровно один обязательный параметр _ссылку_, заключенный в кавычки и в позиции `0`.

#### Пример ввода `ref` и `relref`

```
[Neat]({{</* ref "blog/neat.md" */>}})
[Who]({{</* relref "about.md#who" */>}})
```

#### Пример вывода `ref` и `relref`

Предположим, что включены стандартные URL-адреса Hugo.

```
<a href="/blog/neat">Neat</a>
<a href="/about/#who:c28654c202e73453784cfd2c5ab356c0">Who</a>
```

### `tweet`

Вы хотите включить один твит в свой блог? Все, что Вам нужно, это URL-адрес твита:

```
https://twitter.com/spf13/status/877500564405444608
```

#### Пример ввода `tweet`

Передайте идентификатор твита из URL-адреса в качестве параметра в шорткод `tweet`:

{{< code file="example-tweet-input.md" >}}
{{</* tweet 877500564405444608 */>}}
{{< /code >}}

#### Пример вывода `tweet`

Используя предыдущий пример `tweet`, следующий HTML-код будет добавлен в разметку Вашего отображаемого веб-сайта:

{{< output file="example-tweet-output.html" >}}
{{< tweet 877500564405444608 >}}
{{< /output >}}

#### Пример отображения `tweet`

Используя предыдущий пример `tweet`, следующее имитирует отображаемый опыт для посетителей Вашего веб-сайта. Естественно, окончательное отображение будет зависеть от Ваших таблиц стилей и окружающей разметки.

{{< tweet 877500564405444608 >}}

### `vimeo`

Добавление видео из [Vimeo][] эквивалентно [шорткоду ввода YouTube][YouTube Input shortcode].

```
https://vimeo.com/channels/staffpicks/146022717
```

#### Пример ввода `vimeo`

Извлеките идентификатор из URL-адреса видео и передайте его шорткоду `vimeo`:

{{< code file="example-vimeo-input.md" >}}
{{</* vimeo 146022717 */>}}
{{< /code >}}

#### Пример вывода `vimeo`

Используя предыдущий пример `vimeo`, следующий HTML-код будет добавлен в разметку Вашего визуализированного веб-сайта:

{{< output file="example-vimeo-output.html" >}}
{{< vimeo 146022717 >}}
{{< /output >}}

{{% tip %}}
Если Вы хотите дополнительно настроить визуальный стиль вывода YouTube или Vimeo, добавьте именованный параметр `class` при вызове шорткода. Новый `class` будет добавлен к `<div>`, который обертывает `<iframe>` *и* удалит встроенные стили. Обратите внимание, что Вам также нужно будет вызвать `id` как именованный параметр. Вы также можете дать видео vimeo описательный заголовок с помощью `title`.

```
{{</* vimeo id="146022717" class="my-vimeo-wrapper-class" title="My vimeo video" */>}}
```
{{% /tip %}}

#### Пример отображения `vimeo`

Используя предыдущий пример `vimeo`, следующее имитирует отображаемый опыт для посетителей Вашего веб-сайта. Естественно, окончательное отображение будет зависеть от Ваших таблиц стилей и окружающей разметки.

{{< vimeo 146022717 >}}

### `youtube`

Шорткод `youtube` встраивает адаптивный видеопроигрыватель для [YouTube видео][YouTube videos]. Требуется только идентификатор видео, например:

```
https://www.youtube.com/watch?v=w7Ft2ymGmfc
```

#### Пример ввода `youtube`

Скопируйте идентификатор видео YouTube, который следует за `v=` в URL-адресе видео, и передайте его шорткоду `youtube`:

{{< code file="example-youtube-input.md" >}}
{{</* youtube w7Ft2ymGmfc */>}}
{{< /code >}}

Более того, Вы можете автоматически запускать воспроизведение встроенного видео, установив для параметра `autoplay` значение `true`. Помните, что Вы не можете смешивать именованные и безымянные параметры, поэтому Вам нужно назначить еще безымянный идентификатор видео параметру `id`:


{{< code file="example-youtube-input-with-autoplay.md" >}}
{{</* youtube id="w7Ft2ymGmfc" autoplay="true" */>}}
{{< /code >}}

По [причинам доступности](https://dequeuniversity.com/tips/provide-iframe-titles), лучше всего указать название для Вашего видео на YouTube. Вы можете сделать это с помощью шорткода, указав параметр `title`. Если заголовок не указан, будет использоваться значение по умолчанию «Видео YouTube».

{{< code file="example-youtube-input-with-title.md" >}}
{{</* youtube id="w7Ft2ymGmfc" title="A New Hugo Site in Under Two Minutes" */>}}
{{< /code >}}

#### Пример вывода `youtube`

Используя предыдущий пример `youtube`, следующий HTML-код будет добавлен в разметку Вашего отображаемого веб-сайта:

{{< code file="example-youtube-output.html" >}}
{{< youtube id="w7Ft2ymGmfc" autoplay="true" >}}
{{< /code >}}

#### Пример отображения `youtube`

Используя предыдущий пример `youtube` (без `autoplay="true"`), следующий пример имитирует отображаемый опыт для посетителей Вашего веб-сайта. Естественно, окончательное отображение будет зависеть от Ваших таблиц стилей и окружающей разметки. Видео также включено в [быстрый старт к документации Hugo][quickstart].

{{< youtube w7Ft2ymGmfc >}}

## Конфигурация конфиденциальности

Чтобы узнать, как настроить свой сайт Hugo в соответствии с новыми правилами ЕС о конфиденциальности, см [Hugo и GDPR][Hugo and the GDPR].

## Создавайте собственные шорткоды

Чтобы узнать больше о создании пользовательских шорткодов, смотрите [документацию по шаблонам шорткодов][shortcode template documentation].

[`figure` shortcode]: #figure
[contentmanagementsection]: /content-management/formats/
[examplegist]: https://gist.github.com/spf13/7896402
[figureelement]: https://html5doctor.com/the-figure-figcaption-elements/ "An article from HTML5 doctor discussing the fig and figcaption elements."
[Hugo and the GDPR]: /about/hugo-and-gdpr/
[Instagram]: https://www.instagram.com/
[pagevariables]: /variables/page/
[partials]: /templates/partials/
[Pygments]: https://pygments.org/
[quickstart]: /getting-started/quick-start/
[sctemps]: /templates/shortcode-templates/
[scvars]: /variables/shortcodes/
[shortcode template documentation]: /templates/shortcode-templates/
[templatessection]: /templates/
[Vimeo]: https://vimeo.com/
[YouTube Videos]: https://www.youtube.com/
[YouTube Input shortcode]: #youtube