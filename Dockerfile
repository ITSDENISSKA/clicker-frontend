# Используем официальный образ Node в качестве базового образа
FROM node:16-alpine

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем package.json и package-lock.json внутрь контейнера
COPY package.json package-lock.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем все файлы проекта внутрь контейнера
COPY . .

# Собираем проект
RUN npm run build

# Команда для запуска сервера Vite внутри контейнера
CMD ["npm", "run", "dev"]