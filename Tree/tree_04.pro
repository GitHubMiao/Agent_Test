;ͨ���������жϷ������ͣ����޷�����ENVI�ľ�������������ֻ��ͨ������if-else���������ʵ��
;�������ɾ������ع���ÿ�����뵥һ���ص�����ֵ��������3�����Σ���������ֵ����b1,b2,b3��ʾ
;classΪ�������ʹ��룬�����ͱ�ʾ����ʼֵ��Ϊ0��ͨ�����������class���¸�ֵ
;�������� ��ֵ��Soil=1; Vegetation=2; Water=3; IS=4(Imperious Surface)
;��ȡ1��3��4����

FUNCTION tree_04, band

  ;��ʼ��class��ֵΪ0
  class = 0
  
  IF (N_ELEMENTS(band) EQ 9) THEN BEGIN
    b1 = band[0]
    b2 = band[2]
    b3 = band[3]
  ENDIF
  
  ;�ڵ�������������վ����������е������
  ;�Զ���������ʽ��ĳ��-�������������ң����վ�����ͼ������ÿ�е�һ���ֲ�Ŀ�ʼ����
  
  ;*********************************************************************************
  ;#�ڵ�1-1
  IF (b1 LE 0.2700) THEN BEGIN
  
    ;##�ڵ�2-2
    IF (B1 LE 0.2312E-01) THEN BEGIN
    
      ;###�ڵ�3-4
      IF (b3 LE -1201.0) THEN BEGIN
        ;IS
        class = 4
      ENDIF ELSE BEGIN
        ;Water
        class = 3
      ENDELSE
      
    ENDIF ELSE BEGIN
    
      ;###�ڵ�3-3
      IF (b2 LE 174.4) THEN BEGIN
      
        ;####�ڵ�4-3
        IF (b3 LE -1804.0) THEN BEGIN
          ;IS
          class = 4
        ENDIF ELSE BEGIN
        
          ;#####�ڵ�5-4
          IF (b3 LE -1600.0) THEN BEGIN
          
            ;######�ڵ�6-6
            IF (b2 LE -95.02) THEN BEGIN
              ;IS
              class = 4
            ENDIF ELSE BEGIN
              ;Soil
              class = 1
            ENDELSE
            
          ENDIF ELSE BEGIN
          
            ;######�ڵ�6-5
            IF (b3 LE -1080.0) THEN BEGIN
            
              ;#######�ڵ�7-3
              IF (b2 LE 57.80) THEN BEGIN
                ;IS
                class = 4
              ENDIF ELSE BEGIN
              
                ;########�ڵ�8-4
                IF (b1 LE 0.1789) THEN BEGIN
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
            
          ENDELSE
          
        ENDELSE
        
      ENDIF ELSE BEGIN
      
        ;####�ڵ�4-2
        IF (b3 LE -848.5) THEN BEGIN
        
          ;#####�ڵ�5-3
          IF (b3 LE -952.8) THEN BEGIN
          
            ;######�ڵ�6-4
            IF (b3 LE -988.0) THEN BEGIN
              ;Soil
              class = 1
            ENDIF ELSE BEGIN
              ;IS
              class = 4
            ENDELSE
            
          ENDIF ELSE BEGIN
            ;IS
            class = 4
          ENDELSE
          
        ENDIF ELSE BEGIN
          ;IS
          class = 4
        ENDELSE
        
      ENDELSE
      
    ENDELSE
    
  ENDIF ELSE BEGIN
  
    ;##�ڵ�2-1
    IF (b1 LE 0.5395) THEN BEGIN
    
      ;###�ڵ�3-2
      IF (b2 LE 236.5) THEN BEGIN
        ;IS
        class = 4
      ENDIF ELSE BEGIN
      
        ;####�ڵ�4-1
        IF (b2 LE 483.7) THEN BEGIN
        
          ;#####�ڵ�5-2
          IF (b2 LE 302.1) THEN BEGIN
          
            ;######�ڵ�6-3
            IF (b2 LE 288.1) THEN BEGIN
              ;IS
              class = 4
            ENDIF ELSE BEGIN
              ;Soil
              class = 1
            ENDELSE
            
          ENDIF ELSE BEGIN
          
            ;######�ڵ�6-2
            IF (b1 LE 0.3798) THEN BEGIN
            
              ;#######�ڵ�7-2
              IF (b3 LE -707.8) THEN BEGIN
              
                ;########�ڵ�8-3
                IF (b3 LE -831.8) THEN BEGIN
                  ;Soil
                  class = 1
                ENDIF ELSE BEGIN
                  ;IS
                  class = 4
                ENDELSE
                
              ENDIF ELSE BEGIN
              
                ;########�ڵ�8-2
                IF (b3 LE -584.2) THEN BEGIN
                
                  ;#########�ڵ�9-2
                  IF (b2 LE 366.6) THEN BEGIN
                    ;IS
                    class = 4
                  ENDIF ELSE BEGIN
                  
                    ;##########�ڵ�10-2
                    IF (b1 LE 0.3280) THEN BEGIN
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
              
            ENDIF ELSE BEGIN
              ;IS
              class = 4
            ENDELSE
            
          ENDELSE
          
        ENDIF ELSE BEGIN
        
          ;#####�ڵ�5-1
          IF (b3 LE -408.0) THEN BEGIN
          
            ;######�ڵ�6-1
            IF (b3 LE -433.7) THEN BEGIN
            
              ;#######�ڵ�7-1
              IF (b3 LE -1605.0) THEN BEGIN
                ;IS
                class = 4
              ENDIF ELSE BEGIN
              
                ;########�ڵ�8-1
                IF (b3 LE -842.5) THEN BEGIN
                  ;Soil
                  class = 1
                ENDIF ELSE BEGIN
                
                  ;#########�ڵ�9-1
                  IF (b1 LE 0.3810) THEN BEGIN
                    ;Soil
                    class = 1
                  ENDIF ELSE BEGIN
                  
                    ;##########�ڵ�10-1
                    IF (b1 LE 0.4256) THEN BEGIN
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
              ;IS
              class = 4
            ENDELSE
            
          ENDIF ELSE BEGIN
            ;IS
            class = 4
          ENDELSE
          
        ENDELSE
        
      ENDELSE
      
    ENDIF ELSE BEGIN
    
      ;###�ڵ�3-1
      IF (b3 LE -2030.0) THEN BEGIN
        ;IS
        class = 4
      ENDIF ELSE BEGIN
        ;Vegetation
        class = 2
      ENDELSE
      
    ENDELSE
    
  ENDELSE
  
  ;*********************************************************************************
  
  RETURN, class
  
END