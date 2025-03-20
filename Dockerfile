# Use a imagem base do Node.js
FROM node:22

# Defina o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie os arquivos package.json e package-lock.json para o contêiner
COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Copie o restante dos arquivos do projeto
COPY . .

# Exponha a porta que o Vite usa por padrão
EXPOSE 5175

# Instale o pm2 globalmente
RUN npm install -g pm2

# Comando para iniciar o servidor de desenvolvimento usando pm2-runtime
CMD ["pm2-runtime", "npm", "--name", "app", "--", "run", "dev", "--", "--host"]