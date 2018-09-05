		#include		"aduc841.h"
		org			0000h
			basla:
			
			mov		r0,#19h
			mov		r1,#21h
			
;***********************************************
;			MATRISLER OLUSTURULUYOR
;***********************************************
			mov		b,#4d			
			etiket_1:
			dec		b
			mov		a,#3d		//a ya yeniden 3 degerini ata
			etiket_2:
			jz		etiket_1	//a=0 ise etiket_1 e zipla
			mov		r4,b		// b'yi r4 te sakla
			mov		r5,a		//a'yi r5 te sakla
			mul		ab			//a ile b yi çarp
			mov		b,r4		//b degerini r4 ten geri al "çünkü çarpmadan sonra sifirlandi"
			mov		@r0,a		//r0 içindeki veriyi adres yap içine çarpimin sonucunu at
			mov		@r1,a		//r1 içindeki veriyi adres yap içine çarpimin sonucunu at
			inc		r1			//r1 i bir arttir "ikinci matrisin bir sonraki degerine geç"
			dec		r0			//r0 i bir azalt yani "birinci matrisin bir önceki degerine geç"
			mov		a,r5		//a degerini r5 ten geri al
			dec		a			//a yi bir azalt			
			cjne		r0,#10h,etiket_2		//r0 10 degilse etiket_2 ye zipla
;************************************************
;			TOPLAMA
;************************************************		
			mov		r0,#10h
			mov		r1,#20h
			mov		r2,#30h
			etiket_3:			
			inc		r0
			inc		r1
			inc		r2	
			
			mov		03h,r2		//r2 yi 03h adresinde sakla	"sonuç matrisini 03h ta sakla"
			mov		a,@r1		//r1 de yazan veriyi adres yap o adresteki veriyi a ya ata	
			add		a,@r0		//a ile r0 in gösterdigi adresteki veriyi topla
			mov		b,r0		//r0 i b de sakla			
			mov		r0,03h		//r0 degerini 03h tan geri al	"sonuç matrisinin siradaki degerini r0 ya ata"			
			mov		@r0,a		//r0 daki veriyi adres yap o adrese a yi ata	"sonuç matrisine degeri yaz"
			mov		r0,b		//r0 in asil degerini b den geri al			
			cjne		r0,#19h,etiket_3				
			
			
			sjmp  basla
