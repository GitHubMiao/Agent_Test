; ������:
;   array_indices_reverse
;
; ˵��:
;   ����һ������Ͷ�ά�±꣬������һά�±�����
;   ���Կ�����Array_indices�ķ�����
;
;
; ���÷���
;   Result = array_indices_reverse (Array, Index)
;
;
; ����ֵ
;   ���������±������Ӧ��һά�±�ֵ
;
;
; ����ʾ��:
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
; �汾��ʷ:
;   Written by: DYQ 2011��10��29��
;-
 
function array_indices_reverse, array, indexArr, DIMENSIONS=dimensions
 
    compile_opt idl2
 
    ON_ERROR, 2
 
    ;������
   
    if (N_PARAMS() ne 2) then $
        MESSAGE, 'Incorrect number of arguments.'
    ;������±�
    arrDims = size(array,/dimen)
    ;�±����   
    idxNum  = N_Elements(indexArr)
   if idxNum GT 1 then return,long(indexArr[idxNum-1]*product(arrDims[0:idxNum-2])+array_indices_reverse(array,indexArr[0:idxNum-2])) $
   else return,indexArr
 
end