using System.Runtime.InteropServices;
using System;

class SwapMouse {
    [DllImport("user32.dll")]
    public static extern Int32 SwapMouseButton(Int32 bSwap);
    static void Main(string[] args) {
        if (args.Length > 0 && String.Compare(args[0], "/u", true) == 0)
            SwapMouseButton(0);
        else
            SwapMouseButton(1);
    }
}