FROM ubuntu:22.04
LABEL authors="daniilogorodnikov"
# Установим зависимости системы
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git \
    && rm -rf /var/lib/apt/lists/*

# Создадим виртуальное окружение
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Установим ключевые библиотеки для ML/DL
RUN pip install --upgrade pip && \
    pip install \
    torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu \
    tensorflow \
    scikit-learn \
    pandas \
    numpy \
    matplotlib \
    seaborn \
    jupyter \
    opencv-python \
    transformers \
    && pip cache purge

# Установим рабочую директорию
WORKDIR /app

# Копируем содержимое репозитория в контейнер (опционально, для запуска)
COPY . /app

# Команда по умолчанию: запуск Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--no-browser"]