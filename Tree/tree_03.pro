;通过决策树判断分类类型，因无法解析ENVI的决策树，程序中只能通过大量if-else的组合重新实现
;根据生成决策树地规则，每次输入单一像素点像素值，共输入3个波段，即三个数值，以b1,b2,b3表示
;class为分类类型代码，以整型表示，初始值设为0，通过决策树后给class重新赋值
;分类类型 数值：Soil=1; Vegetation=2; Water=3; IS=4(Imperious Surface)
;获取3，4，9波段

FUNCTION tree_03, band

  ;初始化class的值为0
  class = 0
  
  IF (N_ELEMENTS(band) EQ 9) THEN BEGIN
    b1 = band[2]
    b2 = band[3]
    b3 = band[8]
  ENDIF
  
  ;节点序号命名不按照决策树规则中的序号来
  ;自定义命名方式：某行-序数（从左至右，对照决策树图），从每行第一个分叉的开始计数
  
  ;*********************************************************************************
  ;#节点1-1
  IF (b1 LE 252.4) THEN BEGIN
  
    ;##节点2-2
    IF (b3 LE 192.0) THEN BEGIN
      ;Water
      class = 3
    ENDIF ELSE BEGIN
    
      ;###节点3-2
      IF (b2 LE 311.1) THEN BEGIN
      
        ;####节点4-3
        IF (b1 LE 46.15) THEN BEGIN
          ;IS
          class = 4
        ENDIF ELSE BEGIN
        
          ;#####节点5-3
          IF (b2 LE -1287.0) THEN BEGIN
            ;Soil
            class = 1
          ENDIF ELSE BEGIN
          
            ;######节点6-4
            IF (b1 LE 228.8) THEN BEGIN
              ;IS
              class = 4
            ENDIF ELSE BEGIN
              ;Soil
              class = 1
            ENDELSE
            
          ENDELSE
          
        ENDELSE
        
      ENDIF ELSE BEGIN
        ;Water
        class = 3
      ENDELSE
      
    ENDELSE
    
  ENDIF ELSE BEGIN
  
    ;##节点2-1
    IF (b3 LE 1191.0) THEN BEGIN
      ;Vegetation
      class = 2
    ENDIF ELSE BEGIN
    
      ;###节点3-1
      IF (b1 LE 477.8) THEN BEGIN
      
        ;####节点4-2
        IF (b2 LE -580.4) THEN BEGIN
        
          ;#####节点5-2
          IF (b3 LE 2704.0) THEN BEGIN
          
            ;######节点6-3
            IF (b2 LE -1015.0) THEN BEGIN
              ;Soil
              class = 1
            ENDIF ELSE BEGIN
            
              ;#######节点7-1
              IF (b1 LE 362.4) THEN BEGIN
                ;IS
                class = 4
              ENDIF ELSE BEGIN
                ;Soil
                class = 1
              ENDELSE
              
            ENDELSE
            
          ENDIF ELSE BEGIN
          
            ;######节点6-2
            IF (b2 LE -1693.0) THEN BEGIN
              ;IS
              class = 4
            ENDIF ELSE BEGIN
              ;Soil
              class = 1
            ENDELSE
            
          ENDELSE
          
        ENDIF ELSE BEGIN
          ;IS
          class = 4
        ENDELSE
        
      ENDIF ELSE BEGIN
      
        ;####节点4-1
        IF (b3 LE 2147.0) THEN BEGIN
        
          ;#####节点5-1
          IF (b2 LE -555.6) THEN BEGIN
            ;Soil
            class = 1
          ENDIF ELSE BEGIN
          
            ;######节点6-1
            IF (b1 LE 584.7) THEN BEGIN
              ;Soil
              class = 1
            ENDIF ELSE BEGIN
              ;IS
              class = 4
            ENDELSE
            
          ENDELSE
          
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