<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>

        <head>
            <link rel="stylesheet" type="text/css" href="./Resources/Stylesheet.css" />
            <script src="./Resources/Randomize.js" type="text/javascript"></script>
        </head>

        <body>
            <div id="navbar">
                <div> </div>
                <img src="Resources/stackoverflow_logo.png" />
            </div>
            
            <xsl:apply-templates/>
        </body>

        </html>
    </xsl:template>
    
    <xsl:template name="person">
        <div class="person">
            <h1><xsl:value-of select="name" /></h1>
            <h3><xsl:value-of select="description" /></h3>
            <table>
                <tr>
                    <th>Views</th>
                    <th>Up Votes</th>
                    <th>Down Votes</th>
                    <th>Reputation</th>
                </tr>
                <tr>
                    <td><xsl:value-of select="user/views" /></td>
                    <td><xsl:value-of select="user/upvotes" /></td>
                    <td><xsl:value-of select="user/downvotes" /></td>
                    <td><xsl:value-of select="user/reputation" /></td>
                </tr>
            </table>
        </div>
    </xsl:template>
    
    <xsl:template match="badges">
        <div class="badges">
            <h4>Badges</h4>
            <ul class="badge-list">
                <xsl:for-each select="badge">
                    <li>
                        <img name="badge-img" />
                        <p><xsl:value-of select="name" /></p>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

</xsl:stylesheet>
