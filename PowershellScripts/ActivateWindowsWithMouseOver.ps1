$signatureGet = @"
[DllImport("user32.dll")]
public static extern bool SystemParametersInfo(int uAction, int uParam, ref uint lpvParam, int flags );
"@
 
$systemParamInfoGet = Add-Type -memberDefinition  $signatureGet -Name sysInfoGetTime -passThru

$signatureSet = @"
[DllImport("user32.dll")]
public static extern bool SystemParametersInfo(int uAction, int uParam, uint lpvParam, int flags );
"@

$systemParamInfoSet = Add-Type -memberDefinition  $signatureSet -Name sysInfoSetTime -passThru

$SPI_SETACTIVEWNDTRKTIMEOUT = 0x2003;
$SPI_GETACTIVEWNDTRKTIMEOUT = 0x2002;

$SPI_GETWINARRANGING = 0x0082;
$SPI_SETWINARRANGING = 0x0083;

Function Get-WNDTRKTimeout
{
  $value = 0
  $systemParamInfoGet::SystemParametersInfo($SPI_GETACTIVEWNDTRKTIMEOUT, 0, [REF]$value, 0)
  $value
}
 
Function Set-WNDTRKTimeout
{
  Param ($value)
  $systemParamInfoSet::SystemParametersInfo($SPI_SETACTIVEWNDTRKTIMEOUT, 0, $value, 2)
}

Function Get-WINArranging
{
  $value = 0
  $systemParamInfoGet::SystemParametersInfo($SPI_GETWINARRANGING, 0, [REF]$value, 0)
  $value
}
 
Function Set-WINArranging
{
  Param ($value)
  $systemParamInfoSet::SystemParametersInfo($SPI_SETWINARRANGING, $value, $null, 2)
}
