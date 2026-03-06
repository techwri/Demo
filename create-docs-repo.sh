#!/usr/bin/env bash
set -euo pipefail

REPO_NAME="${1:-project-name}"

echo "Создаю репозиторий: ${REPO_NAME}"

mkdir -p "${REPO_NAME}"/docs/{overview,architecture,api,user-guide,admin,development,qa,adr,templates,evidence/{screenshots,reports,audits},assets/{images,diagrams,attachments}}
mkdir -p "${REPO_NAME}"/.docslint
mkdir -p "${REPO_NAME}"/.github/workflows

cat > "${REPO_NAME}/README.md" <<'EOF'
# Project Name

Репозиторий содержит исходный код и комплект инженерной документации по проекту.

## Назначение

Проект предназначен для демонстрации правильной структуры хранения документации в Git-репозитории и использования автоматизированных проверок качества документации.

## Структура

- `docs/` — основная документация
- `.docslint/` — профиль и правила проверки
- `.github/workflows/` — сценарии CI/CD
- `mkdocs.yml` — конфигурация публикации документации

## Быстрый старт

1. Клонировать репозиторий
2. Установить зависимости для сборки документации
3. Запустить локальный просмотр документации
4. Выполнить проверку DocsLint

## Документация

Основная точка входа в документацию: `docs/index.md`

## Контакты

Ответственный за документацию: docs@example.com
EOF

cat > "${REPO_NAME}/CHANGELOG.md" <<'EOF'
# Changelog

## 0.1.0 - 2026-03-06

### Added

- Создан эталонный репозиторий документации
- Добавлена базовая структура разделов
- Добавлена конфигурация MkDocs
- Добавлен профиль проверки DocsLint
EOF

cat > "${REPO_NAME}/CONTRIBUTING.md" <<'EOF'
# Contributing

## Общие правила

Изменения в документации должны выполняться через pull request.

## Требования к изменениям

- новые документы размещаются только в согласованных разделах
- заголовки должны быть понятными и однозначными
- для новых терминов требуется обновление глоссария
- для архитектурных изменений требуется ADR
- для новых пользовательских сценариев требуется обновление user-guide

## Проверки перед публикацией

- сборка документации проходит без ошибок
- отсутствуют битые ссылки
- обязательные разделы не удалены
- изменения отражены в changelog при необходимости
EOF

cat > "${REPO_NAME}/mkdocs.yml" <<'EOF'
site_name: Project Documentation
site_description: Эталонная структура инженерной документации
theme:
  name: material

nav:
  - Главная: index.md
  - Общие сведения:
      - Назначение: overview/purpose.md
      - Область применения: overview/scope.md
      - Глоссарий: overview/glossary.md
  - Архитектура:
      - Контекст: architecture/context.md
      - Компоненты: architecture/components.md
      - Модель данных: architecture/data-model.md
      - Интеграции: architecture/integrations.md
      - Развертывание: architecture/deployment.md
  - API:
      - Обзор: api/overview.md
      - Аутентификация: api/auth.md
      - Методы: api/endpoints.md
      - Примеры: api/examples.md
  - Руководство пользователя:
      - Начало работы: user-guide/getting-started.md
      - Основные сценарии: user-guide/main-scenarios.md
      - FAQ: user-guide/faq.md
      - Устранение проблем: user-guide/troubleshooting.md
  - Администрирование:
      - Установка: admin/installation.md
      - Конфигурация: admin/configuration.md
      - Резервное копирование: admin/backup.md
      - Мониторинг: admin/monitoring.md
  - Разработка:
      - Локальный запуск: development/local-setup.md
      - Правила кодирования: development/coding-rules.md
      - Релизный процесс: development/release-process.md
      - CI/CD: development/ci-cd.md
  - QA:
      - План тестирования: qa/test-plan.md
      - Тест-кейсы: qa/test-cases.md
      - Критерии приемки: qa/acceptance-criteria.md
  - ADR:
      - ADR-0001: adr/0001-use-mkdocs.md
      - ADR-0002: adr/0002-api-versioning.md
EOF

cat > "${REPO_NAME}/.docslint/profile.yml" <<'EOF'
profile:
  id: repo_docs_best_practice
  name: Repository Documentation Best Practice
  description: Проверка структуры и полноты инженерной документации

required_files:
  - README.md
  - CHANGELOG.md
  - mkdocs.yml
  - docs/index.md
  - docs/overview/purpose.md
  - docs/architecture/components.md
  - docs/user-guide/getting-started.md
  - docs/admin/installation.md
  - docs/development/ci-cd.md

required_directories:
  - docs/overview
  - docs/architecture
  - docs/api
  - docs/user-guide
  - docs/admin
  - docs/development
  - docs/qa
  - docs/adr
  - .docslint

forbidden_patterns:
  - "tmp"
  - "draft-final-final"
  - "new folder"

rules:
  require_readme: true
  require_changelog: true
  require_docs_index: true
  require_mkdocs_config: true
  enforce_docs_directory: true
EOF

cat > "${REPO_NAME}/.docslint/rules.yml" <<'EOF'
rules:
  naming:
    lowercase_with_dash: true
    allowed_extensions:
      - md
      - yml
      - yaml
      - png
      - jpg
      - jpeg
      - svg

  structure:
    docs_must_be_under_docs_dir: true
    no_random_markdown_in_root: true
    allow_root_markdown:
      - README.md
      - CHANGELOG.md
      - CONTRIBUTING.md

  content:
    min_heading_count: 2
    require_title: true
    require_non_empty_files: true

  links:
    check_relative_links: true
    fail_on_broken_links: false
EOF

cat > "${REPO_NAME}/.docslint/dictionary.txt" <<'EOF'
DocsLint
MkDocs
CI/CD
API
ADR
GitHub
PostgreSQL
OpenAPI
OAuth
Sphinx
EOF

cat > "${REPO_NAME}/docs/index.md" <<'EOF'
# Документация проекта

Данный раздел содержит полный комплект документации по проекту, включая общие сведения, архитектурное описание, описание API, руководство пользователя, инструкции по администрированию, материалы для разработчиков и тестовую документацию.

## Состав документации

- общие сведения о проекте
- архитектурное описание
- описание интерфейсов
- руководство пользователя
- инструкции по эксплуатации и администрированию
- материалы для разработки
- тестовая документация
- архитектурные решения
EOF

cat > "${REPO_NAME}/docs/overview/purpose.md" <<'EOF'
# Назначение системы

Система предназначена для хранения, сопровождения, публикации и автоматизированной проверки инженерной документации в составе Git-репозитория.

## Основные задачи

Система обеспечивает централизованное размещение документации, поддержание единых правил структуры, контроль полноты разделов и подготовку материалов к публикации и сопровождению.
EOF

cat > "${REPO_NAME}/docs/overview/scope.md" <<'EOF'
# Область применения

Документация применяется в проектах разработки программного обеспечения, где требуется единообразная структура документов, прозрачность изменений и возможность автоматизированной проверки качества.

## Ограничения

Настоящий шаблон не заменяет отраслевые регламенты и может дополняться корпоративными требованиями.
EOF

cat > "${REPO_NAME}/docs/overview/glossary.md" <<'EOF'
# Глоссарий

## Документация

Совокупность документов, описывающих назначение, устройство, эксплуатацию и сопровождение системы.

## ADR

Документ, фиксирующий принятое архитектурное решение и основания его выбора.

## CI/CD

Средства автоматизации сборки, проверки и поставки изменений.
EOF

cat > "${REPO_NAME}/docs/architecture/context.md" <<'EOF'
# Контекст системы

Документация сопровождает программный продукт и используется участниками разработки, тестирования, сопровождения и эксплуатации.

## Назначение раздела

Раздел определяет место документации в общем жизненном цикле проекта и фиксирует круг заинтересованных лиц.
EOF

cat > "${REPO_NAME}/docs/architecture/components.md" <<'EOF'
# Компоненты системы

Система состоит из репозитория исходного кода, каталога документации, конфигурации публикации, средств автоматизированной проверки и конвейера CI/CD.

## Основные компоненты

Репозиторий содержит исходные документы, структурированные по тематическим разделам. Конфигурация публикации определяет порядок построения навигации и отображения страниц. Средства проверки контролируют полноту структуры, корректность ссылок и наличие обязательных артефактов.
EOF

cat > "${REPO_NAME}/docs/architecture/data-model.md" <<'EOF'
# Модель данных

Документация представлена в виде набора текстовых файлов, конфигурационных файлов и сопутствующих артефактов.

## Состав

Каждый документ относится к определенному разделу, имеет устойчивый путь хранения и включается в общую навигацию публикации.
EOF

cat > "${REPO_NAME}/docs/architecture/integrations.md" <<'EOF'
# Интеграции

Документация интегрируется со средствами публикации, контроля версий и автоматизированной проверки качества.

## Основные направления

Интеграция включает Git-репозиторий, конвейер CI/CD и средство статической публикации документации.
EOF

cat > "${REPO_NAME}/docs/architecture/deployment.md" <<'EOF'
# Развертывание

Публикация документации выполняется на основе конфигурации сборки и подготовленного набора исходных файлов.

## Порядок

Сначала выполняется валидация структуры, затем сборка, после чего артефакты могут быть опубликованы в целевой среде.
EOF

cat > "${REPO_NAME}/docs/api/overview.md" <<'EOF'
# Обзор API

Раздел предназначен для описания программных интерфейсов системы.

## Назначение

В разделе фиксируются сведения о доступных методах, параметрах запросов и форматах ответов.
EOF

cat > "${REPO_NAME}/docs/api/auth.md" <<'EOF'
# Аутентификация

Для доступа к защищенным методам API используются механизмы аутентификации, определенные в проекте.

## Общие положения

Конкретный способ аутентификации должен быть описан в рабочей версии проекта.
EOF

cat > "${REPO_NAME}/docs/api/endpoints.md" <<'EOF'
# Методы API

В данном разделе приводится перечень методов API и их назначение.

## Общая структура

Для каждого метода должны быть указаны путь, параметры, формат ответа и возможные ошибки.
EOF

cat > "${REPO_NAME}/docs/api/examples.md" <<'EOF'
# Примеры API

В разделе приводятся примеры запросов и ответов для основных сценариев взаимодействия.

## Требования

Примеры должны соответствовать актуальной версии интерфейса.
EOF

cat > "${REPO_NAME}/docs/user-guide/getting-started.md" <<'EOF'
# Начало работы

Для начала работы с документацией необходимо открыть главную страницу проекта и перейти к интересующему разделу через навигационное меню.

## Порядок работы

1. Открыть главную страницу документации
2. Выбрать нужный раздел
3. Ознакомиться с содержимым страницы
4. Использовать перекрестные ссылки для перехода к связанным материалам
EOF

cat > "${REPO_NAME}/docs/user-guide/main-scenarios.md" <<'EOF'
# Основные сценарии

В разделе описываются типовые сценарии работы пользователей с системой.

## Назначение

Материал используется для быстрого освоения основных функций.
EOF

cat > "${REPO_NAME}/docs/user-guide/faq.md" <<'EOF'
# FAQ

Раздел содержит ответы на типовые вопросы пользователей.

## Назначение

FAQ используется для сокращения количества повторяющихся обращений.
EOF

cat > "${REPO_NAME}/docs/user-guide/troubleshooting.md" <<'EOF'
# Устранение проблем

Раздел содержит описание типовых ошибок и способов их устранения.

## Общий порядок

При возникновении проблемы необходимо определить раздел, в котором зафиксировано соответствующее поведение системы.
EOF

cat > "${REPO_NAME}/docs/admin/installation.md" <<'EOF'
# Установка

Развертывание документации выполняется путем получения содержимого репозитория и запуска средства публикации.

## Базовая последовательность

1. Клонировать репозиторий
2. Установить необходимые зависимости
3. Проверить корректность конфигурации
4. Выполнить локальную сборку документации
EOF

cat > "${REPO_NAME}/docs/admin/configuration.md" <<'EOF'
# Конфигурация

Раздел содержит сведения о настройке параметров публикации и проверки документации.

## Назначение

Изменения конфигурации должны выполняться контролируемым образом с фиксацией в системе контроля версий.
EOF

cat > "${REPO_NAME}/docs/admin/backup.md" <<'EOF'
# Резервное копирование

Резервному копированию подлежат исходные документы, конфигурационные файлы и сопутствующие артефакты.

## Общие положения

Порядок резервного копирования определяется регламентом эксплуатации проекта.
EOF

cat > "${REPO_NAME}/docs/admin/monitoring.md" <<'EOF'
# Мониторинг

Мониторинг должен обеспечивать контроль успешности сборки документации и корректности автоматизированных проверок.

## Контрольные показатели

Контролируются наличие ошибок сборки, предупреждений и отсутствие обязательных файлов.
EOF

cat > "${REPO_NAME}/docs/development/local-setup.md" <<'EOF'
# Локальный запуск

Для локальной работы с документацией разработчик должен подготовить среду сборки и получить актуальную версию репозитория.

## Порядок

После подготовки среды необходимо выполнить локальную проверку и просмотр документации.
EOF

cat > "${REPO_NAME}/docs/development/coding-rules.md" <<'EOF'
# Правила кодирования

В данном разделе фиксируются правила внесения изменений в исходные файлы проекта и документацию.

## Общие требования

Изменения должны быть воспроизводимыми, понятными и согласованными с внутренними правилами команды.
EOF

cat > "${REPO_NAME}/docs/development/release-process.md" <<'EOF'
# Релизный процесс

Релизный процесс должен включать актуализацию документации, контроль обязательных изменений и фиксацию версии.

## Последовательность

Перед выпуском версии проверяется полнота документации и корректность навигации.
EOF

cat > "${REPO_NAME}/docs/development/ci-cd.md" <<'EOF'
# CI/CD

В конвейере CI/CD выполняется автоматизированная проверка структуры репозитория, сборка документации и контроль качества изменений.

## Проверки

- наличие обязательных файлов
- наличие обязательных каталогов
- отсутствие хаотично размещенных документов
- успешная сборка документации
- валидация ссылок и структуры
EOF

cat > "${REPO_NAME}/docs/qa/test-plan.md" <<'EOF'
# План тестирования

План тестирования определяет состав проверок, выполняемых для контроля качества документации.

## Состав проверок

В план включаются структурные, формальные и сборочные проверки.
EOF

cat > "${REPO_NAME}/docs/qa/test-cases.md" <<'EOF'
# Тест-кейсы

В данном разделе размещаются тест-кейсы для проверки структуры, полноты и корректности документации.

## Назначение

Тест-кейсы используются для систематической оценки качества изменений.
EOF

cat > "${REPO_NAME}/docs/qa/acceptance-criteria.md" <<'EOF'
# Критерии приемки

Приемка документации выполняется на основании полноты обязательных разделов и успешного прохождения проверок.

## Общие критерии

Документация должна собираться без критических ошибок и соответствовать установленной структуре.
EOF

cat > "${REPO_NAME}/docs/adr/0001-use-mkdocs.md" <<'EOF'
# ADR-0001: Использование MkDocs

## Статус

Принято

## Контекст

Требуется простой и предсказуемый инструмент публикации документации из Markdown-структуры в Git-репозитории.

## Решение

В качестве базового инструмента публикации принят MkDocs.

## Последствия

Структура документации ориентируется на каталог `docs/`, а навигация управляется через `mkdocs.yml`.
EOF

cat > "${REPO_NAME}/docs/adr/0002-api-versioning.md" <<'EOF'
# ADR-0002: Версионирование API

## Статус

Принято

## Контекст

Для исключения конфликтов при изменении интерфейсов требуется явное выделение версий API.

## Решение

Версия API фиксируется в маршрутах и документации.

## Последствия

При внесении несовместимых изменений создается новая версия раздела API и соответствующих примеров.
EOF

cat > "${REPO_NAME}/docs/templates/requirement-template.md" <<'EOF'
# Шаблон требования

## Идентификатор

## Наименование

## Описание

## Критерии проверки
EOF

cat > "${REPO_NAME}/docs/templates/architecture-template.md" <<'EOF'
# Шаблон архитектурного описания

## Назначение

## Состав компонентов

## Взаимодействие

## Ограничения
EOF

cat > "${REPO_NAME}/docs/templates/test-case-template.md" <<'EOF'
# Шаблон тест-кейса

## Идентификатор

## Предусловия

## Шаги

## Ожидаемый результат
EOF

cat > "${REPO_NAME}/.github/workflows/docs.yml" <<'EOF'
name: docs-check

on:
  push:
  pull_request:

jobs:
  docs:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Validate repo structure
        run: |
          test -f README.md
          test -f CHANGELOG.md
          test -f mkdocs.yml
          test -f docs/index.md
          test -d docs/architecture
          test -d docs/user-guide
          test -d docs/admin
          test -d .docslint

      - name: Print success
        run: echo "Repository structure is valid"
EOF

cat > "${REPO_NAME}/LICENSE" <<'EOF'
Placeholder license text.
EOF

cat > "${REPO_NAME}/.gitignore" <<'EOF'
site/
.venv/
__pycache__/
*.pyc
.DS_Store
EOF

touch "${REPO_NAME}/docs/evidence/screenshots/.gitkeep"
touch "${REPO_NAME}/docs/evidence/reports/.gitkeep"
touch "${REPO_NAME}/docs/evidence/audits/.gitkeep"
touch "${REPO_NAME}/docs/assets/images/.gitkeep"
touch "${REPO_NAME}/docs/assets/diagrams/.gitkeep"
touch "${REPO_NAME}/docs/assets/attachments/.gitkeep"

echo "Готово"
echo "Дальше:"
echo "cd ${REPO_NAME}"
echo "git init"
echo "git add ."
echo "git commit -m 'feat: initial documentation repository structure'"
