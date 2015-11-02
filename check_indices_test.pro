;check_indices������check_extension��������Ŀ���չλ����Ϣת��Ϊͼ������Ӧ�ľ�������
;�����dims_checked��check_extension������ȡ������ʱ��Ҫ�ӹؼ���/check
;check_indicesĬ�ϼ���һά����
;�����ά���������ӹؼ���/T2D
;indices_checkΪ���صľ�������ֵ��ͨ��array[indices_check]��ȡ�����е�Ԫ��ֵ
;ʾ���������£�
; IDL> a = indgen(5,6)
; IDL> pixel_pos = [3,3]
; IDL> check_extension_test, pixel_pos, array_dims, dims_check = dims_check, /check
; IDL> check_indices_test, pixel_pos, a, dims_check, indices_check = indices_check, /T2D
; IDL> print,indices_check
;       12      13      14      19      24      23      22      17
; IDL> pixel_pos = [4,5]
; IDL> check_extension_test, pixel_pos, array_dims, dims_check = dims_check, /check
; IDL> check_indices_test, pixel_pos, a, dims_check, indices_check = indices_check, /T2D
; IDL> print,indices_check
;       23      24      28


FUNCTION  dims_case, pixel_pos, dims_value, array

  index_value = -1
  
  ;��ȡ�����������array_dims[0]
  array_dims = SIZE(array, /DIMENSIONS)
  
  ;��ȡpixel_pos��ʾ����λ�õ�����ֵ
  pixel_index = array_indices_reverse(array, pixel_pos)
  
  ;ͨ��case�ж�dims_value��ȡֵ��dims_values��ȡֵΪ1~8��-1����ʵ���в�����ȡֵ-1�����
  CASE (dims_value) OF
  
    1: BEGIN
      index_value = pixel_index-array_dims[0]-1
    END
    
    2: BEGIN
      index_value = pixel_index-array_dims[0]
    END
    
    3: BEGIN
      index_value = pixel_index-array_dims[0]+1
    END
    
    4: BEGIN
      index_value = pixel_index+1
    END
    
    5: BEGIN
      index_value = pixel_index+array_dims[0]+1
    END
    
    6: BEGIN
      index_value = pixel_index+array_dims[0]
    END
    
    7: BEGIN
      index_value = pixel_index+array_dims[0]-1
    END
    
    8: BEGIN
      index_value = pixel_index-1
    END
    
    ELSE: BEGIN
      index_value = -1
    END
    
  ENDCASE
  
  RETURN, index_value
  
END


PRO check_indices_test, pixel_pos, array, dims_checked, indices_check = indices_check, T2D = T2D

  IF (KEYWORD_SET(T2D)) THEN BEGIN
  
    ;��ά����
    ;��ʼ��indices_check��ֱ�Ӹ�ֵ��dims_checked��indices_checkӵ��һ����Ԫ�ظ���
    indices_check = dims_checked
    
    FOR i = 0L, N_ELEMENTS(dims_checked)-1 DO BEGIN
      indices_check[i] = dims_case(pixel_pos, dims_checked[i], array)
    ENDFOR
    
  ENDIF ELSE BEGIN
  
    ;һά����
    ;��ʼ��indices_check
    indices_check = dims_checked
    
    ;����������ת��Ϊ����ֵ
    pixel_index = array_indices_reverse(array, pixel_pos)
    
    ;��ȡһά�������չλ�õĸ��������Ϊ��������λ�ã�tmpȡֵΪ0��1��2����ʵ����ȡֵ������Ϊ0
    tmp = SIZE(dims_checked, /DIMENSIONS)
    
    ;ʹ��case�ж�
    CASE (tmp) OF
    
      1: BEGIN
        IF (dims_checked[0] EQ 1) THEN BEGIN
          indices_check[0] = pixel_index-1
        ENDIF
        
        IF (dims_checked[0] EQ 2) THEN BEGIN
          indices_check[0] = pixel_index+1
        ENDIF
      END
      
      2: BEGIN
        indices_check[0] = pixel_index-1
        indices_check[1] = pixel_index+1
      END
      
      ELSE: BEGIN
        indices_check = -1
      END
      
    ENDCASE
    
  ENDELSE
  
END