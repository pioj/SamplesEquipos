Shader ".Pioj/CombineChannels" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_Amount("Amount", Range(0.0,1.0)) = 1
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 100

		
			CGPROGRAM
			#pragma surface surf Lambert vertex:vert
			#pragma target 3.0
			
			sampler2D _MainTex;
			float _Amount;

			struct Input {
				fixed4 vertColor;
			};

			void vert(inout appdata_full v, out Input o) {
				UNITY_INITIALIZE_OUTPUT(Input, o);
				o.vertColor = v.color;
			}

			void surf (Input IN, inout SurfaceOutput o) {
				o.Albedo = IN.vertColor.rgb;
				//o.Albedo = IN.vertColor.rgb * _Amount;
				
				//FALTA PONER LA TEXTURA!!!

			}
			ENDCG
		}
		FallBack "Diffuse"
}
