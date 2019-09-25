<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns="http://schemas.microsoft.com/wix/2006/wi">
  <!-- This XSLT transform removes *.ilk, *.lib, and *.pdb files from the installer. -->
  <xsl:output method="xml" indent="yes" encoding="utf-8" />
  
  <!-- This part was taken from here: https://stackoverflow.com/questions/26432307/can-i-optionally-include-specific-file-extensions-with-wix-heat-using-transforms -->
  <xsl:template match="Component[
                  contains(concat(File/@Source, '|'), '.lib|') or
                  contains(concat(File/@Source, '|'), '.pdb|') or
                  contains(concat(File/@Source, '|'), '.ilk|')
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
