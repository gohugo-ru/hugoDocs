
---
date: 2020-12-19
title: "Hugo 0.79.1: Одно исправление безопасности для Hugo в Windows"
description: "Запретить запуск, например, Pandoc в текущем каталоге."
categories: ["Releases"]
images:
- images/blog/hugo-bug-poster.png

---

Hugo зависит от `os/exec` Go для определенных функций, например для рендеринга документов Pandoc, если эти двоичные файлы находятся в системе `%PATH%` в Windows. Однако, если вредоносный файл с таким же именем (`exe` или `bat`) был обнаружен в текущем рабочем каталоге во время запуска `hugo`, то вместо системной будет вызвана вредоносная команда.

Это затронуло пользователей Windows, которые запускали `hugo` на ненадежных сайтах Hugo.

Причина этой проблемы - Go, смотрите https://github.com/golang/go/issues/38736

Мы исправили это в Hugo, [используя](https://github.com/gohugoio/hugo/commit/4a8267d64a40564aced0695bca05249da17b0eab) исправленную версию `exec.LookPath` из https://github.com/cli/safeexec (спасибо [@mislav](https://github.com/mislav) за реализацию).

Спасибо [@Ry0taK](https://github.com/Ry0taK) за отчет об ошибке.
