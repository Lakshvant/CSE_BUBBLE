module memory_veda(
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
reg [31:0] mem[256:0];
initial begin

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
 
end
endmodule