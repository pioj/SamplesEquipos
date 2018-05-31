using System;
using UnityEngine;
using UnityEditor;

public class BlendingModesDrawer : MaterialPropertyDrawer
{
    public enum eBlendingModes { Normal = 0,
        Darken = 1, Multiply = 2, ColorBurn = 3, LinearBurn = 4, Lighten = 5,
        Screen = 6, ColorDodge = 7, LinearDodge = 8, Overlay = 9, SoftLight = 10,
        HardLight = 11, VividLight = 12, LinearLight = 13, PinLight = 14, Difference = 15,
        Exclusion = 16
    }

    // Draw the property inside the given rect
    public override void OnGUI(Rect position, MaterialProperty prop, String label, MaterialEditor editor)
    {
        // Setup
        eBlendingModes myBlendValue = (eBlendingModes)prop.floatValue;

        EditorGUI.BeginChangeCheck();
        EditorGUI.showMixedValue = prop.hasMixedValue;

        // Show the toggle control
        myBlendValue = (eBlendingModes) EditorGUI.EnumPopup(position, label, myBlendValue);


        EditorGUI.showMixedValue = false;
        if (EditorGUI.EndChangeCheck())
        {
            // Set the new value if it has changed
            prop.floatValue = (float)myBlendValue;

        }
    }
}
