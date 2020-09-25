<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:key name="auteurID" match="auteurs/auteur" use="@ident" />    
    <xsl:template match="/">
        
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>Livres</title>
                <link rel="stylesheet" type="text/css" href="TP1.css"/>
            </head>
            <body>
                <div>
                    <h1>Livres</h1>
                </div>
                <div>
                    <table>
                        <tr>
                            <th>Titre</th>
                            <th>Auteurs</th>
                            <th>Prix</th>
                            <th>Annee</th>
                            <th>Langue</th>
                            <th>Commentaire</th>
                            <th>Couverture</th>
                        </tr>
                        <xsl:for-each select="/bibliotheque/livres/livre">
                            <xsl:sort select="key('auteurID', substring-before(@auteur,' '))/nom"/>
                            <xsl:if test="(prix &gt; 0) and (prix &lt;15)">
                                <xsl:variable name="auteurs" select="@auteurs"></xsl:variable>
                            <tr>
                                <td>
                                    <xsl:value-of select="titre"/>
                                </td>
                                <td>
                                    <xsl:for-each select="/bibliotheque/auteurs/auteur">
                                        
                                        <xsl:if test="(contains($auteurs,@ident))">
                                            <xsl:value-of select="nom"/>
                                            
                                            <xsl:value-of select="prenom"/>
                                           
                                        </xsl:if>
                                        
                                    </xsl:for-each>
                                </td>
                                <td>
                                    <xsl:value-of select="prix"/>
                                    <xsl:value-of select="prix/devise"/>
                                </td>
                                <td>
                                    <xsl:value-of select="annee"/>
                                </td>
                                <td>
                                    <xsl:value-of select="@langue"/>
                                </td>
                                <td>
                                    <xsl:value-of select="commentaire"/>
                                </td>
                                <td>
                                    <img alt="image">
                                        <xsl:attribute name="src">
                                            <xsl:value-of select="couverture"/>
                                        </xsl:attribute>
                                    </img>
                                </td>
                            </tr>
                            </xsl:if>
                        </xsl:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>