<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Auteur</title>
                <link rel="stylesheet" type="text/css" href="TP1.css"/>
            </head>
            <body>
                <div><h1>Auteurs</h1></div>
                <xsl:for-each select="/bibliotheque/auteurs/auteur">
                    <xsl:sort select="prix" order="ascending" />
                    <xsl:variable name="auteurID">
                        <xsl:value-of select="@ident"/>
                    </xsl:variable>
                    <div>
                            <xsl:attribute name="href">
                                <xsl:value-of select="commentaire"/>
                            </xsl:attribute>
                            <img>
                                <xsl:attribute name="src">
                                    <xsl:value-of select="photo"/>
                                </xsl:attribute>
                            </img>
                        <h2>
                            <xsl:value-of select="nom"/>
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="prenom"/>
                        </h2>
                        <p>
                            <xsl:if test="pays != ''">
                                Pays : 
                                <xsl:value-of select="pays"/><br/>
                            </xsl:if>
                            <xsl:value-of select="commentaire"/>
                        </p>
                        <br/>
                        <h3>Oeuvres :</h3>
                        <table>
                            <tr>
                                <th>Titre</th>
                                <th>Prix</th>
                                <th>Annee</th>
                                <th>Commentaire</th>
                                <th>Couverture</th>
                            </tr>
                            <xsl:for-each select="/bibliotheque/livres/livre">
                                <xsl:sort select="prix/valeur" data-type="number"/>
                                    <xsl:if test="contains(@auteurs,$auteurID)">
                                        <tr>
                                            <td>
                                                <xsl:value-of select="titre"/>
                                            </td>
                                            <td>
                                                <xsl:value-of select="prix/devise"/>
                                                <br/>
                                                <xsl:value-of select="prix/valeur"/>
                                            </td>
                                            <td>
                                                <xsl:value-of select="annee"/>
                                            </td>
                                                                                     
                                            <td>
                                                <xsl:value-of select="commentaire"/>
                                            </td>
                                            <td>
                                                <a>
                                                    <xsl:attribute name="href">
                                                        <xsl:value-of select="commentaire/@href"/>
                                                    </xsl:attribute>
                                                    <img>
                                                        <xsl:attribute name="src">
                                                            <xsl:value-of select="couverture"/>
                                                        </xsl:attribute>
                                                    </img>
                                                </a>
                                            </td>
                                        </tr>
                                    </xsl:if>
                            </xsl:for-each>
                        </table>
                    </div>
                    <br/>
                    <hr/>
                    <br/>
                </xsl:for-each>
                <footer></footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>