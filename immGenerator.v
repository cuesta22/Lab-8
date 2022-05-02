module immGenerator(instruction, selectLine, immediate);
input [31:0] instruction;
input [1:0] selectLine;
output [31:0] immediate;

wire [31:0] imm_i, imm_s, imm_b, imm_0;

assign imm_0 =32'b0;

//i type instruction
assign imm_i[11:0] = instruction[31:20];
assign imm_i[31:12]={20{instruction[31]}};

//s type instruction
assign imm_s[11:5]=instruction[31:25];
assign imm_s[4:0]=instruction[11:7];
assign imm_s[31:12]={20{instruction[31]}};

//b type instruction
assign imm_b[12]=instruction[31];
assign imm_b[10:5]=instruction[30:25];
assign imm_b[11]=instruction[11];
assign imm_b[4:1]=instruction[10:7];
assign imm_b[31:13|0]={20{instruction[31]}};

mux4_2 uut1(imm_i, imm_s, imm_b,imm_0,selectLine, immediate);


//4-2 mux4_2(i0,i1,i2,i3,sel,im_out)

endmodule