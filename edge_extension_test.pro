PRO edge_extension_test, array = array

  ;��ȡӰ���ȡ����
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
  
  ;��չ���ԣ���Ħ������չһ��
  ;�ص����ڱ�Ե�������б�
  
  ;��չһ����Χ��Ħ���ͣ���๲8�����أ�����3�����أ�tmp���ڴ�����Щֵ
  tmp_A = []
  
  image_dims = SIZE(Data, /DIMENSIONS)
  
  FOR r = 0L, image_dims[1]-1 DO BEGIN
  
    FOR c = 0L, image_dims[0]-1 DO BEGIN
      ;------------------------------------------
    
      ;������ѭ������ȡλ����Ϣ��������չλ�ò����Ԫ������
      check_extension_test, [c,r], image_dims, dims_check = dims_check, /check
      check_indices_test, [c,r], Data, dims_check, indices_check = indices_check, /T2D
      
      ;����չԪ�ص�ֵ��[c,r]λ�õ�����ֵ����tmp_A
      tmp_A = [Data[indices_check], Data[c,r]]
      
      ;��ȡtmp_A��ֱ��ͼ����
      ht = HISTOGRAM(tmp_A, OMIN=omin, OMAX=omax)
      
      ;������ʱ����ֵ���������ڴ�Ų�ͬ���������ֵ
      tmp_diff = []
      
      ;��ȡtmp_A������
      tmp_Mode = cal_mode(tmp_A)
      
      ;��ʼ�жϣ�ע��������û�д�������������жϣ��о������жϵ������Ҫ���ò��շֿ鷽ʽ�������ٲ���
      ;����01�����ֱ��ͼ��omin��omax��ȣ�˵��tmp_A��Ԫ�ض�����ͬ��ֵ
      IF (omin EQ omax) THEN BEGIN
        CONTINUE
      ENDIF ELSE BEGIN
      
      
      ENDELSE
      
      
      
    ;------------------------------------------
    ENDFOR
    
  ENDFOR
  
  
  
  
  ENVI_BATCH_EXIT
  
END