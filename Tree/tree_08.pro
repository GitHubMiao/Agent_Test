;ͨ���������жϷ������ͣ����޷�����ENVI�ľ�������������ֻ��ͨ������if-else���������ʵ��
;�������ɾ������ع���ÿ�����뵥һ���ص�����ֵ��������3�����Σ���������ֵ����b1,b2,b3��ʾ
;classΪ�������ʹ��룬�����ͱ�ʾ����ʼֵ��Ϊ0��ͨ�����������class���¸�ֵ
;�������� ��ֵ��Soil=1; Vegetation=2; Water=3; IS=4(Imperious Surface)
;��ȡ3��5��8����

FUNCTION tree_08, band

  ;��ʼ��class��ֵΪ0
  class = 0
  
  IF (N_ELEMENTS(band) EQ 9) THEN BEGIN
    b1 = band[2]
    b2 = band[4]
    b3 = band[7]
  ENDIF
  
  ;�ڵ�������������վ����������е������
  ;�Զ���������ʽ��ĳ��-�������������ң����վ�����ͼ������ÿ�е�һ���ֲ�Ŀ�ʼ����
  
  ;*********************************************************************************
  ;#�ڵ�1-1
  IF (b3 LE 248.3) THEN BEGIN
    ;Water
    class = 3
  ENDIF ELSE BEGIN
  
    ;##�ڵ�2-1
    IF (b1 LE 278.7) THEN BEGIN
    
      ;###�ڵ�3-2
      IF (b2 LE -9.186) THEN BEGIN
      
        ;####�ڵ�4-4
        IF (b1 LE -118.2) THEN BEGIN
          ;IS
          class = 4
        ENDIF ELSE BEGIN
          ;Soil
          class = 1
        ENDELSE
        
      ENDIF ELSE BEGIN
      
        ;####�ڵ�4-3
        IF (b3 LE 516.4) THEN BEGIN
          ;Water
          class = 3
        ENDIF ELSE BEGIN
        
          ;#####�ڵ�5-3
          IF (b2 LE 32.08) THEN BEGIN
            ;Soil
            class = 1
          ENDIF ELSE BEGIN
          
            ;######�ڵ�6-3
            IF (b3 LE 3462.0) THEN BEGIN
              ;IS
              class = 4
            ENDIF ELSE BEGIN
              ;Soil
              class = 1
            ENDELSE
            
          ENDELSE
          
        ENDELSE
        
      ENDELSE
      
    ENDIF ELSE BEGIN
    
      ;###�ڵ�3-1
      IF (b1 LE 808.1) THEN BEGIN
      
        ;####�ڵ�4-2
        IF (b2 LE 119.8) THEN BEGIN
        
          ;#####�ڵ�5-2
          IF (b3 LE 1551.0) THEN BEGIN
            ;Vegetation
            class = 2
          ENDIF ELSE BEGIN
          
            ;######�ڵ�6-2
            IF (b3 LE 1646.0) THEN BEGIN
              ;Vegetation
              class = 2
            ENDIF ELSE BEGIN
            
              ;#######�ڵ�7-2
              IF (b3 LE 2090.0) THEN BEGIN
              
                ;########�ڵ�8-1
                IF (b2 LE 11.05) THEN BEGIN
                  ;Soil
                  class = 1
                ENDIF ELSE BEGIN
                  ;IS
                  class = 4
                ENDELSE
                
              ENDIF ELSE BEGIN
                ;Soil
                class = 1
              ENDELSE
              
            ENDELSE
            
          ENDELSE
          
        ENDIF ELSE BEGIN
          ;IS
          class = 4
        ENDELSE
        
      ENDIF ELSE BEGIN
      
        ;####�ڵ�4-1
        IF (b3 LE 2159.0) THEN BEGIN
        
          ;#####�ڵ�5-1
          IF (b3 LE 1806.0) THEN BEGIN
            ;Vegetation
            class = 2
          ENDIF ELSE BEGIN
          
            ;######�ڵ�6-1
            IF (b2 LE -208.6) THEN BEGIN
            
              ;#######�ڵ�7-1
              IF (b3 LE 2104.0) THEN BEGIN
                ;Vegetation
                class = 2
              ENDIF ELSE BEGIN
                ;Soil
                class = 1
              ENDELSE
              
            ENDIF ELSE BEGIN
              ;Soil
              class = 1
            ENDELSE
            
          ENDELSE
          
        ENDIF ELSE BEGIN
          ;Soil
          class = 1
        ENDELSE
        
      ENDELSE
      
    ENDELSE
    
  ENDELSE
  
  ;*********************************************************************************
  
  RETURN, class
  
END