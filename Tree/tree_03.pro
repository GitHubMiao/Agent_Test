;ͨ���������жϷ������ͣ����޷�����ENVI�ľ�������������ֻ��ͨ������if-else���������ʵ��
;�������ɾ������ع���ÿ�����뵥һ���ص�����ֵ��������3�����Σ���������ֵ����b1,b2,b3��ʾ
;classΪ�������ʹ��룬�����ͱ�ʾ����ʼֵ��Ϊ0��ͨ�����������class���¸�ֵ
;�������� ��ֵ��Soil=1; Vegetation=2; Water=3; IS=4(Imperious Surface)
;��ȡ3��4��9����

FUNCTION tree_03, band

  ;��ʼ��class��ֵΪ0
  class = 0
  
  IF (N_ELEMENTS(band) EQ 9) THEN BEGIN
    b1 = band[2]
    b2 = band[3]
    b3 = band[8]
  ENDIF
  
  ;�ڵ�������������վ����������е������
  ;�Զ���������ʽ��ĳ��-�������������ң����վ�����ͼ������ÿ�е�һ���ֲ�Ŀ�ʼ����
  
  ;*********************************************************************************
  ;#�ڵ�1-1
  IF (b1 LE 252.4) THEN BEGIN
  
    ;##�ڵ�2-2
    IF (b3 LE 192.0) THEN BEGIN
      ;Water
      class = 3
    ENDIF ELSE BEGIN
    
      ;###�ڵ�3-2
      IF (b2 LE 311.1) THEN BEGIN
      
        ;####�ڵ�4-3
        IF (b1 LE 46.15) THEN BEGIN
          ;IS
          class = 4
        ENDIF ELSE BEGIN
        
          ;#####�ڵ�5-3
          IF (b2 LE -1287.0) THEN BEGIN
            ;Soil
            class = 1
          ENDIF ELSE BEGIN
          
            ;######�ڵ�6-4
            IF (b1 LE 228.8) THEN BEGIN
              ;IS
              class = 4
            ENDIF ELSE BEGIN
              ;Soil
              class = 1
            ENDELSE
            
          ENDELSE
          
        ENDELSE
        
      ENDIF ELSE BEGIN
        ;Water
        class = 3
      ENDELSE
      
    ENDELSE
    
  ENDIF ELSE BEGIN
  
    ;##�ڵ�2-1
    IF (b3 LE 1191.0) THEN BEGIN
      ;Vegetation
      class = 2
    ENDIF ELSE BEGIN
    
      ;###�ڵ�3-1
      IF (b1 LE 477.8) THEN BEGIN
      
        ;####�ڵ�4-2
        IF (b2 LE -580.4) THEN BEGIN
        
          ;#####�ڵ�5-2
          IF (b3 LE 2704.0) THEN BEGIN
          
            ;######�ڵ�6-3
            IF (b2 LE -1015.0) THEN BEGIN
              ;Soil
              class = 1
            ENDIF ELSE BEGIN
            
              ;#######�ڵ�7-1
              IF (b1 LE 362.4) THEN BEGIN
                ;IS
                class = 4
              ENDIF ELSE BEGIN
                ;Soil
                class = 1
              ENDELSE
              
            ENDELSE
            
          ENDIF ELSE BEGIN
          
            ;######�ڵ�6-2
            IF (b2 LE -1693.0) THEN BEGIN
              ;IS
              class = 4
            ENDIF ELSE BEGIN
              ;Soil
              class = 1
            ENDELSE
            
          ENDELSE
          
        ENDIF ELSE BEGIN
          ;IS
          class = 4
        ENDELSE
        
      ENDIF ELSE BEGIN
      
        ;####�ڵ�4-1
        IF (b3 LE 2147.0) THEN BEGIN
        
          ;#####�ڵ�5-1
          IF (b2 LE -555.6) THEN BEGIN
            ;Soil
            class = 1
          ENDIF ELSE BEGIN
          
            ;######�ڵ�6-1
            IF (b1 LE 584.7) THEN BEGIN
              ;Soil
              class = 1
            ENDIF ELSE BEGIN
              ;IS
              class = 4
            ENDELSE
            
          ENDELSE
          
        ENDIF ELSE BEGIN
          ;IS
          class = 4
        ENDELSE
        
      ENDELSE
      
    ENDELSE
    
  ENDELSE
  
  ;*********************************************************************************
  
  RETURN, class
  
END