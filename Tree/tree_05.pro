;ͨ���������жϷ������ͣ����޷�����ENVI�ľ�������������ֻ��ͨ������if-else���������ʵ��
;�������ɾ������ع���ÿ�����뵥һ���ص�����ֵ��������3�����Σ���������ֵ����b1,b2,b3��ʾ
;classΪ�������ʹ��룬�����ͱ�ʾ����ʼֵ��Ϊ0��ͨ�����������class���¸�ֵ
;�������� ��ֵ��Soil=1; Vegetation=2; Water=3; IS=4(Imperious Surface)
;��ȡ2��5��9����

FUNCTION tree_05, band

  ;��ʼ��class��ֵΪ0
  class = 0
  
  IF (N_ELEMENTS(band) EQ 9) THEN BEGIN
    b1 = band[1]
    b2 = band[4]
    b3 = band[8]
  ENDIF
  
  ;�ڵ�������������վ����������е������
  ;�Զ���������ʽ��ĳ��-�������������ң����վ�����ͼ������ÿ�е�һ���ֲ�Ŀ�ʼ����
  
  ;*********************************************************************************
  ;#�ڵ�1-1
  IF (b1 LE 1021.0) THEN BEGIN
    ;Water
    class = 3
  ENDIF ELSE BEGIN
  
    ;##�ڵ�2-1
    IF (b2 LE 82.88) THEN BEGIN
    
      ;###�ڵ�3-1
      IF (b3 LE 1198.0) THEN BEGIN
        ;Vegetation
        class = 2
      ENDIF ELSE BEGIN
      
        ;####�ڵ�4-1
        IF (b1 LE 5406.0) THEN BEGIN
        
          ;#####�ڵ�5-2
          IF (b2 LE -55.70) THEN BEGIN
            ;Soil
            class = 1
          ENDIF ELSE BEGIN
          
            ;######�ڵ�6-1
            IF (b2 LE 13.79) THEN BEGIN
              ;Soil
              class = 1
            ENDIF ELSE BEGIN
              ;IS
              class = 4
            ENDELSE
            
          ENDELSE
          
        ENDIF ELSE BEGIN
        
          ;#####�ڵ�5-1
          IF (b2 LE -188.1) THEN BEGIN
            ;IS
            class = 4
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
    
  ENDELSE
  
  ;*********************************************************************************
  
  RETURN, class
  
END