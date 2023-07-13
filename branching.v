module branch(
    input clk,
    input [7:0] pc,
    input [7:0] address,
    input branch_ctrl,
    input[31:0] result,
    input[5:0] opcode,
    input[15:0] imm,
    input[4:0] reg0,
    output reg[7:0] new_pc
);
wire[31:0] write_data;
wire[4:0] write_reg;
wire[31:0] read_data1;
wire[31:0] read_data2;

register_veda reg_veda(
    .read_reg_num1(reg0),
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

always @(posedge clk)
begin
    if(branch_ctrl) begin:loop1
    case(opcode)
    6'b001110:begin
    if(result==0) begin:loop2
    new_pc=pc+1;
    end
    else begin:loop3
    new_pc=pc+1-imm;
    end
    end
    6'b001111:begin
    if(result==0) begin:loop4
    new_pc=pc+1;
    end
    else begin:loop5
    new_pc=pc+1+imm;
    end
    end
    6'b010000:begin
    if(result==0) begin:loop6
    new_pc=pc+1+imm;
    end
    else begin:loop7
    new_pc=pc+1;
    end
    end
    6'b010001:begin
    if(result==0) begin:loop8
    new_pc=pc+1+imm;
    end
    else begin:loop9
    new_pc=pc+1;
    end
    end
    6'b010010:begin
     if(result== 1) begin:loop13
    new_pc=pc+1+imm;
    end
    else begin:loop14
    new_pc=pc+1;
    end
    end
    6'b010011:begin
    if(result==1) begin:loop10
    new_pc=pc+1+imm;
    end
    else begin:loop11
    new_pc=pc+1;
    end
    end
    6'b010100:begin
    new_pc=address;
    end
    6'b010101:begin
    new_pc=read_data1;
    end
    6'b010110:begin
    new_pc=pc+1;
    new_pc=address;
    end
    default:new_pc=pc+1;
    endcase
    end
    else begin:loop12
       new_pc = pc+1;
    end
end

endmodule
