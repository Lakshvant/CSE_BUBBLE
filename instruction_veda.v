module instruction_veda(clk, reset, mode, address, write_data, read_data, write_enable);

input clk, reset, mode, write_enable;
input [7:0] address;
input [31:0] write_data;
output reg [31:0] read_data;

reg [31:0] mem[255:0];
initial begin
mem[0]={6'b001100,5'd0,21'd0};
mem[1]={6'b000100,5'd31,5'd8,16'd0};
mem[2]={6'b000100,5'd31,5'd9,16'd0};
mem[3]={6'b000100,5'd31,5'd1,16'd11};
mem[4]={6'b000100,5'd31,5'd2,16'd11};
mem[5]={6'b000000,5'd31,5'd0,5'd10,11'd0};
mem[6]={6'b000000,5'd31,5'd0,5'd11,11'd0};
mem[7]={6'b000001,5'd30,5'd1,5'd1,5'd0,6'd0};
mem[8]={6'b000100,5'd31,5'd9,16'd0};  //outer loop
mem[9]={6'b000001,5'd30,5'd2,5'd2,5'd0,6'd0};
mem[10]={6'b000000,5'd31,5'd0,5'd11,11'd0};
mem[11]={6'b001100,5'd3,5'd11,16'd0}; //inner loop
mem[12]={6'b000100,5'd11,5'd11,16'd1};
mem[13]={6'b001100,5'd4,5'd11,16'd0};
mem[14]={6'b000100,5'd11,5'd11,16'd1};
mem[15]={6'b010111,5'd3,5'd4,5'd12,16'd0};                                     
mem[16]={6'b001111,5'd12,5'd31,16'd4};
mem[17]={6'b001100,5'd11,5'd3,16'b0};
mem[18]={6'b000001,5'd30,5'd11,5'd11,5'd0,6'd0};
mem[19]={6'b001100,5'd11,5'd4,16'b0};
mem[20]={6'b001100,5'd4,5'd11,16'b0};
mem[21]={6'b001110,5'd9,5'd2,16'd11};
mem[22]={6'b000100,5'd0,5'd0,16'd1};
mem[23]={6'b001110,5'd9,5'd1,16'd16};
mem[24]={6'b000100,5'd31,5'd8,16'b0};
mem[25]={6'b000100,5'd1,5'd1,16'd1};
mem[26]={6'b000100,5'd31,5'd17,16'd2};
mem[27]={6'b000100,5'd31,5'd18,16'd3};
mem[28]={6'b000100,5'd31,5'd19,16'd4};
mem[29]={6'b000100,5'd31,5'd20,16'd5};
mem[30]={6'b000100,5'd31,5'd21,16'd6};
mem[31]={6'b000100,5'd31,5'd22,16'd7};
mem[32]={6'b000100,5'd31,5'd23,16'd8};
mem[33]={6'b000100,5'd31,5'd24,16'd9};
mem[34]={6'b000100,5'd31,5'd25,16'd10};
mem[35]={6'b000100,5'd31,5'd26,16'd11};
end
always @(posedge clk or posedge reset) begin
  if (reset) begin
    read_data <= 0;
  end 
  else if (mode == 0) begin
    if (write_enable) begin
      mem[address] <= write_data;
      read_data <= write_data;
    end
  end
  else begin
    read_data <= mem[address];
  end
end

endmodule