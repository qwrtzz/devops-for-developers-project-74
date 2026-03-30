FROM node:20.12.2

WORKDIR /app

CMD ["make", "test"]
# Копируем package.json из папки app
COPY app/package*.json ./

# Устанавливаем только production-зависимости (для тестов)
RUN npm ci --only=production

# Копируем остальной код из app
COPY app/ ./