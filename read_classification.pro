PRO Read_Classification, file_id = file_id, map_info = map_info, Class_data = Class_data
  COMPILE_OPT IDL2, Hidden
  ;ENVI, /Restore_base_save_files
  ;ENVI_BATCH_INIT
  
  fn = DIALOG_PICKFILE(TITLE = 'Classified File', GET_PATH = work_dir)  
  ;CD, work_dir
  
  ENVI_OPEN_FILE, fn, r_fid = fid
  
  ENVI_FILE_QUERY, fid, DIMS = dims, NB = nb, NS = ns, NL = nl, $
    DATA_TYPE = data_type, INTERLEAVE = interleave, OFFSET = offset, $
    FILE_TYPE = file_type, NUM_CLASSES = num_classes, $
    CLASS_NAMES = class_names, LOOKUP = lookup
    
  map_info = ENVI_GET_MAP_INFO(fid = fid)
  
  Class_data = ENVI_GET_DATA(fid = fid, dims = dims, pos = 0)
  ;HELP, Class_data
  
  file_id = fid
  
  ;ENVI_BATCH_EXIT
END