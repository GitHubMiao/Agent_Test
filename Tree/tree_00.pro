;ͨ���������жϷ������ͣ����޷�����ENVI�ľ�������������ֻ��ͨ������if-else���������ʵ��
;�������ɾ������ع���ÿ�����뵥һ���ص�����ֵ��������3�����Σ���������ֵ����b1,b2,b3��ʾ
;classΪ�������ʹ��룬�����ͱ�ʾ����ʼֵ��Ϊ0��ͨ�����������class���¸�ֵ
;�������� ��ֵ��Soil=1; Vegetation=2; Water=3; IS=4(Imperious Surface)
;�����������tree_00����������ʵ��ʹ������������ȫ����������������3��
;���ղ���Ϊ9��Ԫ�ص�����������9���������������ɵľ���������ȡ���е�b1��b5��b7����������ֵ��

FUNCTION tree_00, band

  ;��ʼ��class��ֵΪ0
  class = 0
  
  IF (N_ELEMENTS(band) EQ 9) THEN BEGIN
    b1 = band[0]
    b5 = band[4]
    b7 = band[6]
  ENDIF
  
  ;�ڵ�������������վ����������е������
  ;�Զ���������ʽ��ĳ��-�������������ң����վ�����ͼ������ÿ�е�һ���ֲ�Ŀ�ʼ����
  
  ;*********************************************************************************
  ;#�ڵ�1-1
  IF (b1 LE 0.2700) THEN BEGIN
  
    ;##�ڵ�2-2
    IF (b7 LE 694.3) THEN BEGIN
      ;Water
      class = 3
    ENDIF ELSE BEGIN
    
      ;###�ڵ�3-2
      IF (b5 LE 22.02) THEN BEGIN
      
        ;####�ڵ�4-1
        IF (B1 LE 0.7823E-01) THEN BEGIN
          ;IS
          class = 4
        ENDIF ELSE BEGIN
          ;Soil
          class = 1
        ENDELSE
        
      ENDIF ELSE BEGIN
        ;IS
        class = 4
      ENDELSE
      
    ENDELSE
    
  ENDIF ELSE BEGIN
  
    ;##�ڵ�2-1
    IF (b1 LE 0.5395) THEN BEGIN
    
      ;###�ڵ�3-1
      IF (b5 LE 110.2) THEN BEGIN
        ;Soil
        class = 1
      ENDIF ELSE BEGIN
        ;IS
        class = 4
      ENDELSE
      
    ENDIF ELSE BEGIN
      ;Vegetation
      class = 2
    ENDELSE
    
  ENDELSE
  
  ;*********************************************************************************
  
  RETURN, class
  
END