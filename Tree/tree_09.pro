;ͨ���������жϷ������ͣ����޷�����ENVI�ľ�������������ֻ��ͨ������if-else���������ʵ��
;�������ɾ������ع���ÿ�����뵥һ���ص�����ֵ��������3�����Σ���������ֵ����b1,b2,b3��ʾ
;classΪ�������ʹ��룬�����ͱ�ʾ����ʼֵ��Ϊ0��ͨ�����������class���¸�ֵ
;�������� ��ֵ��Soil=1; Vegetation=2; Water=3; IS=4(Imperious Surface)
;��ȡ1��3��9����

FUNCTION tree_09, band

  ;��ʼ��class��ֵΪ0
  class = 0
  
  IF (N_ELEMENTS(band) EQ 9) THEN BEGIN
    b1 = band[0]
    b2 = band[2]
    b3 = band[8]
  ENDIF
  
  ;�ڵ�������������վ����������е������
  ;�Զ���������ʽ��ĳ��-�������������ң����վ�����ͼ������ÿ�е�һ���ֲ�Ŀ�ʼ����
  
  ;*********************************************************************************
  ;#�ڵ�1-1
  IF (b1 LE 0.2700) THEN BEGIN
  
    ;##�ڵ�2-2
    IF (b3 LE 196.3) THEN BEGIN
      ;Water
      class = 3
    ENDIF ELSE BEGIN
    
      ;###�ڵ�3-2
      IF (b2 LE 174.1) THEN BEGIN
      
        ;####�ڵ�4-3
        IF (b3 LE 342.2) THEN BEGIN
          ;Water
          class = 3
        ENDIF ELSE BEGIN
          ;IS
          class = 4
        ENDELSE
        
      ENDIF ELSE BEGIN
      
        ;####�ڵ�4-2
        IF (b3 LE 1632.0) THEN BEGIN
        
          ;#####�ڵ�5-3
          IF (b2 LE 318.6) THEN BEGIN
            ;IS
            class = 4
          ENDIF ELSE BEGIN
            ;Soil
            class = 1
          ENDELSE
          
        ENDIF ELSE BEGIN
        
          ;#####�ڵ�5-2
          IF (b2 LE 212.0) THEN BEGIN
          
            ;######�ڵ�6-2
            IF (b1 LE 0.2407) THEN BEGIN
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
      
    ENDELSE
    
  ENDIF ELSE BEGIN
  
    ;##�ڵ�2-1
    IF (b1 LE 0.5395) THEN BEGIN
    
      ;###�ڵ�3-1
      IF (b2 LE 236.5) THEN BEGIN
        ;IS
        class = 4
      ENDIF ELSE BEGIN
      
        ;####�ڵ�4-1
        IF (b2 LE 483.7) THEN BEGIN
        
          ;#####�ڵ�5-1
          IF (b2 LE 302.1) THEN BEGIN
            ;Vegetation
            class = 2
          ENDIF ELSE BEGIN
          
            ;######�ڵ�6-1
            IF (b1 LE 0.3798) THEN BEGIN
              ;Soil
              class = 1
            ENDIF ELSE BEGIN
              ;IS
              class = 4
            ENDELSE
            
          ENDELSE
          
        ENDIF ELSE BEGIN
          ;Soil
          class = 1
        ENDELSE
        
      ENDELSE
      
    ENDIF ELSE BEGIN
      ;Vegetation
      class = 2
    ENDELSE
    
  ENDELSE
  
  ;*********************************************************************************
  
  RETURN, class
  
END