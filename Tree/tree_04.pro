;通过决策树判断分类类型，因无法解析ENVI的决策树，程序中只能通过大量if-else的组合重新实现
;根据生成决策树地规则，每次输入单一像素点像素值，共输入3个波段，即三个数值，以b1,b2,b3表示
;class为分类类型代码，以整型表示，初始值设为0，通过决策树后给class重新赋值
;分类类型 数值：Soil=1; Vegetation=2; Water=3; IS=4(Imperious Surface)
;获取1，3，4波段

FUNCTION tree_04, band

  ;初始化class的值为0
  class = 0
  
  IF (N_ELEMENTS(band) EQ 9) THEN BEGIN
    b1 = band[0]
    b2 = band[2]
    b3 = band[3]
  ENDIF
  
  ;节点序号命名不按照决策树规则中的序号来
  ;自定义命名方式：某行-序数（从左至右，对照决策树图），从每行第一个分叉的开始计数
  
  ;*********************************************************************************
  ;#节点1-1
  IF (b1 LE 0.2700) THEN BEGIN
  
    ;##节点2-2
    IF (B1 LE 0.2312E-01) THEN BEGIN
    
      ;###节点3-4
      IF (b3 LE -1201.0) THEN BEGIN
        ;IS
        class = 4
      ENDIF ELSE BEGIN
        ;Water
        class = 3
      ENDELSE
      
    ENDIF ELSE BEGIN
    
      ;###节点3-3
      IF (b2 LE 174.4) THEN BEGIN
      
        ;####节点4-3
        IF (b3 LE -1804.0) THEN BEGIN
          ;IS
          class = 4
        ENDIF ELSE BEGIN
        
          ;#####节点5-4
          IF (b3 LE -1600.0) THEN BEGIN
          
            ;######节点6-6
            IF (b2 LE -95.02) THEN BEGIN
              ;IS
              class = 4
            ENDIF ELSE BEGIN
              ;Soil
              class = 1
            ENDELSE
            
          ENDIF ELSE BEGIN
          
            ;######节点6-5
            IF (b3 LE -1080.0) THEN BEGIN
            
              ;#######节点7-3
              IF (b2 LE 57.80) THEN BEGIN
                ;IS
                class = 4
              ENDIF ELSE BEGIN
              
                ;########节点8-4
                IF (b1 LE 0.1789) THEN BEGIN
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
            
          ENDELSE
          
        ENDELSE
        
      ENDIF ELSE BEGIN
      
        ;####节点4-2
        IF (b3 LE -848.5) THEN BEGIN
        
          ;#####节点5-3
          IF (b3 LE -952.8) THEN BEGIN
          
            ;######节点6-4
            IF (b3 LE -988.0) THEN BEGIN
              ;Soil
              class = 1
            ENDIF ELSE BEGIN
              ;IS
              class = 4
            ENDELSE
            
          ENDIF ELSE BEGIN
            ;IS
            class = 4
          ENDELSE
          
        ENDIF ELSE BEGIN
          ;IS
          class = 4
        ENDELSE
        
      ENDELSE
      
    ENDELSE
    
  ENDIF ELSE BEGIN
  
    ;##节点2-1
    IF (b1 LE 0.5395) THEN BEGIN
    
      ;###节点3-2
      IF (b2 LE 236.5) THEN BEGIN
        ;IS
        class = 4
      ENDIF ELSE BEGIN
      
        ;####节点4-1
        IF (b2 LE 483.7) THEN BEGIN
        
          ;#####节点5-2
          IF (b2 LE 302.1) THEN BEGIN
          
            ;######节点6-3
            IF (b2 LE 288.1) THEN BEGIN
              ;IS
              class = 4
            ENDIF ELSE BEGIN
              ;Soil
              class = 1
            ENDELSE
            
          ENDIF ELSE BEGIN
          
            ;######节点6-2
            IF (b1 LE 0.3798) THEN BEGIN
            
              ;#######节点7-2
              IF (b3 LE -707.8) THEN BEGIN
              
                ;########节点8-3
                IF (b3 LE -831.8) THEN BEGIN
                  ;Soil
                  class = 1
                ENDIF ELSE BEGIN
                  ;IS
                  class = 4
                ENDELSE
                
              ENDIF ELSE BEGIN
              
                ;########节点8-2
                IF (b3 LE -584.2) THEN BEGIN
                
                  ;#########节点9-2
                  IF (b2 LE 366.6) THEN BEGIN
                    ;IS
                    class = 4
                  ENDIF ELSE BEGIN
                  
                    ;##########节点10-2
                    IF (b1 LE 0.3280) THEN BEGIN
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
              
            ENDIF ELSE BEGIN
              ;IS
              class = 4
            ENDELSE
            
          ENDELSE
          
        ENDIF ELSE BEGIN
        
          ;#####节点5-1
          IF (b3 LE -408.0) THEN BEGIN
          
            ;######节点6-1
            IF (b3 LE -433.7) THEN BEGIN
            
              ;#######节点7-1
              IF (b3 LE -1605.0) THEN BEGIN
                ;IS
                class = 4
              ENDIF ELSE BEGIN
              
                ;########节点8-1
                IF (b3 LE -842.5) THEN BEGIN
                  ;Soil
                  class = 1
                ENDIF ELSE BEGIN
                
                  ;#########节点9-1
                  IF (b1 LE 0.3810) THEN BEGIN
                    ;Soil
                    class = 1
                  ENDIF ELSE BEGIN
                  
                    ;##########节点10-1
                    IF (b1 LE 0.4256) THEN BEGIN
                      ;IS
                      class = 4
                    ENDIF ELSE BEGIN
                      ;Soil
                      class = 1
                    ENDELSE
                    
                  ENDELSE
                  
                ENDELSE
                
              ENDELSE
              
            ENDIF ELSE BEGIN
              ;IS
              class = 4
            ENDELSE
            
          ENDIF ELSE BEGIN
            ;IS
            class = 4
          ENDELSE
          
        ENDELSE
        
      ENDELSE
      
    ENDIF ELSE BEGIN
    
      ;###节点3-1
      IF (b3 LE -2030.0) THEN BEGIN
        ;IS
        class = 4
      ENDIF ELSE BEGIN
        ;Vegetation
        class = 2
      ENDELSE
      
    ENDELSE
    
  ENDELSE
  
  ;*********************************************************************************
  
  RETURN, class
  
END