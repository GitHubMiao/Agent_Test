;��ȡͼ�������ص��ͼ�����꣬���Ħ������չһ�����غ��״��
;������ʽ��������ø�����ʶ
;������չλ��������ֵ��ʽ���
;һά��չֻ���ٽ�λ�ã���������+1��-1
;��ά��չ��ʽ������ֵ����ͼ��ʾ
;
;    1��������2��������3
;    |    |    |
;    |    |    |
;    8��������P��������4
;    |    |    |
;    |    |    |
;    7��������6��������5
;
;�����ڼ��һά���ά��չ

;pixel_pos���±귨��ʾ�ľ���Ԫ�ص�λ�ã���[1]��[2,3]
;array_dims�Ǿ����С��Ϣ��һά�������С�պõ�����ά�ȣ���ά�����������к��е�ֵ
;������ȡ�ϣ�array_dims����ͨ��size������Ϲؼ���Dimensions��ȡ,���뷽ʽ������pixel_pos

PRO check_extension_test, pixel_pos, array_dims, dims_check = dims_check, check = check
    
  ;piexl_pos��ʾ���ص�λ�ã�dim_pixel��ʾλ�ò�����ά�ȣ���˽�������ȡֵ1��2
  dim_pixel = SIZE(pixel_pos, /DIMENSIONS)
  
  ;array_dims��ʾ�����С��Ϣ��dim_array��ʾλ�ò�����ά�ȣ���˽�������ȡֵ1��2
  dim_array = SIZE(array_dims, /DIMENSIONS)
  
  ;һά��չ
  IF ((dim_pixel EQ 1) && (dim_array EQ 1)) THEN BEGIN
  
    ;��ʼ��dims_check
    dims_check = [-1,-1]
    
    IF (((pixel_pos[0]-1) GE 0) && (pixel_pos[0] LE (array_dims-1))) THEN BEGIN
      dims_check[0] = 1
    ENDIF
    
    IF (((pixel_pos[0]+1) LE (array_dims-1)) && (pixel_pos[0] GE 0)) THEN BEGIN
      dims_check[1] = 2
    ENDIF
    
    IF (KEYWORD_SET(check)) THEN BEGIN
      tmp = WHERE(dims_check NE -1, count, /NULL)
      dims_check = dims_check[tmp]
    ENDIF
    
  ENDIF ELSE BEGIN
  
    ;��ά��չ
    IF ((dim_pixel EQ 2) && (dim_array EQ 2)) THEN BEGIN
    
      ;��ʼ��dims_check
      dims_check = [-1,-1,-1,-1,-1,-1,-1,-1]
      
      ;����ȷ������λ��Ϊ9�����صĹ��������ε��ĸ���λ��
      ;1��λ��y�����ƶ�
      IF (((pixel_pos[0]-1) GE 0) && (pixel_pos[0] LE (array_dims[0]-1))) THEN BEGIN
      
        ;1��λ��x�����ƶ�
        IF (((pixel_pos[1]-1) GE 0) && (pixel_pos[1] LE (array_dims[1]-1))) THEN BEGIN
          dims_check[0] = 1
        ENDIF
        
      ENDIF
      
      ;3��λ��y�����ƶ�
      IF (((pixel_pos[0]+1) LE (array_dims[0]-1)) && (pixel_pos[0] GE 0)) THEN BEGIN
      
        ;3��λ��x�����ƶ�
        IF (((pixel_pos[1]-1) GE 0) && (pixel_pos[1] LE (array_dims[1]-1))) THEN BEGIN
          dims_check[2] = 3
        ENDIF
        
      ENDIF
      
      ;5��λ��x�����ƶ�
      IF (((pixel_pos[0]+1) LE (array_dims[0]-1)) && (pixel_pos[0] GE 0)) THEN BEGIN
      
        ;5��λ��y�����ƶ�
        IF (((pixel_pos[1]+1) LE (array_dims[1]-1)) && (pixel_pos[1] GE 0)) THEN BEGIN
          dims_check[4] = 5
        ENDIF
        
      ENDIF
      
      ;7��λ��x�����ƶ�
      IF (((pixel_pos[0]-1) GE 0) && (pixel_pos[0] LE (array_dims[0]-1))) THEN BEGIN
      
        ;7��λ��y�����ƶ�
        IF (((pixel_pos[1]+1) LE (array_dims[1]-1)) && (pixel_pos[1] GE 0)) THEN BEGIN
          dims_check[6] = 7
        ENDIF
        
      ENDIF
      
      ;��ȷ��ż��λ��������˵��
      ;2��λ��x�����ƶ�
      IF ((pixel_pos[0] GE 0) && (pixel_pos[0] LE (array_dims[0]-1))) THEN BEGIN
      
        ;2��λ��x�����ƶ�
        IF (((pixel_pos[1]-1) GE 0) && (pixel_pos[1] LE (array_dims[1]-1))) THEN BEGIN
          dims_check[1] = 2
        ENDIF
        
      ENDIF
      
      ;4��λ��x�����ƶ�
      IF (((pixel_pos[0]+1) LE (array_dims[0]-1)) && (pixel_pos[0] GE 0)) THEN BEGIN
      
        ;4��λ��x�����ƶ�
        IF ((pixel_pos[1] GE 0) && (pixel_pos[1] LE (array_dims[1]-1))) THEN BEGIN
          dims_check[3] = 4
        ENDIF
        
      ENDIF
      
      ;6��λ��x�����ƶ�
      IF ((pixel_pos[0] GE 0) && (pixel_pos[0] LE (array_dims[0]-1))) THEN BEGIN
      
        ;6��λ��x�����ƶ�
        IF (((pixel_pos[1]+1) LE (array_dims[1]-1)) && (pixel_pos[1] GE 0)) THEN BEGIN
          dims_check[5] = 6
        ENDIF
        
      ENDIF
      
      ;8��λ��x�����ƶ�
      IF ((pixel_pos[0]-1 GE 0) && (pixel_pos[0] LE (array_dims[0]-1))) THEN BEGIN
      
        ;8��λ��x�����ƶ�
        IF ((pixel_pos[1] GE 0) && (pixel_pos[1] LE (array_dims[1]-1))) THEN BEGIN
          dims_check[7] = 8
        ENDIF
        
      ENDIF
      
      IF (KEYWORD_SET(check)) THEN BEGIN
        tmp = WHERE(dims_check NE -1, count, /NULL)
        dims_check = dims_check[tmp]
      ENDIF
      
    ENDIF ELSE BEGIN
      void = DIALOG_MESSAGE('������������',/ERROR)
    ENDELSE
    
  ENDELSE
  
END