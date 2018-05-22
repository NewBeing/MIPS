.data
sortarry:.word 10,9,8,7,6,5,4,3,2,1,0

.text
main:
ADDIU $r3,$r0,10    #array.length - 1
ADDIU $r4,$r0,0     #first loop, i = 0

loop1:
ADDIU $r1,$r0,sortarry    #$r1 = array[j]
ADDIU $r2,$r0,0     	  #second loop, j = 0

loop2:
LW    $r5,0($r1)      #$r5=arry[i] as the temp value
LW    $r6,4($r1)      #$r6=arry[j+1]
DSUB  $r7,$r6,$r5     # $r7=r6-r5
BGTZ  $r7,skip2       # if array[j+1]>arry[j],goto skip2

SW    $r6,0($r1)      #  arry[j]=arry[j+1]
SW    $r5,4($r1)      #  arry[j+1]=temp

skip2:
ADDIU $r1,$r1,4	       
ADDIU $r2,$r2,1        #j=j+1

DSUB  $r9,$r3,$r4      #if j < len-i-1=10-i continue the second loop
DSUB  $r7,$r9,$r2      #r7=(len-i-1)-j
BGTZ  $r7,loop2        #$r7>0 back to loop2

ADDIU $r4,$r4,1        #i+1

ADDIU $r8,$r0,11      
DSUB  $r8,$r8,$r4      #r8=11-i
BGTZ  $r8,loop1        #r8>0,i<11,continue
TEQ   $r0,$r0
