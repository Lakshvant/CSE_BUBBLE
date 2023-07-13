// Adder module
module adder (
    input [31:0] a, b,
    output [31:0] result
);
assign result = a + b ;
endmodule


// Subtractor module
module subtractor (
    input [31:0] a, b,
    input c_in,

output [31:0] result 
);
assign result = a - b;
endmodule

// AND gate module
module and_gate (
input [31:0] a, b,
output [31:0] result
);
assign result = a & b;
endmodule

// OR gate module
module or_gate (
input [31:0] a, b,
output [31:0] result
);
assign result = a | b;
endmodule

// slte gate module
module slte (
input [31:0] a, b,
output [31:0] result
);
assign result = (a <= b) ? 1 : 0;
endmodule

// SLT (Set Less Than) module
module slt (
input [31:0] a, b,
output [31:0] result
);
assign result = (a < b) ? 1 : 0;
endmodule

// Shift Left module
module shift_left (
input [31:0] a,
input [4:0] b,
output [31:0] result
);
assign result = a << b;
endmodule

// Shift Right module
module shift_right (
input [31:0] a,
input [4:0] b,
output [31:0] result
);
assign result = a >> b;
endmodule

module alu (
    input [31:0] op1, op2,
    input [2:0] alu_ctrl,
    // output wire zero, overflow,
    output[31:0] result
);
reg result;
// Submodules
wire [31:0] adder_out;
wire [31:0] sub_out;
wire [31:0] and_out;
wire [31:0] or_out;
wire [31:0] slte_out;
wire [31:0] slt_out;
wire [31:0] shift_left_out;
wire [31:0] shift_right_out;

// Adder
adder adder_inst (
    .a(op1),
    .b(op2),
    .result(adder_out)
);

// Subtractor
subtractor sub_inst (
    .a(op1),
    .b(op2),
    .c_in(1'b1),
    .result(sub_out)
);

// AND gate
and_gate and_inst (
    .a(op1),
    .b(op2),
    .result(and_out)
);

// OR gate
or_gate or_inst (
    .a(op1),
    .b(op2),
    .result(or_out)
);

// slte gate
slte slte_inst (
    .a(op1),
    .b(op2),
    .result(slte_out)
);

// SLT (Set Less Than)
slt slt_inst (
    .a(op1),
    .b(op2),
    .result(slt_out)
);

// Shift Left
shift_left shift_left_inst (
    .a(op1),
    .b(op2[4:0]),
    .result(shift_left_out)
);

// Shift Right
shift_right shift_right_inst (
    .a(op1),
    .b(op2[4:0]),
    .result(shift_right_out)
);

// Zero flag
// assign zero = (result == 0);

// Overflow flag& (result[31] == 1));
// sign overflow = ((op1[31] == 1) && (op2[31] as== 1) && (result[31] == 0)) ||
//                   ((op1[31] == 0) && (op2[31] == 0) &

// Multiplexer to select ALU output based on ALU control signal
always @(*)
begin
    case (alu_ctrl)
        3'b000: result = adder_out; // ADD
        3'b001: result = sub_out; // SUB
        3'b010: result = and_out; // AND
        3'b011: result = or_out; // OR
        3'b100: result = slte_out; // slte
        3'b101: result = slt_out; // SLT
        3'b110: result = shift_left_out; // SLL
        3'b111: result = shift_right_out; // SRL
        default: result = 32'h0; // default to 0
    endcase
     
end

endmodule


