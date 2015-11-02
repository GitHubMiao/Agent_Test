;将分类图像转换为TIFF格式
;因计算过程中无需分类信息，因此仅获取仅有数值的图像，至于数值代表的地类类型，则是后话。

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
  
  ;获取数值
  Class_data = ENVI_GET_DATA(fid = fid, dims = dims, pos = 0)
  HELP, Class_data
  PRINT, Class_data[0:5,0:5]
  
  ;写入ENVI文件
  bnames = 'Class'
  ENVI_ENTER_DATA, Class_data, BNAMES = bnames, FILE_TYPE = 0, $
    MAP_INFO = map_info, R_fid = Class_r_fid
    
  ;写入Tiff文件
  ENVI_FILE_QUERY, Class_r_fid, dims = dims, nb = nb, Bnames = bnames
  
  Tiff_out_name = 'C:\Classification_to_Tiff.tif'
  
  pos = LINDGEN(nb)
  
  ENVI_OUTPUT_TO_EXTERNAL_FORMAT, Fid = Class_r_fid, Dims = dims, Pos = pos, Out_bname = bnames, $
    Out_name = Tiff_out_name, /Tiff
    
  ;清理内存中的临时文件
  ENVI_FILE_MNG, id = Class_r_fid, /remove
  ENVI_FILE_MNG, id = fid, /remove
  
  ENVI_BATCH_EXIT
  
END