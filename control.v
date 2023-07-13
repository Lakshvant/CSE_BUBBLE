module control(opcode,alu_control,regwrite_ctrl,brnch_ctrl,imm_ctrl,lw_ctrl,sw_ctrl);
input[5:0] opcode;
output reg[2:0] alu_control;
output reg regwrite_ctrl;
output reg brnch_ctrl;
output reg imm_ctrl;
output reg lw_ctrl;
output reg sw_ctrl;


parameter Add=6'b000000;
parameter sub=6'b000001;
parameter addu=6'b000010;
parameter subu=6'b000011;
parameter addi=6'b000100;
parameter addiu=6'b000101;
parameter And=6'b000110;
parameter OR=6'b000111;
parameter andi=6'b001000;
parameter ori=6'b001001;
parameter sll=6'b001010;
parameter srl=6'b001011;
parameter lw=6'b001100;
parameter sw=6'b001101;
parameter beq=6'b001110;
parameter bne=6'b001111;
parameter bgt=6'b010000;
parameter bgte=6'b010001;
parameter ble=6'b010010;
parameter bleq=6'b010011;
parameter j=6'b010100;
parameter jr=6'b010101;
parameter jal=6'b010110;
parameter slt=6'b010111;
parameter slti=6'b011000;

always@(opcode) begin
case(opcode)
  Add: begin
    alu_control = 3'b000;
    regwrite_ctrl = 1'b1;
    brnch_ctrl = 1'b0;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  
  end
  sub:begin 
    alu_control=3'b001;
    regwrite_ctrl=1'b1;
    brnch_ctrl=1'b0;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  
  end
  addu:begin
    alu_control=3'b000;
    regwrite_ctrl=1'b1;
    brnch_ctrl=1'b0;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  
  end
  subu:begin
    alu_control=3'b001;
    regwrite_ctrl=1'b1;
    brnch_ctrl=1'b0;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  
  end
  addi:begin
    alu_control = 3'b000;
    regwrite_ctrl = 1'b1;
    brnch_ctrl = 1'b0;
    imm_ctrl=1'b1;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  
  end
  addiu:begin
    alu_control = 3'b000;
    regwrite_ctrl = 1'b1;
    brnch_ctrl = 1'b0;
    imm_ctrl=1'b1;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  
  end
  And:begin
    alu_control=3'b010;
    regwrite_ctrl=1'b1;
    brnch_ctrl=1'b0;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  
  end
  OR:begin
    alu_control = 3'b011;
    regwrite_ctrl = 1'b1;
    brnch_ctrl = 1'b0;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  
  end
  andi:begin
    alu_control = 3'b010;
    regwrite_ctrl = 1'b1;
    brnch_ctrl = 1'b0;
    imm_ctrl=1'b1;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  
  end
  ori:begin
    alu_control = 3'b011;
    regwrite_ctrl = 1'b1;
    brnch_ctrl = 1'b0;
    imm_ctrl=1'b1;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  
  end
  sll:begin
    alu_control = 3'b110;
    regwrite_ctrl = 1'b1;
    brnch_ctrl = 1'b0;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  
  end
  srl:begin
    alu_control = 3'b111;
    regwrite_ctrl = 1'b1;
    brnch_ctrl = 1'b0;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  
  end
  lw:begin
    alu_control=3'b0;
    regwrite_ctrl=1'b1;
    brnch_ctrl=1'b0;
    imm_ctrl=1'b0;
    lw_ctrl=1'b1;
    sw_ctrl=1'b0;
  end
  sw:begin
    alu_control=3'b0;
    regwrite_ctrl=1'b1;
    brnch_ctrl=1'b0;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b1;
  end
  beq:begin
    alu_control=3'b001;
    regwrite_ctrl=1'b0;
    brnch_ctrl=1'b1;
    imm_ctrl=1'b1;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  end
  bne:begin
    alu_control=3'b001;
    regwrite_ctrl=1'b0;
    brnch_ctrl=1'b1;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  end
  bgt:begin
    alu_control=3'b001;
    regwrite_ctrl=1'b0;
    brnch_ctrl=1'b1;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  end
  bgte:begin
    alu_control=3'b101;
    regwrite_ctrl=1'b0;
    brnch_ctrl=1'b1;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  end
  ble:begin
    alu_control=3'b100;
    regwrite_ctrl=1'b0;
    brnch_ctrl=1'b1;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  end
  bleq:begin
    alu_control=3'b101;
    regwrite_ctrl=1'b0;
    brnch_ctrl=1'b1;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  end
  j:begin
    alu_control=3'bx;
    regwrite_ctrl=1'b0;
    brnch_ctrl=1'b1;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  end
  jr:begin
    alu_control=3'bx;
    regwrite_ctrl=1'b0;
    brnch_ctrl=1'b1;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  end
  jal:begin
    alu_control=3'bx;
    regwrite_ctrl=1'b0;
    brnch_ctrl=1'b1;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  end
  slt:begin
    alu_control=3'b101;
    regwrite_ctrl=1'b1;
    brnch_ctrl=1'b1;
    imm_ctrl=1'b0;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  end
  slti:begin
    alu_control=3'b101;
    regwrite_ctrl=1'b1;
    brnch_ctrl=1'b0;
    imm_ctrl=1'b1;
    lw_ctrl=1'b0;
    sw_ctrl=1'b0;
  end
  endcase
end

  
endmodule