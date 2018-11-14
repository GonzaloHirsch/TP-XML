<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/error">
        <html>

        <head>
            <link rel="stylesheet" type="text/css" href="./Resources/Stylesheet.css" />
        </head>

        <body>
            <div id="navbar">
                <div> </div>
                <img src="Resources/stackoverflow_logo.png" />
            </div>
            <div class="error">
                <img src="Resources/404.svg" />
                <div>
                    <h2>ID Not Found</h2>
                    <p><xsl:value-of select="." /></p>
                    <p>Please verify the inserted ID.</p>
                </div>
            </div>
        </body>

        </html>
    </xsl:template>

    <xsl:template match="/user">
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

            <xsl:call-template name="person" />

            <xsl:call-template name="badges" />

            <xsl:call-template name="posts" />

            <xsl:call-template name="comments" />

        </body>

        </html>
    </xsl:template>

    <xsl:template name="person">
        <div class="person">
            <h1>
                <xsl:value-of select="name" />
            </h1>
            <h3>
                <xsl:value-of select="description" disable-output-escaping="yes" />
            </h3>
            <table>
                <tr>
                    <th>Views</th>
                    <th>Up Votes</th>
                    <th>Down Votes</th>
                    <th>Reputation</th>
                </tr>
                <tr>
                    <td>
                        <xsl:value-of select="views" />
                    </td>
                    <td>
                        <xsl:value-of select="upvotes" />
                    </td>
                    <td>
                        <xsl:value-of select="downvotes" />
                    </td>
                    <td>
                        <xsl:value-of select="reputation" />
                    </td>
                </tr>
            </table>
        </div>
    </xsl:template>

    <xsl:template name="badges">
        <div class="badges">
            <h4>Badges</h4>
            <ul class="badge-list">
                <xsl:for-each select="badges/badge[not(name=preceding-sibling::badge/name)]">
                    <li>
                        <img name="badge-img" />
                        <p>
                            <xsl:value-of select="name" />
                        </p>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <xsl:template name="posts">
        <div class="text_table">
            <h4>Posts</h4>
            <table>
                <tr>
                    <th>Text</th>
                    <th>Created</th>
                    <th>View Count</th>
                    <th>Comment Count</th>
                    <th>Answer Count</th>
                    <th>Favourite Count</th>
                    <th>Score</th>
                </tr>
                <xsl:for-each select="posts/post">
                    <tr>
                        <td>
                            <xsl:value-of select="text" disable-output-escaping="yes" />
                        </td>
                        <td>
                            <xsl:value-of select="created" />
                        </td>
                        <td>
                            <xsl:value-of select="view_count" />
                        </td>
                        <td>
                            <xsl:value-of select="comment_count" />
                        </td>
                        <td>
                            <xsl:value-of select="answer_count" />
                        </td>
                        <td>
                            <xsl:value-of select="favourite_count" />
                        </td>
                        <td>
                            <xsl:value-of select="score" />
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </div>
    </xsl:template>

    <xsl:template name="comments">
        <div class="text_table">
            <h4>Comments</h4>
            <table>
                <tr>
                    <th>Text</th>
                    <th>Created</th>
                    <th>Score</th>
                </tr>
                <xsl:for-each select="comments/comment">
                    <tr>
                        <td>
                            <xsl:value-of select="text" disable-output-escaping="yes" />
                        </td>
                        <td>
                            <xsl:value-of select="created" />
                        </td>
                        <td>
                            <xsl:value-of select="score" />
                        </td>
                    </tr>
                </xsl:for-each>
            </table>
        </div>
    </xsl:template>

</xsl:stylesheet>
