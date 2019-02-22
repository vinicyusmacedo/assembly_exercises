.section .data
data_items:                       #These are the data items
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0
.section .text
.globl _start
_start:
movl $0, %edi             # move 0 into the index register
movl data_items(,%edi,4), %eax # load the first byte of data
movl %eax, %ebx           # since this is the first item, %eax is
# the biggest
start_loop:                   # start loop
cmpl $0, %eax             # check to see if weve hit the end
je loop_exit
incl %edi                 # load next value
movl data_items(,%edi,4), %eax
cmpl %ebx, %eax           # compare values
jle start_loop            # jump to loop beginning if the new
# one isnt bigger
movl %eax, %ebx           # move the value as the largest
jmp start_loop            # jump to loop beginning
loop_exit:
# %ebx is the status code for the exit system call
# and it already has the maximum number
movl $1, %eax             #1 is the exit() syscall
int  $0x80
