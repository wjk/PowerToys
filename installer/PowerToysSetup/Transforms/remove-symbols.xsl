<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:wix="http://schemas.microsoft.com/wix/2006/wi">
  <!-- This XSLT transform removes *.ilk, *.lib, and *.pdb files from the installer. -->
  <xsl:output method="xml" indent="yes" encoding="utf-8" />
  
  <!-- This part was taken from here: https://stackoverflow.com/questions/26432307/can-i-optionally-include-specific-file-extensions-with-wix-heat-using-transforms -->
  <xsl:template match="wix:Component[
                  contains(concat(wix:File/@Source, '|'), '.lib|') or
                  contains(concat(wix:File/@Source, '|'), '.exp|') or
                  contains(concat(wix:File/@Source, '|'), '.pdb|') or
                  contains(concat(wix:File/@Source, '|'), '.ilk|')
                ]">
    <!-- Replace with nothing. -->
  </xsl:template>

  <!-- This part I wrote myself. It removes references to Components deleted above. -->
  <xsl:key name="component" match="wix:Component" use="@Id" />
  <xsl:template match="wix:ComponentRef[
                  contains(concat(key('component', @Id)/wix:File/@Source, '|'), '.lib|') or
                  contains(concat(key('component', @Id)/wix:File/@Source, '|'), '.exp|') or
                  contains(concat(key('component', @Id)/wix:File/@Source, '|'), '.pdb|') or
                  contains(concat(key('component', @Id)/wix:File/@Source, '|'), '.ilk|')
                ]">
    <!-- Replace with nothing. -->
  </xsl:template>

  <!-- This part was taken from here: https://stackoverflow.com/questions/35214806/wix-xslt-transform-messing-up-my-formatting -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
