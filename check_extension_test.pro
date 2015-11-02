;获取图像上像素点的图像坐标，检测摩尔型扩展一个像素后的状况
;坐标形式不允许采用负数标识
;将可扩展位置以索引值形式输出
;一维扩展只有临近位置，坐标上是+1或-1
;二维扩展形式及索引值如下图所示
;
;    1————2————3
;    |    |    |
;    |    |    |
;    8————P————4
;    |    |    |
;    |    |    |
;    7————6————5
;
;仅用于检测一维或二维扩展

;pixel_pos是下标法表示的矩阵元素的位置，如[1]或[2,3]
;array_dims是矩阵大小信息，一维矩阵其大小刚好等于其维度，二维矩阵这是其列和行的值
;参数获取上，array_dims可以通过size函数配合关键字Dimensions获取,输入方式类似于pixel_pos

PRO check_extension_test, pixel_pos, array_dims, dims_check = dims_check, check = check
    
  ;piexl_pos表示像素的位置，dim_pixel表示位置参数的维度，因此仅有两个取值1和2
  dim_pixel = SIZE(pixel_pos, /DIMENSIONS)
  
  ;array_dims表示矩阵大小信息，dim_array表示位置参数的维度，因此仅有两个取值1和2
  dim_array = SIZE(array_dims, /DIMENSIONS)
  
  ;一维扩展
  IF ((dim_pixel EQ 1) && (dim_array EQ 1)) THEN BEGIN
  
    ;初始化dims_check
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
  
    ;二维扩展
    IF ((dim_pixel EQ 2) && (dim_array EQ 2)) THEN BEGIN
    
      ;初始化dims_check
      dims_check = [-1,-1,-1,-1,-1,-1,-1,-1]
      
      ;首先确定奇数位，为9个像素的构成正方形的四个角位置
      ;1号位，y方向移动
      IF (((pixel_pos[0]-1) GE 0) && (pixel_pos[0] LE (array_dims[0]-1))) THEN BEGIN
      
        ;1号位，x方向移动
        IF (((pixel_pos[1]-1) GE 0) && (pixel_pos[1] LE (array_dims[1]-1))) THEN BEGIN
          dims_check[0] = 1
        ENDIF
        
      ENDIF
      
      ;3号位，y方向移动
      IF (((pixel_pos[0]+1) LE (array_dims[0]-1)) && (pixel_pos[0] GE 0)) THEN BEGIN
      
        ;3号位，x方向移动
        IF (((pixel_pos[1]-1) GE 0) && (pixel_pos[1] LE (array_dims[1]-1))) THEN BEGIN
          dims_check[2] = 3
        ENDIF
        
      ENDIF
      
      ;5号位，x方向移动
      IF (((pixel_pos[0]+1) LE (array_dims[0]-1)) && (pixel_pos[0] GE 0)) THEN BEGIN
      
        ;5号位，y方向移动
        IF (((pixel_pos[1]+1) LE (array_dims[1]-1)) && (pixel_pos[1] GE 0)) THEN BEGIN
          dims_check[4] = 5
        ENDIF
        
      ENDIF
      
      ;7号位，x方向移动
      IF (((pixel_pos[0]-1) GE 0) && (pixel_pos[0] LE (array_dims[0]-1))) THEN BEGIN
      
        ;7号位，y方向移动
        IF (((pixel_pos[1]+1) LE (array_dims[1]-1)) && (pixel_pos[1] GE 0)) THEN BEGIN
          dims_check[6] = 7
        ENDIF
        
      ENDIF
      
      ;再确定偶数位，见函数说明
      ;2号位，x方向移动
      IF ((pixel_pos[0] GE 0) && (pixel_pos[0] LE (array_dims[0]-1))) THEN BEGIN
      
        ;2号位，x方向移动
        IF (((pixel_pos[1]-1) GE 0) && (pixel_pos[1] LE (array_dims[1]-1))) THEN BEGIN
          dims_check[1] = 2
        ENDIF
        
      ENDIF
      
      ;4号位，x方向移动
      IF (((pixel_pos[0]+1) LE (array_dims[0]-1)) && (pixel_pos[0] GE 0)) THEN BEGIN
      
        ;4号位，x方向移动
        IF ((pixel_pos[1] GE 0) && (pixel_pos[1] LE (array_dims[1]-1))) THEN BEGIN
          dims_check[3] = 4
        ENDIF
        
      ENDIF
      
      ;6号位，x方向移动
      IF ((pixel_pos[0] GE 0) && (pixel_pos[0] LE (array_dims[0]-1))) THEN BEGIN
      
        ;6号位，x方向移动
        IF (((pixel_pos[1]+1) LE (array_dims[1]-1)) && (pixel_pos[1] GE 0)) THEN BEGIN
          dims_check[5] = 6
        ENDIF
        
      ENDIF
      
      ;8号位，x方向移动
      IF ((pixel_pos[0]-1 GE 0) && (pixel_pos[0] LE (array_dims[0]-1))) THEN BEGIN
      
        ;8号位，x方向移动
        IF ((pixel_pos[1] GE 0) && (pixel_pos[1] LE (array_dims[1]-1))) THEN BEGIN
          dims_check[7] = 8
        ENDIF
        
      ENDIF
      
      IF (KEYWORD_SET(check)) THEN BEGIN
        tmp = WHERE(dims_check NE -1, count, /NULL)
        dims_check = dims_check[tmp]
      ENDIF
      
    ENDIF ELSE BEGIN
      void = DIALOG_MESSAGE('参数输入有误！',/ERROR)
    ENDELSE
    
  ENDELSE
  
END