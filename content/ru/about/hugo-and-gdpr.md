---
title: Хьюго и Общий регламент по защите данных (GDPR)
linktitle: Hugo и GDPR
description: О том, как настроить Ваш сайт Hugo в соответствии с новыми правилами.
date: 2018-05-25
layout: single
keywords: ["GDPR", "Privacy", "Data Protection", "Конфиденциальность", "Защита данных"]
menu:
  docs:
    parent: "about"
    weight: 5
weight: 5
sections_weight: 5
draft: false
aliases: [/privacy/,/gdpr/]
toc: true
---


 Общие правила защиты данных ([GDPR](https://en.wikipedia.org/wiki/General_Data_Protection_Regulation)) - это положение в законе ЕС о защите данных и конфиденциальности для всех лиц в Европейском союзе и Европейской экономической зоне. Он вступил в силу 25 мая 2018 года.

 **Hugo - генератор статических сайтов. Используя Hugo, Вы уже стоите на очень твердой почве. О статических HTML-файлах на диске гораздо проще думать по сравнению с веб-сайтами, управляемыми сервером или базой данных.**

 Но даже статические веб-сайты могут интегрироваться с внешними службами, поэтому, начиная с версии `0.41`, Hugo предоставляет **Конфигурацию конфиденциальности**, которая охватывает соответствующие встроенные шаблоны.

 Обратите внимание, что:

 * Для этих настроек по умолчанию установлено значение _off_, то есть как это работало до Hugo `0.41`. Вы должны провести собственную оценку своего сайта и применить соответствующие настройки.
 * Эти настройки работают с [внутренними шаблонами](/templates/internal/). Некоторые темы могут содержать пользовательские шаблоны для встраивания таких сервисов, как Google Analytics. В этом случае эти параметры не действуют.
 * Мы продолжим эту работу и улучшим ее в будущих версиях Hugo.

## Все настройки конфиденциальности

Ниже приведены все настройки конфиденциальности и их значения по умолчанию. Эти настройки необходимо указать в конфигурации Вашего сайта (например, `config.toml`).

 {{< code-toggle file="config">}}
[privacy]
[privacy.disqus]
disable = false
[privacy.googleAnalytics]
disable = false
respectDoNotTrack = false
anonymizeIP = false
useSessionStorage = false
[privacy.instagram]
disable = false
simple = false
[privacy.twitter]
disable = false
enableDNT = false
simple = false
[privacy.vimeo]
disable = false
enableDNT = false
simple = false
[privacy.youtube]
disable = false
privacyEnhanced = false
{{< /code-toggle >}}


## Отключить все службы

Пример конфигурации конфиденциальности, которая отключает все соответствующие службы в Hugo. В этой конфигурации другие настройки не имеют значения.

 {{< code-toggle file="config">}}
[privacy]
[privacy.disqus]
disable = true
[privacy.googleAnalytics]
disable = true
[privacy.instagram]
disable = true
[privacy.twitter]
disable = true
[privacy.vimeo]
disable = true
[privacy.youtube]
disable = true
{{< /code-toggle >}}

## Объяснение настроек конфиденциальности

### GoogleAnalytics

anonymizeIP
: Включение этого сделает так, чтобы IP-адреса пользователей были анонимными в Google Analytics.

respectDoNotTrack
: Включение этого параметра заставит шаблоны GA уважать HTTP-заголовок «Не отслеживать».

useSessionStorage
: Включение этого отключит использование файлов cookie и будет использовать хранилище сеансов для хранения идентификатора клиента GA.

### Instagram

simple
: Если включен простой режим, будет создана статическая версия карты изображения Instagram без JS. Обратите внимание, что это поддерживает только карты изображений, а само изображение будет загружено с серверов Instagram.

**Примечание:** Если Вы используете _simple mode_ для Instagram и сайт, стилизованный под Bootstrap 4, Вы можете отключить встроенные стили, предоставляемые Hugo:

 {{< code-toggle file="config">}}
[services]
[services.instagram]
disableInlineCSS = true
{{< /code-toggle >}}

### Twitter

enableDNT
: Включив это для шорткода твиттера/твита, твит и его встроенная страница на Вашем сайте не будут использоваться для целей, которые включают персонализированные предложения и персонализированную рекламу.

simple
: Если включен простой режим, будет создана статическая версия твита и версия без JS.


**Примечание:** Если Вы используете _simple mode_ для Twitter, Вы можете отключить встроенные стили, предоставляемые Hugo:

 {{< code-toggle file="config">}}
[services]
[services.twitter]
disableInlineCSS = true
{{< /code-toggle >}}

### YouTube

privacyEnhanced
: Когда Вы включаете режим повышенной конфиденциальности, YouTube не сохраняет информацию о посетителях Вашего веб-сайта, пока пользователь не воспроизведет встроенное видео.

### Vimeo

enableDNT
: Включив это для шорткода vimeo, проигрыватель Vimeo будет заблокирован от отслеживания любых данных сеанса, включая все файлы cookie и статистику.

simple
: Если включен простой режим, миниатюра видео загружается с серверов Vimeo и перекрывается кнопкой воспроизведения. Если пользователь щелкнет для воспроизведения видео, оно откроется в новой вкладке прямо на веб-сайте Vimeo.
