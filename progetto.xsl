<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=0.8"/>
                <title>Progetto Codifica di Testi Tambellini Stefano</title>
                <link rel="shortcut icon" type="image/png" href="icon.png"/>
                <link rel="icon" type="image/png" href="icon.png"/>

                <link rel="stylesheet" href="node_modules/normalize.css/normalize.css"/>
                <link rel="stylesheet" href="node_modules/skeleton-css/css/skeleton.css"/>
                <link rel="stylesheet" href="node_modules/hover.css/css/hover-min.css"/>
                <link rel="stylesheet" href="node_modules/alertifyjs/build/css/alertify.min.css"/>
                <link rel="stylesheet"
                    href="node_modules/alertifyjs/build/css/themes/bootstrap.min.css"/>
                <link rel="stylesheet" type="text/css"
                    href="node_modules/fullpage.js/dist/jquery.fullpage.min.css"/>

                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <img id="loader" fill="#030303" width="140" height="64" viewBox="0 0 140 64"
                    src="tail-spin.svg"/>
                <div id="fullpage">
                    <xsl:apply-templates/>
                </div>
                <script type="text/javascript" src="node_modules/alertifyjs/build/alertify.min.js"/>
                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"/>
                <script type="text/javascript" src="node_modules/fullpage.js/vendors/scrolloverflow.min.js"/>
                <script type="text/javascript" src="node_modules/fullpage.js/dist/jquery.fullpage.min.mod.js"/>
                <script type="text/javascript" src="script.js"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="teiHeader">
        <div class="home section">
            <button id="infoButton" class="hvr-back-pulse">?</button>
            <div id="infoBox">
                <h4>Per navigare usare la rotellina e le frecce da computer, oppure lo swipe da
                    mobile.</h4>
                <hr/>
                <div class="inline">
                    <xsl:value-of select="//encodingDesc/projectDesc/p"/>
                    <br/>
                    <i>Edizione n. <xsl:value-of select="//edition/@n"/>, <xsl:value-of
                            select="//edition"/>
                        <br/> Collana <xsl:value-of select="//seriesStmt/title"/> - <xsl:value-of
                            select="//seriesStmt/biblScope"/>
                        <br/>
                        <em> ISBN: <xsl:value-of select="//publicationStmt/idno"/>
                        </em>
                    </i>
                    <br/>
                    <small>
                        <i>
                            <xsl:value-of select="//availability/licence"/>
                        </i>
                    </small>
                </div>
                <xsl:apply-templates select="//revisionDesc"/>
            </div>
            <h1>
                <strong>
                    <xsl:value-of select="//titleStmt/title"/>
                </strong>
            </h1>
            <h3>
                <xsl:value-of select="//titleStmt/author"/>
            </h3>
            <h6>
                <xsl:value-of select="//editionStmt/respStmt/resp"/>: <xsl:value-of
                    select="//editionStmt/respStmt/name"/>
            </h6>
            <h5> Pubblicato da <xsl:value-of select="//publicationStmt/publisher"/>
                <br/>
                <xsl:value-of select="//publicationStmt/pubPlace"/>, <xsl:value-of
                    select="//publicationStmt/date"/>
            </h5>
            <hr/>
            <h3>
                <xsl:value-of select="fileDesc/titleStmt/respStmt/resp"/>: <xsl:value-of
                    select="fileDesc/titleStmt/respStmt/name"/>
            </h3>
        </div>
    </xsl:template>

    <xsl:template match="//revisionDesc">
        <div class="inline">
            <table>
                <xsl:apply-templates/>
            </table>
        </div>
    </xsl:template>

    <xsl:template match="//revisionDesc/list/item">
        <tr>
            <td>
                <xsl:value-of select="date"/>
            </td>
            <td>
                <xsl:value-of select="p"/>
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="text">
        <div class="pages section">
            <div id="evidenziatore">
                <label>
                    <input type="radio" name="radioEvidenz" value="bianco">Bianco</input>
                </label>
                <label>
                    <input type="radio" name="radioEvidenz" value="nero">Nero</input>
                </label>
                <button id="clearEvidenz">Pulisci</button>
            </div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="body/div">
        <div class="slide">
            <xsl:value-of select="./@n"/>
            <hr/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="div/stage">
        <div class="stage">
            <small>
                <i>
                    <xsl:apply-templates/>
                </i>
            </small>
        </div>
    </xsl:template>

    <xsl:template match="spGrp">
        <table>
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xsl:template match="sp">
        <tr>
            <xsl:apply-templates/>
        </tr>
    </xsl:template>

    <xsl:template match="sp[not(@n='2')]/speaker">
        <td class="speaker">
            <xsl:apply-templates/>
            <i>
                <xsl:value-of select="../stage"/>
            </i>
        </td>
    </xsl:template>

    <xsl:template match="sp[@n='2']/speaker">
        <td class="speaker"/>
    </xsl:template>

    <xsl:template match="sp/stage"/>

    <xsl:template match="sp[not(@n='1') and not(@n='2')]/p">
        <td>
            <xsl:apply-templates/>
        </td>
    </xsl:template>

    <xsl:template match="sp[@n='1']/p">
        <td>
            <xsl:apply-templates/>
            <xsl:text>-</xsl:text>
        </td>
    </xsl:template>

    <xsl:template match="sp[@n='2']/p">
        <td>
            <xsl:text>-</xsl:text>
            <xsl:apply-templates/>
        </td>
    </xsl:template>

    <xsl:template match="choice">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="sic"/>

    <xsl:template match="corr">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="p/stage">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>

    <xsl:template match="sp/p/quote">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="emph">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>

    <xsl:template match="//text//name">
        <xsl:choose>
            <xsl:when test="@type='book'">
                <i>
                    <xsl:apply-templates/>
                </i>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="soCalled">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>
