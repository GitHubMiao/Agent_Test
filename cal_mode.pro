;计算众数，data为待统计的整数数组（即数组元素的最小间隔为1），程序中会对data类型进行判断
;添加关键字reverse，可以计算出现最少的元素
;改进原始代码的bug部分，如果有多个众数或元素最少的元素，则转换为数组全部输出

FUNCTION CAL_MODE, data, reverse = reverse

  ;获取data的数据类型，确保是整型或类似的元素最小间隔为1的类型，data_type参见size函数帮助
  data_type = SIZE(data, /TYPE)
  
  IF (((data_type GT 0) && (data_type LT 4)) || ((data_type GT 11) && (data_type LE 15))) THEN BEGIN
  
    ht = HISTOGRAM(data, OMIN = omin, LOCATIONS = locations)
    
    in = WHERE(ht NE 0)
    
    IF (KEYWORD_SET(reverse)) THEN BEGIN
      ;计算待统计数组中元素个数最少的元素
      minv = MIN(ht[in], index)
      RETURN, omin+WHERE(ht EQ minv)
    ENDIF ELSE BEGIN
      ;计算众数
      maxv = MAX(ht[in], index)
      RETURN, omin+WHERE(ht EQ maxv)
    ENDELSE
    
  ENDIF ELSE BEGIN
    void = DIALOG_MESSAGE('输入数据类型错误！',/ERROR)
    data=!NULL
    RETURN, data
  ENDELSE
  
END