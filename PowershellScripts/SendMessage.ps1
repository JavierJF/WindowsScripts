$cs = @"
[DllImport("user32.dll")]
public static extern int SendNotifyMessageW(int hWnd, int hMsg, int wParam, string lParam);
[DllImport("user32.dll")]
public static extern IntPtr FindWindow(String sClassName, String sAppName);
[DllImport("user32.dll")]
public static extern bool EndDialog(int hwnd, int value);
"@

$winapi = Add-Type -MemberDefinition $cs -Name h2 -PassThru

# CONSTANTS
######################

$WM_CLOSE       = 0x10
$WM_CHAR        = 0x001A
$HWND_BROADCAST = 0xffff

######################


# Example usage

# $winapi::PostMessage(0x40746, $WM_CLOSE, 1, 0x40000000);
# Start-Sleep(2);
# $hwnd = $winapi::FindWindow("#32770", "ZoomText 11");
# $winapi::SendNotifyMessageW($hwnd, $WM_CHAR, 0x0, "Policy");
# $winapi::EndDialog(0x3F043A, $WM_CLOSE, 0x0d, 0x0);
