Shader ".Pioj/CombineChannels" {
	Properties {
		_MainTex ("Texture", 2D) = "white" {}
		_Amount("Opacity Detail", Range(0.0,1.0)) = 1
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
				float2 uv_MainTex;
			};

			void vert(inout appdata_full v, out Input o) {
				UNITY_INITIALIZE_OUTPUT(Input, o);
				o.vertColor = v.color;
			}

			void surf (Input IN, inout SurfaceOutput o) {
				
				fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
				fixed mask = 1 - c.r *_Amount;
				//c.b = _Amount;

				o.Albedo =  IN.vertColor.rgb * (0.5 + mask);

				//o.Albedo =  IN.vertColor.rgb * c.rgb;
				
				

			}
			ENDCG
		}
		FallBack "Diffuse"
}
