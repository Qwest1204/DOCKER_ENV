# ML/DL Docker Template

![Docker](https://img.shields.io/badge/Docker-Ready-blue) ![Python](https://img.shields.io/badge/Python-3.10-green) ![ML/DL](https://img.shields.io/badge/Libs-PyTorch%20%7C%20TensorFlow-orange)

Это шаблон репозитория для проектов машинного обучения и глубокого обучения. Включает два Docker-образа (CPU и GPU), структуру папок и примеры.

## Структура репозитория
- **model/**: Скрипты моделей (train.py, predict.py и т.д.).
- **weights/**: Сохранённые веса моделей (.h5, .pth).
- **datasets/**: Данные для обучения (CSV, изображения).
- **utils/**: Вспомогательные утилиты (preprocessing, visualization).

## Docker-образы
Репозиторий содержит два Dockerfile:
- **Dockerfile.cpu**: Для CPU-вычислений.
- **Dockerfile.gpu**: Для GPU-вычислений (требуется NVIDIA CUDA и NVIDIA Docker).

### Требования для GPU
- Установленный [NVIDIA Docker](https://github.com/NVIDIA/nvidia-docker).
- Совместимая версия CUDA (12.1) и драйверы NVIDIA.

### Как собрать и запустить
1. Склонируй репозиторий:
   ```
   git clone https://github.com/твой-username/ml-docker-template.git
   cd ml-docker-template
   ```

2. **Для CPU**:
   Собери образ:
   ```
   docker build -f Dockerfile.cpu -t ml-docker-template:cpu .
   ```
   Запусти контейнер:
   ```
   docker run -p 8888:8888 -v $(pwd):/app ml-docker-template:cpu
   ```

3. **Для GPU**:
   Собери образ:
   ```
   docker build -f Dockerfile.gpu -t ml-docker-template:gpu .
   ```
   Запусти контейнер с NVIDIA runtime:
   ```
   docker run --gpus all -p 8888:8888 -v $(pwd):/app ml-docker-template:gpu
   ```

   - `-v` монтирует локальную директорию для сохранения изменений.
   - Зайди в Jupyter: http://localhost:8888 (токен в логах).


## CI/CD
Репозиторий настроен для автосборки Docker-образа через GitHub Actions (см. `.github/workflows/docker.yml`). Для GPU-образа настройка CI/CD может потребовать дополнительных шагов.

## Контрибьют
Форкни и присылай PR!