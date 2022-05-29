<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
    <html>
    <head>
        <meta charset="UTF-8"/>
        <title>LM_UD12_Ex12.9</title>
        <link rel="stylesheet" type="text/css" href="styleCSS_Biblioteca.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <!-- TABLA CON TODOS LOS DATOS DE LIBROS (Ordenados por ubicación en estantería) -->
        <h2>~ Libros ~</h2>
        <table>
            <tr>
                <th>ISBN</th>
                <th>Título</th>
                <th>Autor</th>
                <th>Año de Publicación</th>
                <th>Precio</th>
                <th>Estantería</th>
            </tr>
            <xsl:for-each select="biblioteca/libro">
                <xsl:sort select="estanteria"/>
                <tr>
                    <td><xsl:value-of select="isbn"/></td>
                    <td><xsl:value-of select="titulo"/></td>
                    <td><xsl:value-of select="autor"/></td>
                    <td><xsl:value-of select="anio_publicacion"/></td>
                    <td><xsl:value-of select="precio"/></td>
                    <td><xsl:value-of select="estanteria"/></td>
                </tr>
            </xsl:for-each>
        </table>

        <!-- TABLA CON TODOS LOS LIBROS EN INGLÉS (Ordenados por año de publicación) -->
        <h2>~ Literatura de lengua inglesa ~</h2>
        <table>
            <tr>
                <th>ISBN</th>
                <th>Título</th>
                <th>Autor</th>
                <th>Año de Publicación</th>
            </tr>
            <xsl:for-each select="biblioteca/libro">
                <xsl:sort select="anio_publicacion"/>
                <xsl:if test="@lang='en'">
                <tr>
                    <td><xsl:value-of select="isbn"/></td>
                    <td><xsl:value-of select="titulo"/></td>
                    <td><xsl:value-of select="autor"/></td>
                    <td><xsl:value-of select="anio_publicacion"/></td>
                </tr>
                </xsl:if>
            </xsl:for-each>
        </table>

        <!-- LISTA DE SOCIOS (Vistos por colores en base al tipo de usuario)-->
        <!-- Por cada socio (dentro de un <li>) se utiliza una estructura <xsl:choose>
        que evalúa si en ese socio existe una etiqueta en concreto dentro de su
        etiqueta padre <suscripcion>. Dependiendo de la etiqueta que exista (true) 
        se entrará en un bucle "when" u otro, lo que determinará el color de fondo
        del <ul> con la información del socio -->
        <h2>~ Socios de la Biblioteca ~</h2>
        <ol>
            <xsl:for-each select="biblioteca/socio">
                <li>
                    <xsl:choose>
                        <xsl:when test="suscripcion/afiliadoVIP">
                            <xsl:value-of select="nombre"/>
                            <xsl:text> </xsl:text> <!-- Utilizo esta etiqueta para introducir espacios entre los selects que hago -->
                            <xsl:value-of select="apellido1"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="apellido2"/>
                            <ul id="afiliadoVIP">
                                <li>
                                    <xsl:text>Id_Socio: </xsl:text>
                                    <xsl:value-of select="id_socio"/>
                                </li>
                                <li>
                                    <xsl:text>Edad: </xsl:text>
                                    <xsl:value-of select="edad"/>
                                </li>
                                <li>
                                    <xsl:text>Teléfono: </xsl:text>
                                    <xsl:value-of select="telefono"/>
                                </li>
                                <li>
                                    <xsl:text>Email: </xsl:text>
                                    <xsl:value-of select="email"/>
                                </li>
                            </ul>
                        </xsl:when>

                        <xsl:when test="suscripcion/empleado">
                            <xsl:value-of select="nombre"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="apellido1"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="apellido2"/>
                            <ul id="empleado">
                                <li>
                                    <xsl:text>Id_Socio: </xsl:text>
                                    <xsl:value-of select="id_socio"/>
                                </li>
                                <li>
                                    <xsl:text>Edad: </xsl:text>
                                    <xsl:value-of select="edad"/>
                                </li>
                                <li>
                                    <xsl:text>Teléfono: </xsl:text>
                                    <xsl:value-of select="telefono"/>
                                </li>
                                <li>
                                    <xsl:text>Email: </xsl:text>
                                    <xsl:value-of select="email"/>
                                </li>
                            </ul>
                        </xsl:when>

                        <xsl:otherwise>
                            <xsl:value-of select="nombre"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="apellido1"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="apellido2"/>
                            <ul id="afiliado">
                                <li>
                                    <xsl:text>Id_Socio: </xsl:text>
                                    <xsl:value-of select="id_socio"/>
                                </li>
                                <li>
                                    <xsl:text>Edad: </xsl:text>
                                    <xsl:value-of select="edad"/>
                                </li>
                                <li>
                                    <xsl:text>Teléfono: </xsl:text>
                                    <xsl:value-of select="telefono"/>
                                </li>
                                <li>
                                    <xsl:text>Email: </xsl:text>
                                    <xsl:value-of select="email"/>
                                </li>
                            </ul>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                </li>
            </xsl:for-each>
        </ol>
    </body>
    </html>
</xsl:template>

</xsl:stylesheet>