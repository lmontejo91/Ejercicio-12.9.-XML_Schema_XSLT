<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <body style="background-color:lightgray">
    <!-- TABLA CON TODOS LOS DATOS DE LIBROS (Ordenados por año de publicación) -->
    <table border="1">
        <tr bgcolor="#9acd32">
          <th>ISBN</th>
          <th>Título</th>
          <th>Autor</th>
          <th>Año de Publicación</th>
          <th>Precio</th>
          <th>Estantería</th>
        </tr>
            <xsl:sort select="anio_publicacion"/>
            <tr>
                <td><xsl:value-of select="isbn"/></td>
                <td><xsl:value-of select="titulo"/></td>
                <td><xsl:value-of select="autor"/></td>
                <td><xsl:value-of select="anio_publicacion"/></td>
                <td><xsl:value-of select="precio"/></td>
                <td><xsl:value-of select="estanteria"/></td>
            </tr>
    </table>

    <!-- TABLA CON TODOS LOS LIBROS EN INGLÉS (Ordenados por año de publicación) -->
    <table border="1">
        <tr bgcolor="#9acd32">
          <th>ISBN</th>
          <th>Título</th>
          <th>Autor</th>
          <th>Año de Publicación</th>
        </tr>
            <xsl:sort select="anio_publicacion"/>
            <xsl:if match="libro[@lang='en']">
            <tr>
                <td><xsl:value-of select="isbn"/></td>
                <td><xsl:value-of select="titulo"/></td>
                <td><xsl:value-of select="autor"/></td>
                <td><xsl:value-of select="anio_publicacion"/></td>
            </tr>
            </xsl:if>
    </table>

     <!-- LISTA DE SOCIOS -->
    <ul>
            <li>
                <xsl:choose>
                    <xsl:when test="biblioteca/socio/suscripcion/afiliadoVIP">
                        <xsl:value-of select="nombre, apellido1, apellido2"/>
                        <ul style="background-color:SkyBlue">
                            <li><xsl:value-of select="id_socio"/></li>
                            <li><xsl:value-of select="edad"/></li>
                            <li><xsl:value-of select="telefono"/></li>
                            <li><xsl:value-of select="email"/></li>
                        </ul>
                    </xsl:when>

                    <xsl:when test="biblioteca/socio/suscripcion/empleado">
                        <xsl:value-of select="nombre, apellido1, apellido2"/>
                        <ul style="background-color:LightPink">
                            <li><xsl:value-of select="id_socio"/></li>
                            <li><xsl:value-of select="edad"/></li>
                            <li><xsl:value-of select="telefono"/></li>
                            <li><xsl:value-of select="email"/></li>
                        </ul>
                    </xsl:when>

                    <xsl:otherwise>
                        <xsl:value-of select="nombre, apellido1, apellido2"/>
                        <ul>
                            <li><xsl:value-of select="id_socio"/></li>
                            <li><xsl:value-of select="edad"/></li>
                            <li><xsl:value-of select="telefono"/></li>
                            <li><xsl:value-of select="email"/></li>
                        </ul>
                    </xsl:otherwise>
                </xsl:choose>
                
            </li>
    </ul>

  </body>
  </html>
</xsl:template>

</xsl:stylesheet>