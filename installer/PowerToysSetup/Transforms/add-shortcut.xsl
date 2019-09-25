<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
                xmlns:wix="http://schemas.microsoft.com/wix/2006/wi">
  <!-- This XSLT transform adds the shortcut to the <Component> tag for the PowerToys.exe file. -->
  <xsl:output method="xml" indent="yes" encoding="utf-8" />
  
  <!-- This part was taken from here: https://stackoverflow.com/questions/41140034/how-to-create-shortcuts-to-files-harvested-by-heat-exe -->
  <xsl:template match="wix:Component[contains(concat(wix:File/@Source, '|'), 'PowerToys.exe|')]">
    <xsl:copy>
      <!-- First, copy everything in the input Component tag. -->
      <xsl:apply-templates select="@*|node()" />

      <!-- Then, add the below tags to the end. -->
      <wix:Shortcut Id="ApplicationStartMenuShortcut"
                Name="PowerToys"
                Description="PowerToys - Windows system utilities to maximize productivity"
                Directory="ApplicationProgramsFolder"
                Icon="powertoys.ico"
                IconIndex="0"
                Advertise="yes">
        <!-- Keep this all on one line, please. -->
        <xsl:attribute name="WorkingDirectory"><xsl:value-of select="@Directory"/></xsl:attribute>
      </wix:Shortcut>

      <wix:RemoveFolder Id="DeleteShortcutFolder" Directory="ApplicationProgramsFolder" On="uninstall" />
    </xsl:copy>
  </xsl:template>

  <!-- This part was taken from here: https://stackoverflow.com/questions/35214806/wix-xslt-transform-messing-up-my-formatting -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" />
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
