; 函数名:
;   array_indices_reverse
;
; 说明:
;   输入一个数组和多维下标，返回其一维下标索引
;   可以看作是Array_indices的反函数
;
;
; 调用方法
;   Result = array_indices_reverse (Array, Index)
;
;
; 返回值
;   返回索引下标数组对应的一维下标值
;
;
; 调用示例:
;
;IDL> arr = indgen(7,8,4,5)
;IDL> print,arr[2,3]
;      23
;IDL> print,array_indices_reverse(arr,[2,3])
;          23
;IDL> print,arr[5,3,2]
;     138
;IDL> print,array_indices_reverse(arr,[5,3,2])
;         138
;
;
; 版本历史:
;   Written by: DYQ 2011年10月29日
;-
 
function array_indices_reverse, array, indexArr, DIMENSIONS=dimensions
 
    compile_opt idl2
 
    ON_ERROR, 2
 
    ;错误检测
   
    if (N_PARAMS() ne 2) then $
        MESSAGE, 'Incorrect number of arguments.'
    ;数组的下标
    arrDims = size(array,/dimen)
    ;下标个数   
    idxNum  = N_Elements(indexArr)
   if idxNum GT 1 then return,long(indexArr[idxNum-1]*product(arrDims[0:idxNum-2])+array_indices_reverse(array,indexArr[0:idxNum-2])) $
   else return,indexArr
 
end