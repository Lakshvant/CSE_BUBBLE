module lw_sw( 
 input clk,
 input[4:0] read_reg1,
 input[4:0] read_reg2,
 input lw_ctrl,
 input sw_ctrl
);

reg[31:0] read_data1,read_data2,result;

register_veda reg_file(
    read_reg_num1,
    read_reg_num2,
    write_reg,
    result,
    read_data1,
    read_data2,
    write_enable,
    clock,
    mode,
    reset
    );


always@(posedge clk) begin
if(lw_ctrl)