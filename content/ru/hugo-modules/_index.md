---
title: Модули Хьюго
linktitle: Обзор модулей Hugo
description: Как использовать модули Hugo.
date: 2017-02-01
publishdate: 2017-02-01
menu:
  docs:
    parent: "modules"
    weight: 01
weight: 01
sections_weight: 01
categories: [hugo modules]
keywords: [themes,modules]
draft: false
aliases: [/themes/overview/,/themes/]
toc: true
---

**Модули Hugo** являются основными строительными блоками в Hugo. _Модуль_ может быть Вашим основным проектом или меньшим модулем, предоставляющим один или несколько из 7 типов компонентов, определенных в Hugo: **static**, **content**, **layouts**, **data**, **assets**, **i18n** и **archetypes**.

Вы можете комбинировать модули в любой комбинации, которая Вам нравится, и даже монтировать каталоги из не-Hugo проектов, образуя большую виртуальную объединенную файловую систему.

Модули Hugo работает на модулях Go. Для получения дополнительной информации о модулях Go смотрите:

- [https://github.com/golang/go/wiki/Modules](https://github.com/golang/go/wiki/Modules)
- [https://blog.golang.org/using-go-modules](https://blog.golang.org/using-go-modules)

Это все совершенно новое, и есть только несколько примеров проектов:

- [https://github.com/bep/docuapi](https://github.com/bep/docuapi) - это тема, которая была перенесена в Модули Hugo во время тестирования этой функции. Это хороший пример проекта, не относящегося к Hugo, смонтированного в структуре папок Hugo. Он даже показывает реализацию JS Bundler в обычных шаблонах Go.
- [https://github.com/bep/my-modular-site](https://github.com/bep/my-modular-site) - это очень простой сайт, используемый для тестирования.
