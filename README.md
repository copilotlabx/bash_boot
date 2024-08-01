***Uso del Script bash_boot.sh***

   - Enumeración de Subdominios: assetfinder, subfinder, y amass se utilizan para obtener una lista completa de subdominios de un dominio especificado.
   - Consulta de Certificados: curl y jq se usan para consultar crt.sh y obtener más subdominios.
   - Combinar Resultados: anew se utiliza para combinar y eliminar duplicados de todas las listas de subdominios obtenidas.
   - Resolución DNS: dnsx resuelve los subdominios a direcciones IP.
   - Agregación CIDR: mapcidr agrupa las direcciones IP en rangos CIDR.
   - Escaneo de Puertos: naabu escanea los puertos abiertos en las IPs/rangos CIDR encontrados y httpx verifica los servicios HTTP/HTTPS en esas IPs.
***lista detallada de las herramientas utilizadas en el script ***


    - assetfinder:
         Descripción: Una herramienta que encuentra subdominios para un dominio dado.
         Uso en el script: Se usa para enumerar subdominios pasivos del dominio especificado.

    - subfinder:
         Descripción: Una herramienta rápida para descubrir subdominios utilizando múltiples fuentes.
         Uso en el script: Se usa para enumerar subdominios utilizando diversas fuentes y técnicas.

    - amass:
        Descripción: Una herramienta avanzada de enumeración de subdominios que utiliza tanto fuentes pasivas como activas.
        Uso en el script: Se usa para realizar una enumeración pasiva de subdominios.

    - curl:
         Descripción: Una herramienta de línea de comandos para transferir datos con sintaxis de URL.
         Uso en el script: Se usa para hacer solicitudes a crt.sh y obtener datos en formato JSON sobre subdominios.

    - jq:
         Descripción: Un procesador de JSON de línea de comandos.
         Uso en el script: Se usa para analizar y extraer datos específicos del JSON obtenido de crt.sh.

    - anew:
         Descripción: Una herramienta para gestionar listas de manera eficiente, asegurando que solo se agreguen nuevas entradas únicas.
         Uso en el script: Se usa para combinar resultados de varias herramientas y asegurarse de que no haya duplicados en las listas de subdominios.

    - dnsx:
         Descripción: Una herramienta de resolución DNS rápida y confiable.
         Uso en el script: Se usa para resolver los subdominios encontrados y obtener sus direcciones IP.

    - mapcidr:
         Descripción: Una herramienta que toma una lista de direcciones IP y las agrupa en rangos CIDR.
         Uso en el script: Se usa para agrupar las direcciones IP resueltas en rangos CIDR.

    - naabu:
         Descripción: Una herramienta rápida de escaneo de puertos basada en Go.
         Uso en el script: Se usa para escanear los puertos abiertos en las direcciones IP/rangos CIDR encontrados.

    - httpx:
         Descripción: Una herramienta rápida y multi-threaded para realizar solicitudes HTTP.
         Uso en el script: Se usa junto con naabu para verificar los servicios HTTP/HTTPS en las IPs escaneadas.

     

