;通过决策树判断分类类型，因无法解析ENVI的决策树，程序中只能通过大量if-else的组合重新实现
;根据生成决策树地规则，每次输入单一像素点像素值，共输入3个波段，即三个数值，以b1,b2,b3表示
;class为分类类型代码，以整型表示，初始值设为0，通过决策树后给class重新赋值
;分类类型 数值：Soil=1; Vegetation=2; Water=3; IS=4(Imperious Surface)
;大决策树，以tree_00来命名，但实际使用特征并不是全部特征，仅仅用了3个
;接收参数为9个元素的向量，代表9个特征，根据生成的决策树，提取其中的b1、b5和b7三个特征（值）

FUNCTION tree_00, band

  ;初始化class的值为0
  class = 0
  
  IF (N_ELEMENTS(band) EQ 9) THEN BEGIN
    b1 = band[0]
    b5 = band[4]
    b7 = band[6]
  ENDIF
  
  ;节点序号命名不按照决策树规则中的序号来
  ;自定义命名方式：某行-序数（从左至右，对照决策树图），从每行第一个分叉的开始计数
  
  ;*********************************************************************************
  ;#节点1-1
  IF (b1 LE 0.2700) THEN BEGIN
  
    ;##节点2-2
    IF (b7 LE 694.3) THEN BEGIN
      ;Water
      class = 3
    ENDIF ELSE BEGIN
    
      ;###节点3-2
      IF (b5 LE 22.02) THEN BEGIN
      
        ;####节点4-1
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
  
    ;##节点2-1
    IF (b1 LE 0.5395) THEN BEGIN
    
      ;###节点3-1
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