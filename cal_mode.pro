;����������dataΪ��ͳ�Ƶ��������飨������Ԫ�ص���С���Ϊ1���������л��data���ͽ����ж�
;��ӹؼ���reverse�����Լ���������ٵ�Ԫ��
;�Ľ�ԭʼ�����bug���֣�����ж��������Ԫ�����ٵ�Ԫ�أ���ת��Ϊ����ȫ�����

FUNCTION CAL_MODE, data, reverse = reverse

  ;��ȡdata���������ͣ�ȷ�������ͻ����Ƶ�Ԫ����С���Ϊ1�����ͣ�data_type�μ�size��������
  data_type = SIZE(data, /TYPE)
  
  IF (((data_type GT 0) && (data_type LT 4)) || ((data_type GT 11) && (data_type LE 15))) THEN BEGIN
  
    ht = HISTOGRAM(data, OMIN = omin, LOCATIONS = locations)
    
    in = WHERE(ht NE 0)
    
    IF (KEYWORD_SET(reverse)) THEN BEGIN
      ;�����ͳ��������Ԫ�ظ������ٵ�Ԫ��
      minv = MIN(ht[in], index)
      RETURN, omin+WHERE(ht EQ minv)
    ENDIF ELSE BEGIN
      ;��������
      maxv = MAX(ht[in], index)
      RETURN, omin+WHERE(ht EQ maxv)
    ENDELSE
    
  ENDIF ELSE BEGIN
    void = DIALOG_MESSAGE('�����������ʹ���',/ERROR)
    data=!NULL
    RETURN, data
  ENDELSE
  
END