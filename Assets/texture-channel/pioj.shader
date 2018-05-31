Shader ".Pioj/CombineChannels" {
		
	Properties {
		_MainTex ("R(Detail) G() B() A()", 2D) = "white" {}
		_Amount("Opacity Detail", Range(0.0,1.0)) = 1
	
		[BlendingModes] _Blend ("Blend mode", Float) = 0
		

	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 100

		
			CGPROGRAM
			#pragma surface surf Lambert vertex:vert
			#pragma target 3.0
			
			sampler2D _MainTex;
			float _Amount;
			int _Blend;

			struct Input {
				fixed4 vertColor;
				float2 uv_MainTex;
			};

			void vert(inout appdata_full v, out Input o) {
				UNITY_INITIALIZE_OUTPUT(Input, o);
				o.vertColor = v.color;
			}


			//my Photoshop BlendingModes Function
			fixed3 ApplyBlend(fixed3 Target, fixed3 Blend) {
				fixed3 result = Target;
					//
					if(_Blend == 0) result = Target;
					if(_Blend == 1) result = min(Target,Blend);
					if(_Blend == 2) result = Target * Blend;
					if(_Blend == 3) result = 1 - (1-Target) / Blend;
					if(_Blend == 4) result = Target + Blend - 1;
					if(_Blend == 5) result = max(Target,Blend);
					if(_Blend == 6) result = 1 - (1-Target) * (1-Blend);
					if(_Blend == 7) result = Target / (1-Blend);
					if(_Blend == 8) result = Target + Blend;
					if(_Blend == 9) result = (Target > 0.5) * (1 - (1-2*(Target-0.5)) * (1-Blend)) + (Target <= 0.5) * ((2*Target) * Blend);
					if(_Blend == 10) result = (Blend > 0.5) * (1 - (1-Target) * (1-(Blend-0.5))) + (Blend <= 0.5) * (Target * (Blend+0.5));
					if(_Blend == 11) result = (Blend > 0.5) * (1 - (1-Target) * (1-2*(Blend-0.5))) + (Blend <= 0.5) * (Target * (2*Blend));
					if(_Blend == 12) result = (Blend > 0.5) * (1 - (1-Target) / (2*(Blend-0.5))) + (Blend <= 0.5) * (Target / (1-2*Blend));
					if(_Blend == 13) result = (Blend > 0.5) * (Target + 2*(Blend-0.5)) + (Blend <= 0.5) * (Target + 2*Blend - 1);
					if(_Blend == 14) result = (Blend >0.5)*(max(Target,2*(Blend -0.5))) + (Blend <= 0.5) * (min(Target,2*Blend));
					if(_Blend == 15) result = Target - Blend;
					if(_Blend == 16) result = 0.5 - 2*(Target-0.5)*(Blend-0.5);
					//
				return result;
			}

			void surf (Input IN, inout SurfaceOutput o) {
				
				fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
				fixed mask = 1- c.r *_Amount; //RED Channel


				//o.Albedo =  IN.vertColor.rgb * (0.5 + mask);
				
				o.Albedo = ApplyBlend(IN.vertColor.rgb, mask.r);
			}

			ENDCG
		}
		FallBack "Diffuse"
}
