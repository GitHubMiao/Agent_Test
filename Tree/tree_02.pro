;ͨ���������жϷ������ͣ����޷�����ENVI�ľ�������������ֻ��ͨ������if-else���������ʵ��
;�������ɾ������ع���ÿ�����뵥һ���ص�����ֵ��������3�����Σ���������ֵ����b1,b2,b3��ʾ
;classΪ�������ʹ��룬�����ͱ�ʾ����ʼֵ��Ϊ0��ͨ�����������class���¸�ֵ
;�������� ��ֵ��Soil=1; Vegetation=2; Water=3; IS=4(Imperious Surface)
;��ȡ2��3��5����

FUNCTION tree_02, band

  ;��ʼ��class��ֵΪ0
  class = 0
  
  IF (N_ELEMENTS(band) EQ 9) THEN BEGIN
    b1 = band[1]
    b2 = band[2]
    b3 = band[4]
  ENDIF
  
  ;�ڵ�������������վ����������е������
  ;�Զ���������ʽ��ĳ��-�������������ң����վ�����ͼ������ÿ�е�һ���ֲ�Ŀ�ʼ����
  
  ;*********************************************************************************
  ;#�ڵ�1-1
  IF (b2 LE 252.4) THEN BEGIN
  
    ;##�ڵ�2-2
    IF (b1 LE 1154.0) THEN BEGIN
      ;Water
      class = 3
    ENDIF ELSE BEGIN
    
      ;###�ڵ�3-3
      IF (b3 LE -14.80) THEN BEGIN
      
        ;####�ڵ�4-5
        IF (b2 LE -116.0) THEN BEGIN
          ;IS
          class = 4
        ENDIF ELSE BEGIN
          ;Soil
          class = 1
        ENDELSE
        
      ENDIF ELSE BEGIN
      
        ;####�ڵ�4-5
        IF (b3 LE 32.74) THEN BEGIN
          ;Soil
          class = 1
        ENDIF ELSE BEGIN
          ;IS
          class = 4
        ENDELSE
        
      ENDELSE
      
    ENDELSE
    
  ENDIF ELSE BEGIN
  
    ;##�ڵ�2-1
    IF (b2 LE 807.2) THEN BEGIN
    
      ;###�ڵ�3-2
      IF (b3 LE 117.8) THEN BEGIN
      
        ;####�ڵ�4-3
        IF (b1 LE 2500.0) THEN BEGIN
          ;Vegetation
          class = 2
        ENDIF ELSE BEGIN
          ;Soil
          class = 1
        ENDELSE
        
      ENDIF ELSE BEGIN
        ;IS
        class = 4
      ENDELSE
      
    ENDIF ELSE BEGIN
    
      ;###�ڵ�3-1
      IF (b1 LE 3455.0) THEN BEGIN
      
        ;####�ڵ�4-2
        IF (b1 LE 3356.0) THEN BEGIN
          ;Vegetation
          class = 2
        ENDIF ELSE BEGIN
        
          ;#####�ڵ�5-1
          IF (b2 LE 952.7) THEN BEGIN
            ;Soil
            class = 1
          ENDIF ELSE BEGIN
            ;Vegetation
            class = 2
          ENDELSE
          
        ENDELSE
        
      ENDIF ELSE BEGIN
      
        ;####�ڵ�4-1
        IF (b2 LE 1143.0) THEN BEGIN
          ;Soil
          class = 1
        ENDIF ELSE BEGIN
          ;Vegetation
          class = 2
        ENDELSE
        
      ENDELSE
      
    ENDELSE
    
  ENDELSE
  
  ;*********************************************************************************
  
  RETURN, class
  
END