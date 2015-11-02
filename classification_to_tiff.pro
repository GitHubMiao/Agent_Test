;������ͼ��ת��ΪTIFF��ʽ
;�������������������Ϣ����˽���ȡ������ֵ��ͼ��������ֵ����ĵ������ͣ����Ǻ󻰡�

PRO Classification_to_Tiff

  COMPILE_OPT IDL2, Hidden
  ENVI, /Restore_base_save_files
  ENVI_BATCH_INIT
  
  fn = DIALOG_PICKFILE(TITLE = 'Classified File', GET_PATH = work_dir)
  ;CD, work_dir
  
  ENVI_OPEN_FILE, fn, r_fid = fid
  
  ENVI_FILE_QUERY, fid, DIMS = dims, NB = nb, NS = ns, NL = nl, $
    DATA_TYPE = data_type, INTERLEAVE = interleave, OFFSET = offset, $
    FILE_TYPE = file_type, NUM_CLASSES = num_classes, $
    CLASS_NAMES = class_names, LOOKUP = lookup
    
  map_info = ENVI_GET_MAP_INFO(fid = fid)
  
  ;��ȡ��ֵ
  Class_data = ENVI_GET_DATA(fid = fid, dims = dims, pos = 0)
  HELP, Class_data
  PRINT, Class_data[0:5,0:5]
  
  ;д��ENVI�ļ�
  bnames = 'Class'
  ENVI_ENTER_DATA, Class_data, BNAMES = bnames, FILE_TYPE = 0, $
    MAP_INFO = map_info, R_fid = Class_r_fid
    
  ;д��Tiff�ļ�
  ENVI_FILE_QUERY, Class_r_fid, dims = dims, nb = nb, Bnames = bnames
  
  Tiff_out_name = 'C:\Classification_to_Tiff.tif'
  
  pos = LINDGEN(nb)
  
  ENVI_OUTPUT_TO_EXTERNAL_FORMAT, Fid = Class_r_fid, Dims = dims, Pos = pos, Out_bname = bnames, $
    Out_name = Tiff_out_name, /Tiff
    
  ;�����ڴ��е���ʱ�ļ�
  ENVI_FILE_MNG, id = Class_r_fid, /remove
  ENVI_FILE_MNG, id = fid, /remove
  
  ENVI_BATCH_EXIT
  
END