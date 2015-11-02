;check_indices函数将check_extension函数输出的可扩展位置信息转换为图像矩阵对应的矩阵索引
;输入的dims_checked由check_extension函数获取，调用时需要加关键字/check
;check_indices默认计算一维数组
;计算二维数组必须添加关键字/T2D
;indices_check为返回的矩阵索引值，通过array[indices_check]获取矩阵中的元素值
;示例代码如下：
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
  
  ;获取矩阵的列数：array_dims[0]
  array_dims = SIZE(array, /DIMENSIONS)
  
  ;获取pixel_pos表示像素位置的索引值
  pixel_index = array_indices_reverse(array, pixel_pos)
  
  ;通过case判断dims_value的取值，dims_values的取值为1~8和-1，但实际中不存在取值-1的情况
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
  
    ;二维数组
    ;初始化indices_check，直接赋值，dims_checked和indices_check拥有一样的元素个数
    indices_check = dims_checked
    
    FOR i = 0L, N_ELEMENTS(dims_checked)-1 DO BEGIN
      indices_check[i] = dims_case(pixel_pos, dims_checked[i], array)
    ENDFOR
    
  ENDIF ELSE BEGIN
  
    ;一维数组
    ;初始化indices_check
    indices_check = dims_checked
    
    ;将像素坐标转换为索引值
    pixel_index = array_indices_reverse(array, pixel_pos)
    
    ;获取一维数组可扩展位置的个数，最大为左右两个位置，tmp取值为0，1，2；但实际中取值不可能为0
    tmp = SIZE(dims_checked, /DIMENSIONS)
    
    ;使用case判断
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