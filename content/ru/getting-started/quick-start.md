---
title: Быстрый старт
linktitle: Быстрый старт
description: Создайте сайт Hugo, используя красивую тему Ananke.
date: 2013-07-01
publishdate: 2013-07-01
categories: [getting started]
keywords: [quick start,usage,быстрый старт]
authors: [Shekhar Gulati, Ryan Watters]
menu:
  docs:
    parent: "getting-started"
    weight: 10
weight: 10
sections_weight: 10
draft: false
aliases: [/quickstart/,/overview/quickstart/]
toc: true
---

{{% note %}}
В этом кратком руководстве в примерах используется `macOS`. Инструкции по установке Hugo в других операционных системах смотрите в разделе [установка](/getting-started/installing).

Для запуска этого руководства рекомендуется установить [Git](https://git-scm.com/downloads).

Для других подходов к изучению Хьюго, таких как книга или видеоурок, обратитесь к странице [внешние ресурсы обучения](/getting-started/external-learning-resources/).
{{% /note %}}

## Шаг 1. Установка Хьюго

{{% note %}}
`Homebrew` и `MacPorts`, менеджеры пакетов для `macOS`, могут быть установлены с [brew.sh](https://brew.sh/) или [macports.org](https://www.macports.org/) соответственно. Смотрите [установку](/getting-started/installing), если Вы используете Windows и т.д.
{{% /note %}}

```bash
brew install hugo
# или
port install hugo
```

Чтобы проверить новую установку:

```bash
hugo version
```

{{< asciicast ItACREbFgvJ0HjnSNeTknxWy9 >}}

## Шаг 2. Создание нового сайта

```bash
hugo new site quickstart
```

Вышеупомянутый создаст новый сайт Hugo в папке с именем `quickstart`.

{{< asciicast 3mf1JGaN0AX0Z7j5kLGl3hSh8 >}}

## Шаг 3: Добавление темы

Смотрите [themes.gohugo.io](https://themes.gohugo.io/) для получения списка тем для рассмотрения. В этом кратком руководстве используется красивая [тема Ananke](https://themes.gohugo.io/gohugo-theme-ananke/).

Сначала загрузите тему с GitHub и добавьте ее в каталог `themes` Вашего сайта:

```bash
cd quickstart
git init
git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke
```

*Примечание для пользователей, не использующих git:*
   - Если у Вас не установлен git, Вы можете скачать архив последней версии этой темы по ссылке:
       https://github.com/budparr/gohugo-theme-ananke/archive/master.zip
   - Извлеките этот файл .zip, чтобы получить каталог "gohugo-theme-ananke-master".
   - Переименуйте этот каталог в "ananke" и переместите его в каталог "themes/".

Затем добавьте тему в конфигурацию сайта:

```bash
echo 'theme = "ananke"' >> config.toml
```

{{< asciicast 7naKerRYUGVPj8kiDmdh5k5h9 >}}

## Шаг 4: Добавление контента

Вы можете вручную создавать файлы содержимого (например, как `content/<CATEGORY>/<FILE>.<FORMAT>`) и предоставлять в них метаданные, однако Вы можете использовать команду `new`, чтобы сделать несколько вещей за Вас (например, добавить заголовок и дату):

```
hugo new posts/my-first-post.md
```

{{< asciicast eUojYCfRTZvkEiqc52fUsJRBR >}}

Если хотите, отредактируйте только что созданный файл содержимого, он будет начинаться примерно так:

```markdown
---
title: "Мой первый пост"
date: 2019-03-26T08:47:11+01:00
draft: true
---

```

{{% note %}}
Черновики не развертываются; как только вы закончите публикацию, обновите заголовок сообщения, чтобы он сказал `draft: false`. Дополнительная информация [здесь](/getting-started/usage/#draft-future-and-expired-content).
{{% /note %}}

## Шаг 5: Запуск сервера Хьюго

Теперь запустите сервер Hugo с включенными [черновиками](/getting-started/usage/#draft-future-and-expired-content):

{{< asciicast BvJBsF6egk9c163bMsObhuNXj >}}

```
▶ hugo server -D

                   | RU | EN
-------------------+----+----+
  Pages            | 10 | 10
  Paginator pages  |  0 |  0
  Non-page files   |  0 |  0
  Static files     |  3 |  3
  Processed images |  0 |  0
  Aliases          |  1 |  1
  Sitemaps         |  1 |  1
  Cleaned          |  0 |  0

Всего за 11 мс
Наблюдаем за изменениями в /Users/bep/quickstart/{content,data,layouts,static,themes}
Наблюдаем за изменениями конфигурации в /Users/bep/quickstart/config.toml
Среда разработки: "development"
Обслуживание страниц по памяти
Работает в режиме быстрого рендеринга. Для полной перестройки при изменении: hugo server --disableFastRender
Веб-сервер доступен по адресу http://localhost:1313/ (адрес привязки 127.0.0.1)
Нажмите Ctrl+C, чтобы остановить
```

**Перейдите на свой новый сайт по адресу [http://localhost:1313/](http://localhost:1313/).**

Не стесняйтесь редактировать или добавлять новый контент и просто обновлять в браузере, чтобы быстро увидеть изменения (Вам может потребоваться принудительное обновление в веб-браузере, что-то вроде Ctrl-R обычно работает).

## Шаг 6: Настройка темы

Ваш новый сайт уже выглядит отлично, но Вы захотите немного его настроить, прежде чем опубликовать его.

### Конфигурация сайта

Откройте `config.toml` в текстовом редакторе:

```
baseURL = "https://example.org/"
languageCode = "en-us"
title = "My New Hugo Site"
theme = "ananke"
```

Замените заголовок `title` выше на что-нибудь более личное. Также, если у Вас уже есть готовый домен, замените `baseURL`. Обратите внимание, что это значение не требуется при запуске локального сервера разработки. Для указания своего языка замените `languageCode`. Тема указывается в `theme`.

```
baseURL = "https://gohugo.ru/"
languageCode = "ru-ru"
title = "Мой новый сайт Хьюго"
theme = "ananke2"
```

{{% note %}}
**Совет:** Внесите изменения в конфигурацию сайта или любой другой файл на Вашем сайте во время работы сервера Hugo, и Вы сразу увидите изменения в браузере, хотя Вам может потребоваться [очистить кеш](https://kb.iu.edu/d/ahic).
{{% /note %}}

Параметры конфигурации для конкретной темы смотрите на [сайте темы](https://github.com/budparr/gohugo-theme-ananke).

**Для дальнейшей настройки темы смотрите [настройку темы](/themes/customizing/).**

### Шаг 7. Создание статических страниц

Это просто. Нужно вызвать:

```
hugo -D
```

По умолчанию вывод будет в каталоге `./public/` (флаг `-d`/`--destination`, чтобы изменить его, или установите `publishdir` в файле конфигурации).
