;ͨ���������жϷ������ͣ����޷�����ENVI�ľ�������������ֻ��ͨ������if-else���������ʵ��
;�������ɾ������ع���ÿ�����뵥һ���ص�����ֵ��������3�����Σ���������ֵ����b1,b2,b3��ʾ
;classΪ�������ʹ��룬�����ͱ�ʾ����ʼֵ��Ϊ0��ͨ�����������class���¸�ֵ
;�������� ��ֵ��Soil=1; Vegetation=2; Water=3; IS=4(Imperious Surface)
;��ȡ4��6��7����

FUNCTION tree_07, band

  ;��ʼ��class��ֵΪ0
  class = 0
  
  IF (N_ELEMENTS(band) EQ 9) THEN BEGIN
    b1 = band[3]
    b2 = band[5]
    b3 = band[6]
  ENDIF
  
  ;�ڵ�������������վ����������е������
  ;�Զ���������ʽ��ĳ��-�������������ң����վ�����ͼ������ÿ�е�һ���ֲ�Ŀ�ʼ����
  
  ;*********************************************************************************
  ;#�ڵ�1-1
  IF (b3 LE 724.3) THEN BEGIN
    ;Water
    class = 3
  ENDIF ELSE BEGIN
  
    ;##�ڵ�2-1
    IF (b2 LE 864.5) THEN BEGIN
    
      ;###�ڵ�3-2
      IF (b2 LE 598.4) THEN BEGIN
      
        ;####�ڵ�4-3
        IF (b1 LE -1013.0) THEN BEGIN
          ;Soil
          class = 1
        ENDIF ELSE BEGIN
          ;Vegetation
          class = 2
        ENDELSE
        
      ENDIF ELSE BEGIN
      
        ;####�ڵ�4-2
        IF (b3 LE 1090.0) THEN BEGIN
          ;Water
          class = 3
        ENDIF ELSE BEGIN
        
          ;#####�ڵ�5-1
          IF (b3 LE 1779.0) THEN BEGIN
            ;IS
            class = 4
          ENDIF ELSE BEGIN
            ;Soil
            class = 1
          ENDELSE
          
        ENDELSE
        
      ENDELSE
      
    ENDIF ELSE BEGIN
    
      ;###�ڵ�3-1
      IF (b3 LE 2745.0) THEN BEGIN
        ;IS
        class = 4
      ENDIF ELSE BEGIN
      
        ;####�ڵ�4-1
        IF (b2 LE 1090.0) THEN BEGIN
          ;Soil
          class = 1
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