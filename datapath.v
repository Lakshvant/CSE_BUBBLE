
module datapath(
    input[4:0] read_reg_num1,
    input[4:0] read_reg_num2,
    input[4:0] write_reg,
    input[2:0] alu_control,
    input write_enable,
    input clock,
    input reset,
    input mode,
    input [15:0] immediate,
    input imm_ctrl,
    input lw_ctrl,
    input sw_ctrl,
    output[31:0] result
);

    // Declaring internal wires that carry data
    
    wire [31:0]read_data1;
    wire [31:0]read_data2;
        wire[31:0] result2;
    wire[4:0] write_reg1;
    wire[31:0] read_data12;
    wire[31:0] read_data22;
    // Instantiating the register file
   register_veda reg_file_module(
    read_reg_num1,
    read_reg_num2,
    write_reg1,
    result,
    read_data1,
    read_data2,
    write_enable,
    clock,
    mode,
    reset
    );
    reg[31:0] rdata2;
    reg[31:0] rdata1;
    reg[4:0]  reg_write;
    reg[31:0] result1;
    always@(*) begin
    rdata1=read_data1;
    rdata2=read_data2;
    reg_write=write_reg;
    if(imm_ctrl) begin:loop1
    rdata1=immediate;
    rdata2=read_data2;
    end

    if(lw_ctrl) begin:loop3
    reg_write=read_reg_num1;
    rdata1=32'b0;
    rdata2=read_data2;
    end

    if(sw_ctrl) begin:loop5
    reg_write=read_reg_num2;
    rdata1=read_data1;
    rdata2=32'b0;
    end
    
    end

    assign read_data12=rdata1;
    assign read_data22=rdata2;
    assign write_reg1=reg_write;
    // Instanting ALU
    alu alu_module(read_data12,read_data22, alu_control, result);
	
endmodule