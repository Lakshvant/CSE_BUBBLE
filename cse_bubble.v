module cse_bubble(
input clk,
input reset

);


reg[7:0] program_counter;
wire[31:0] instruction;
reg[7:0] new_pc;
reg[31:0] sp;
initial begin
program_counter=8'b0;
end

instruction_veda uut1(
         .clk(clk),
         .reset(reset),
         .mode(1'b1),
         .address(program_counter),
         .write_data(32'b0),
         .read_data(instruction),
         .write_enable(1'b0)
      );

always@(posedge clk,posedge reset) begin
   
   if(reset) begin
     program_counter=8'b0;
 
   end
   else begin
      assign program_counter=new_pc;
   end
end

wire[2:0] aluctrl;
wire regwrite_ctrl;
wire brnch_ctrl;
wire imm_ctrl;
wire lw_ctrl;
wire sw_ctrl;
control cntrl(instruction[31:26],aluctrl,regwrite_ctrl,brnch_ctrl,imm_ctrl,lw_ctrl,sw_ctrl);

wire mode;
wire[15:0] imm_wire;
wire[31:0] result;
datapath dp1(
.read_reg_num1(instruction[25:21]),
.read_reg_num2(instruction[20:16]),
.write_reg(instruction[15:11]),
.alu_control(aluctrl),
.write_enable(regwrite_ctrl),
.clock(clk),
.reset(reset),
.mode(1'b0),
.lw_ctrl(lw_ctrl),
.sw_ctrl(sw_ctrl),
.imm_ctrl(imm_ctrl),
.immediate(instruction[15:0]),
.result(result)
);


// branch branching(
//     .clk(clk),
//     .pc(program_counter),
//     .address(instruction[7:0]),
//     .branch_ctrl(brnch_ctrl),
//     .result(result),
//     .opcode(instruction[31:26]),
//     .imm(instruction[15:0]),
//     .reg0(instruction[25:21]),
//     .new_pc(new_pc)
// );


wire[31:0] write_data;
wire[4:0] write_reg;
wire[31:0] read_data1;
wire[31:0] read_data2;

register_veda reg_veda(
    .read_reg_num1(instruction[25:21]),
    .read_reg_num2(5'b0),
    .write_data(write_data),
    .write_reg(write_reg),
    .read_data1(read_data1),
    .read_data2(read_data2),
    .write_enable(1'b0),
    .clock(clk),
    .mode(1'b1),
    .reset(1'b0)
);

always @(clk) begin
   if(clk) begin:loop0
    if(brnch_ctrl) begin:loop1
    case(instruction[31:26])
    6'b001110:begin
    if(result==0) begin:loop2
    new_pc=program_counter+1+instruction[15:0];
    end
    else begin:loop3
    new_pc=program_counter+1;
    end
    end
    6'b001111:begin
    if(result==0) begin:loop4
    new_pc=program_counter+1;
    end
    else begin:loop5
    new_pc=program_counter+1+instruction[15:0];
    end
    end
    6'b01000:begin
    if(result==0) begin:loop6
    new_pc=program_counter+1+instruction[15:0];
    end
    else begin:loop7
    new_pc=program_counter+instruction[15:0];
    end
    end
    6'b010001:begin
    if(result==0) begin:loop8
    new_pc=program_counter+1+instruction[15:0];
    end
    else begin:loop9
    new_pc=program_counter+1;
    end
    end
    6'b010010:begin
     if(result== 1) begin:loop13
    new_pc=program_counter+1+instruction[15:0];
    end
    else begin:loop14
    new_pc=program_counter+1;
    end
    end
    6'b010011:begin
    if(result==1) begin:loop10
    new_pc=program_counter+1+instruction[15:0];
    end
    else begin:loop11
    new_pc=program_counter+1;
    end
    end
    6'b010100:begin
    new_pc=instruction[7:0];
    end
    6'b010101:begin
    new_pc=read_data1;
    end
    6'b010110:begin
    new_pc=program_counter+1;
    new_pc=instruction[7:0];
    end
    default:new_pc=program_counter+1;
    endcase
    end
    else begin:loop12
       new_pc = program_counter+1;
    end
    end
end

endmodule

  



