// module register_veda(clk, reset, mode, address, write_data, read_data, write_enable);
module register_veda(
    input[4:0] read_reg_num1,
    input[4:0] read_reg_num2,
    input[4:0] write_reg,
    input[31:0] write_data,
    output[31:0] read_data1,
    output[31:0] read_data2,
    input write_enable,
    input clock,
    input mode,
    input reset
);


reg [31:0] mem[31:0];
initial begin
mem[0]=17;
mem[1]=0;
mem[2]=0;
mem[3]=0;
mem[4]=0;
mem[5]=0;
mem[6]=0;
mem[7]=0;
mem[8]=0;
mem[9]=0;
mem[10]=0;
mem[11]=0;
mem[12]=0;
mem[13]=0;
mem[14]=0;
mem[15]=0;
mem[16]=0;
mem[17]=16;
mem[18]=4;
mem[19]=2;
mem[20]=3;
mem[21]=10;
mem[22]=9;
mem[23]=11;
mem[24]=8;
mem[25]=7;
mem[26]=6;
mem[27]=1;
mem[28]=0;
mem[29]=1;
mem[30]=11;
mem[31]=0;
end
assign read_data1=mem[read_reg_num1];
assign read_data2=mem[read_reg_num2];

always @(posedge clock)
begin

  if (write_enable) begin:loop1
    mem[write_reg] = write_data;
  end     
end

always @(posedge clock) begin
 // $display("%d",mem[17]);
end
endmodule