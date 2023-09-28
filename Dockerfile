# Establecer la imagen base
FROM node:18.18

# Crear y establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Setear la variable de entorno NOMBRE
ENV NOMBRE 'Víctor'

# Copiar los archivos de la aplicación al directorio de trabajo
COPY package.json /app/
COPY package-lock.json /app/

# Instalar las dependencias de la aplicación
RUN npm install

# Copiar el resto de los archivos de la aplicación al directorio de trabajo
COPY . /app/

# Compilar la aplicación Next.js para producción
RUN npm run build

# Exponer un puerto en el que la aplicación escuchará las solicitudes
EXPOSE 3000

# Definir el comando que se ejecutará cuando el contenedor se inicie
CMD ["npm", "start"]
