<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="html" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>

	<xsl:template match="/">
		<html lang="it">
			<head>
				<link type="text/css" rel="stylesheet" href="style.css"/>
				<script type="text/javascript" src="script.js" />
				<title>Codifica LL1.26</title>
			</head>

			<body>
				<a name="inizio"></a>
				<!--intestazione con logo e titoli-->
				<header>
					<div id="intestazione">
						<img src="logo.jpg" id="logo" alt="logoBellini"/>
						<div id="titolo1" class="titoli">
							<xsl:call-template name="titolo1"/>
						</div>
						<div id="titolo2" class="titoli">
							<xsl:call-template name="titolo2"/>
						</div>
					</div>
				</header>
   
				<!--menù di navigazione-->
				<div id="navbar">
					<a href="#box_descrizione">
						<div class="textblock"><p><xsl:text>Descrizione</xsl:text></p></div>
					</a>
					
					<a href="#box_legenda">
						<div class="textblock"><p><xsl:text>Legenda</xsl:text></p></div>
					</a>
					
					<a href="#box_lettera">
						<div class="textblock"><p><xsl:text>Lettera</xsl:text></p></div>
					</a>
					
					<a href="#crediti">
						<div class="textblock"><p><xsl:text>Crediti</xsl:text></p></div>
					</a>
				</div>

				<!--inizio contenuto pagina -->
				<div id="main">

					<!--box informazioni sulla risorsa originale -->
					<div id="box_descrizione" class="box">
						<label>
							<xsl:text>Descrizione della risorsa originale</xsl:text>
						</label>
						<xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:additional/tei:adminInfo"/>
						<xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msContents/tei:msItem/tei:textLang"/>
						<xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:altIdentifier"/>
						<xsl:apply-templates select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:physDesc"/>
					</div>
					
					<!--box legenda e informazioni generali-->
					<div id="box_legenda" class="box">
						<label>
							<xsl:text>Legenda</xsl:text>
						</label>
						<p>Le espressioni tra parentesi e in <font color="#FF0000">(rosso)</font> sono informazioni aggiunte in fase di codifica e si riferiscono a persone.</p>
						<p>Le espressioni evidenziate in <mark class="luoghi">verde</mark> si riferiscono a luoghi. (Passa il cursore sopra per leggere più informazioni)</p>
						<p>Le espressioni evidenziate in <mark class="termini">azzurro</mark> si riferiscono a termini musicali. (Passa il cursore sopra per leggere più informazioni)</p>
						<p>Le espressioni evidenziate in <mark class="work">rosa</mark> si riferiscono a opere. (Passa il cursore sopra per leggere più informazioni)</p>
						<p>Le espressioni evidenziate in <mark class="org">arancione</mark> si riferiscono a teatri ed enti. (Passa il cursore sopra per leggere più informazioni)</p>
						<p>[...] indica parte di testo mancante a causa di lacerazioni del supporto materiale.</p>
						<p>Abbreviazioni presenti nel testo sono state riportate fedelmente alla risorsa originale; possono tuttavia essere sciolte singolarmente cliccandoci sopra.</p>
						<p>Espressioni arcaiche o ritenute non standard sono riportate in <i>italico</i>.</p>
					</div>
					
					<!--box contenente immagini della risorsa originale e trascrizione-->
					<div id="box_lettera" class="box">
						<div class="galleria">

							<div class="radio_button">
								<label class="buttons">Fronte
									<input type="radio" checked="checked" name="radio_uno" value="fronte" onclick="showFronte()" />
								</label>
								<label class="buttons"> Retro
									<input type="radio" name="radio_uno" value="retro" onclick="showRetro()" />
								</label>
							</div>

							<div class="immagine">
								<xsl:apply-templates select="//tei:facsimile"/>
							</div>
                    
						</div>

						<div id="trascrizione">
							<label>
								<xsl:text>Corpo della lettera</xsl:text>
							</label>
							<xsl:apply-templates select="//tei:body/tei:div[@type='fronte-retro']" />
						</div>
					</div>

					<!--box note e bibliografia-->
					<div id="box_appendici" class="box">

						<div id="note">
							<label>
								<xsl:text>Note</xsl:text>
							</label>
							<ol>
								<xsl:apply-templates select="//tei:div[@type='ann_notes']/tei:note" />
							</ol>
						</div>
						
						<div id="bibliografia">
							<label>
								<xsl:text>Bibliografia della lettera</xsl:text>
							</label>
							<ul>
								<xsl:apply-templates select="//tei:div[@type='bibliography']/tei:listBibl/tei:bibl" />
							</ul>
						</div>

					</div>

					<!--box crediti-->
					<div id="crediti">
						<p>
							<xsl:value-of select="//tei:msIdentifier/tei:idno"/> -
							<xsl:apply-templates select = "//tei:editionStmt/tei:edition"/><br/>
							<xsl:apply-templates select = "//tei:titleStmt/tei:respStmt[1]"/> -
							<xsl:apply-templates select = "//tei:titleStmt/tei:respStmt[2]"/><br/>
							<xsl:apply-templates select="//tei:editionStmt/tei:respStmt[2]"/>,
							<xsl:value-of select="//tei:publicationStmt/tei:publisher"/>
						</p>
					</div>

					<!--pulsante per ritornare in alto-->
					<a href="#inizio">
						<div id="scrollToTop">
							<img src="scrolltop.png" alt="Scroll to top" width="60" />
						</div>
					</a>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="//tei:graphic[@url = 'LL1.26_0001.jpg']">
		<xsl:element name="div">
			<xsl:attribute name="id">
				<xsl:text>i1</xsl:text>
			</xsl:attribute>
			<xsl:element name="img">
				<xsl:attribute name="src">
					<xsl:value-of select="//tei:facsimile/tei:surface[@n='1']/tei:graphic/@url"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:for-each select="//tei:surface[@n='1']/tei:zone[@rendition='Line']">
				<xsl:element name="a">
					<xsl:attribute name="class">
						<xsl:text>ImgTxt</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="@xml:id"/>
					</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:value-of select="@start"/>
					</xsl:attribute>
					<xsl:element name="div">
						<xsl:attribute name="class">area</xsl:attribute>
						<xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
						<xsl:attribute name="style"> left:<xsl:value-of select="(@ulx)"/>; top:<xsl:value-of select="(@uly)"/>; height:<xsl:value-of select="((@lry)-(@uly))"/>;  width:<xsl:value-of select="((@lrx)-(@ulx))"/> </xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>

	<xsl:template match="//tei:graphic[@url = 'LL1.26_0002.jpg']">
		<xsl:element name="div">
			<xsl:attribute name="id">
				<xsl:text>i2</xsl:text>
			</xsl:attribute>
			<xsl:element name="img">
				<xsl:attribute name="src">
					<xsl:value-of select="//tei:facsimile/tei:surface[@n='2']/tei:graphic/@url"/>
				</xsl:attribute>
			</xsl:element>
			<xsl:for-each select="//tei:surface[@n='2']/tei:zone[@rendition='Line']">
				<xsl:element name="a">
					<xsl:attribute name="class">
						<xsl:text>ImgTxt</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="name">
						<xsl:value-of select="@xml:id"/>
					</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:value-of select="@start"/>
					</xsl:attribute>
					<xsl:element name="div">
						<xsl:attribute name="class">area</xsl:attribute>
						<xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
						<xsl:attribute name="style"> left:<xsl:value-of select="(@ulx)"/>; top:<xsl:value-of select="(@uly)"/>; height:<xsl:value-of select="((@lry)-(@uly))"/>;  width:<xsl:value-of select="((@lrx)-(@ulx))"/> </xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:for-each>
			<xsl:for-each select="//tei:surface[@n='2']/tei:zone[@rendition='HotSpot']">
				<xsl:element name="a">
					<xsl:attribute name="href">
						<xsl:value-of select="@start"/>
					</xsl:attribute>
					<xsl:element name="div">
						<xsl:attribute name="class">hotspot</xsl:attribute>
						<xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
						<xsl:attribute name="style"> left:<xsl:value-of select="@ulx"/>; top:<xsl:value-of select="@uly"/>; height:<xsl:value-of select="((@lry)-(@uly))"/>;  width:<xsl:value-of select="((@lrx)-(@ulx))"/> </xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>

	<xsl:template name="titolo1">
		<xsl:element name="p">
			<xsl:value-of select="//tei:teiHeader/tei:profileDesc/tei:textClass/tei:keywords/tei:term"/> - 
			<xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno"/>
		</xsl:element>
	</xsl:template>

	<xsl:template name="titolo2">
		<xsl:element name="p">
			<xsl:value-of select="//tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
		</xsl:element>
	</xsl:template>

	<!-- estraggo informazioni per la descrizione della risorsa originale -->
	<xsl:template match="tei:note[@xml:id='additionalNota']">
		<xsl:element name="p">
			<span class="titoloinfo">
				<xsl:text>Codice identificativo: </xsl:text>
			</span>
			<xsl:text> LL1.26 - </xsl:text><xsl:apply-templates />
		</xsl:element>
	</xsl:template>

	<xsl:template match="tei:idno[@type='collocation']">
		<xsl:element name="p">
			<span class="titoloinfo">
				<xsl:text>Ubicazione maggio 2018: </xsl:text>
			</span>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="tei:textLang">
		<xsl:element name="p">
			<span class="titoloinfo">
				<xsl:text>Lingua: </xsl:text>
			</span>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="tei:support">
		<xsl:element name="p">
			<span class="titoloinfo">
				<xsl:text>Supporto: </xsl:text>
			</span>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="tei:material">
		<xsl:apply-templates />
		<xsl:text> - </xsl:text>
	</xsl:template>

	<xsl:template match="tei:extent">
		<xsl:element name="p">
			<span class="titoloinfo">
				<xsl:text>Dimensioni del folio: </xsl:text>
			</span>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="tei:height">
		<xsl:text>Altezza: </xsl:text><xsl:apply-templates/><xsl:text>,</xsl:text>
	</xsl:template>

	<xsl:template match="tei:width">
		<xsl:text>Larghezza: </xsl:text><xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:dimensions">
		<xsl:text>Folio (Unità di misura: </xsl:text><xsl:value-of select="./@unit"/><xsl:text>)</xsl:text><xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="tei:foliation">
		<xsl:element name="p">
			<span class="titoloinfo">
				<xsl:text>Piegature: </xsl:text>
			</span>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="tei:condition">
		<xsl:element name="p">
			<span class="titoloinfo">
				<xsl:text>Condizioni fisiche: </xsl:text>
			</span>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="tei:handDesc">
		<xsl:element name="p">
			<span class="titoloinfo">
				<xsl:text>Numero autori: </xsl:text>
			</span>
			<xsl:value-of select="./@hands"/>
		</xsl:element>
		<xsl:element name="p">
			<span class="titoloinfo">
				<xsl:text>Forma: </xsl:text>
			</span>
			<xsl:value-of select="./tei:handNote[@xml:id='h1']"/>
		</xsl:element>
		<xsl:element name="p">
			<span class="titoloinfo">
				<xsl:text>Altre mani: </xsl:text>
			</span>
			<xsl:value-of select="./tei:handNote[@xml:id='h2']"/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="//tei:pb" name="pageBegin"> 
		<xsl:for-each select=".">
			<br />
			<xsl:choose>
				<xsl:when test="@n=1">
					<xsl:element name="input">
						<xsl:attribute name="type">
							<xsl:text>button</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:text>FRONTE</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="onclick">
							<xsl:text>showFronte()</xsl:text>
						</xsl:attribute>
					</xsl:element>
				</xsl:when>
				<xsl:otherwise>
					<xsl:element name="input">
						<xsl:attribute name="type">
							<xsl:text>button</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="value">
							<xsl:text>RETRO</xsl:text>
						</xsl:attribute>
						<xsl:attribute name="onclick">
							<xsl:text>showRetro()</xsl:text>
						</xsl:attribute>
					</xsl:element>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="//tei:lb" name="lineBegin">
		<xsl:for-each select=".">
			<xsl:choose>
				<xsl:when test="@break">
					<sub>
						 =
					</sub>
					<br />
					<a class="TxtImg">
						<xsl:attribute name="name">
							<xsl:value-of select="@xml:id"/>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:value-of select="@facs"/>
						</xsl:attribute>
						<xsl:value-of select="@n"/>
					</a>
				</xsl:when>
				<xsl:otherwise>
					 <br />
					<a class="TxtImg">
						<xsl:attribute name="name">
							<xsl:value-of select="@xml:id"/>
						</xsl:attribute>
						<xsl:attribute name="href">
							<xsl:value-of select="@facs"/>
						</xsl:attribute>
						<xsl:value-of select="@n"/>
					</a>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="tei:ab[@type='paratext']">
		<br/>
		<xsl:element name="a">
			<xsl:attribute name="name">
				<xsl:value-of select="@xml:id"/>
			</xsl:attribute>
			(<xsl:value-of select="//tei:handNote[@xml:id='h2']"/>)
		</xsl:element>
	</xsl:template>

	<!--templates di formattazione -->
	<xsl:template match="tei:opener">
		<p class="dx">
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="tei:div[@type='closer']">
		<p class="dx">
			<xsl:apply-templates/>
		</p>
	</xsl:template>

	<xsl:template match="tei:del">
		<span class="overstrike">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="tei:add">
		<sup>
			<xsl:apply-templates/>
		</sup>
	</xsl:template>

	<xsl:template match="tei:hi">
		<xsl:choose>
			<xsl:when test="@rend='italic'">
				<span class="italic">
					<xsl:apply-templates />
				</span>
			</xsl:when>
			<xsl:when test="@rend='underline'">
				<span class="underline">
					<xsl:apply-templates/>
				</span>
			</xsl:when>
			<xsl:when test="@rend='sup'">
				<span>
					<sup>
						<xsl:apply-templates />
					</sup>
				</span>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="tei:gap">
		<xsl:apply-templates />
		<xsl:text>[...]</xsl:text>
	</xsl:template>

	<xsl:template match="tei:expan">
		<span class="expan" hidden="hidden">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="tei:choice/tei:abbr">
		<select class="expan">
			<xsl:element name="option">
				<xsl:attribute name="value">
					<xsl:value-of select="."/>
				</xsl:attribute>
				<xsl:value-of select="."/>
			</xsl:element>
			<xsl:element name="option">
				<xsl:attribute name="value">
					<xsl:value-of select="../tei:expan"/>
				</xsl:attribute>
				<xsl:value-of select="../tei:expan"/>
			</xsl:element>
		</select>
	</xsl:template>

	<xsl:template match="tei:supplied">
		<font color="#FF0000">
			(<xsl:value-of select="."/>)
		</font>
	</xsl:template>

	<xsl:template match="tei:reg">
		<span class="reg" hidden="hidden">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="tei:corr">
		<span class="corr" hidden="hidden">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="tei:distinct | tei:orig">
		<i>
			<xsl:apply-templates/>
		</i>
	</xsl:template>

	<!-- estraggo informazioni da riportare nei tooltip -->
	<xsl:template match="tei:term[@subtype='music-term']">
		<xsl:variable name="ref_term">
			<xsl:value-of select="substring(./@ref,2)"/>
		</xsl:variable>
		<span class="termini tooltip">
			<xsl:apply-templates />
			<span class="tooltiptext">
				<xsl:value-of select="//tei:item[@xml:id=$ref_term]/tei:gloss"/>
			</span>
		</span>
	</xsl:template>

	<xsl:template match="tei:orgName">
		<xsl:variable name="ref_org">
			<xsl:value-of select="substring(./@ref,2)"/>
		</xsl:variable>
		<span class="org tooltip">
			<xsl:apply-templates />
			<span class="tooltiptext">
				<xsl:value-of select="//tei:org[@xml:id=$ref_org]/tei:desc"/>
			</span>
		</span>
	</xsl:template>

	<xsl:template match="tei:rs">
		<xsl:variable name="ref_rs">
			<xsl:value-of select="substring(./@ref,2)"/>
		</xsl:variable>
		<span class="work tooltip">
			<xsl:apply-templates />
			<span class="tooltiptext">
				<xsl:value-of select="//tei:bibl[@xml:id=$ref_rs]/tei:note[@resp='#EC']/tei:p"/>
			</span>
		</span>
	</xsl:template>

	<xsl:template match="tei:placeName">
		<xsl:variable name="ref_place">
			<xsl:value-of select="substring(./@ref,2)"/>
		</xsl:variable>
		<span class="luoghi tooltip">
			<xsl:apply-templates />
			<span class="tooltiptext"> 
				<xsl:value-of select="//tei:place[@xml:id=$ref_place]"/>
			</span>
		</span>
	</xsl:template>

	<xsl:template match="//tei:ptr">
		<xsl:apply-templates />
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="concat(@target, '')"/>
			</xsl:attribute>
			<sup>
				[nota <xsl:value-of select="@n"/>]
			</sup>
		</xsl:element>
	</xsl:template>

	<xsl:template match="//tei:div[@type='ann_notes']/tei:note">    
		<xsl:element name="li">
			<xsl:attribute name="id"> 
				<xsl:value-of select="concat(@xml:id, '')"/>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="@source">
					<xsl:value-of select="tei:p"/> 
					(Fonte : Seminara 2017, pagina <xsl:value-of select="tei:bibl/tei:citedRange"/>)
				</xsl:when>
				<xsl:when test="@resp='#GS'">
					<xsl:value-of select="tei:p"/>
					<xsl:text>(Nota di Graziella Seminara)</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="tei:p"/>
					<xsl:text>(Nota della codificatrice)</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:element>
	</xsl:template>

	<xsl:template match="//tei:div[@type='bibliography']/tei:listBibl/tei:bibl">
		<xsl:element name="li">
			<xsl:value-of select="tei:ref/tei:bibl/tei:author" />, anno 
			<xsl:value-of select="tei:ref/tei:bibl/tei:date" />, pagina 
			<xsl:value-of select="tei:ref/tei:bibl/tei:citedRange" />
		</xsl:element>
	</xsl:template>

	<xsl:template match="tei:respStmt[1]">
		<xsl:value-of select="tei:resp"/>
		<xsl:value-of select="tei:name[1]"/>, 
		<xsl:value-of select="tei:name[2]"/>, 
		<xsl:value-of select="tei:name[3]"/>
	</xsl:template>

</xsl:stylesheet>

