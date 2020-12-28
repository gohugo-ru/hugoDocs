---
title: Статические файлы
description: "Файлы, которые обслуживаются **статически** (как есть, без изменений) в корне сайта."
date: 2017-11-18
categories: [content management]
keywords: [source, directories]
menu:
  docs:
    parent: "content-management"
    weight: 130
weight: 130	#rem
aliases: [/static-files]
toc: true
---

По умолчанию каталог `static/` в проекте сайта используется для всех **статических файлов** (например, таблиц стилей, JavaScript, изображений). Статические файлы обслуживаются по корневому пути сайта (например, если у Вас есть файл `static/image.png`, Вы можете получить к нему доступ, используя `http://{server-url}/image.png`, чтобы включить его в документ, который Вы можете использовать `![Example image](/image.png) )`.

Hugo можно настроить так, чтобы он просматривал другой каталог или даже **несколько каталогов** для таких статических файлов, настроив параметр `staticDir` в [конфигурации сайта][site config]. Все файлы во всех статических каталогах образуют объединенную файловую систему.

Эта объединенная файловая система будет обслуживаться из корня Вашего сайта. Таким образом, файл `<SITE PROJECT>/static/me.png` будет доступен как `<MY_BASEURL>/me.png`.

Вот пример установки `staticDir` и `staticDir2` для многоязычного сайта:

{{< code-toggle copy="false" file="config" >}}
staticDir = ["static1", "static2"]

[languages]
[languages.en]
staticDir2 = "static_en"
baseURL = "https://example.com"
languageName = "English"
weight = 2
title = "In English"
[languages.no]
staticDir = ["staticDir_override", "static_no"]
baseURL = "https://example.no"
languageName = "Norsk"
weight = 1
title = "På norsk"
{{</ code-toggle >}}

В приведенном выше примере без использования темы:

- Сайт на английском языке получит свои статические файлы как объединение «static1», «static2» и «static_en». При дублировании файлов выигрывает самая правая версия.
- Норвежский сайт получит свои статические файлы как объединение "staticDir_override" и "static_no".

Примечание 1
: **2** (может быть числом от 0 до 10) в `staticDir2` добавляется, чтобы сообщить Хьюго, что вы хотите **добавить** этот каталог в глобальный набор статических каталогов, определенных с помощью `staticDir`. Использование `staticDir` на уровне языка заменит глобальное значение (как видно на примере норвежского сайта).

Примечание 2
: Приведенный выше пример - [установка нескольких хостов][multihost setup]. При обычной настройке все статические каталоги будут доступны для всех сайтов.

[site config]: /getting-started/configuration/#all-configuration-settings
[multihost setup]: /content-management/multilingual/#configure-multilingual-multihost
