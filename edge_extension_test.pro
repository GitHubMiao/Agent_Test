PRO edge_extension_test, array = array

  ;读取影像获取数据
  COMPILE_OPT IDL2, Hidden
  ENVI, /Restore_base_save_files
  ENVI_BATCH_INIT
  
  file = 'C:\Classification_to_Tiff_subset.img'
  
  ENVI_OPEN_FILE, file, r_fid = fid
  
  ENVI_FILE_QUERY, fid, DIMS = dims, NB = nb, NS = ns, NL = nl, $
    DATA_TYPE = data_type, INTERLEAVE = interleave, OFFSET = offset, $
    FILE_TYPE = file_type, NUM_CLASSES = num_classes, $
    CLASS_NAMES = class_names, LOOKUP = lookup
    
  map_info = ENVI_GET_MAP_INFO(fid = fid)
  
  Data = ENVI_GET_DATA(fid = fid, dims = dims, pos = 0)
  HELP, Data
  
  ;扩展测试，按摩尔型扩展一步
  ;重点在于边缘地区的判别
  
  ;扩展一步外围，摩尔型，最多共8个像素，最少3个像素，tmp用于储存这些值
  tmp_A = []
  
  image_dims = SIZE(Data, /DIMENSIONS)
  
  FOR r = 0L, image_dims[1]-1 DO BEGIN
  
    FOR c = 0L, image_dims[0]-1 DO BEGIN
      ;------------------------------------------
    
      ;按像素循环，获取位置信息，检测可扩展位置并输出元素索引
      check_extension_test, [c,r], image_dims, dims_check = dims_check, /check
      check_indices_test, [c,r], Data, dims_check, indices_check = indices_check, /T2D
      
      ;将扩展元素的值和[c,r]位置的像素值赋给tmp_A
      tmp_A = [Data[indices_check], Data[c,r]]
      
      ;获取tmp_A的直方图数据
      ht = HISTOGRAM(tmp_A, OMIN=omin, OMAX=omax)
      
      ;设置临时像素值变量，用于存放不同种类的像素值
      tmp_diff = []
      
      ;求取tmp_A的众数
      tmp_Mode = cal_mode(tmp_A)
      
      ;开始判断，注意这里是没有带决策树规则的判断，有决策树判断的情况需要采用波普分块方式，后面再测试
      ;规则01：如果直方图的omin和omax相等，说明tmp_A的元素都是相同的值
      IF (omin EQ omax) THEN BEGIN
        CONTINUE
      ENDIF ELSE BEGIN
      
      
      ENDELSE
      
      
      
    ;------------------------------------------
    ENDFOR
    
  ENDFOR
  
  
  
  
  ENVI_BATCH_EXIT
  
END