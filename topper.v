module topper(clk, reset, pcsrc, alusrc, aluop, mrw, wb, instruc, regrw, immgenctrl);

	input clk, reset, pcsrc, alusrc, mrw, wb, regrw;
	input [3:0] aluop;
	input [1:0] immgenctrl;
	output [31:0] instruc;
	
	
	wire [4:0] rd, rs1, rs2;
	wire [31:0] instruc;
	wire [31:0] pc_in, pc_out, rom_out, ram_out, alu_out;
	wire [31:0] pc_ADDa_out, pc_ADDb_out;
	wire [31:0] pcmux_out;
	assign pc_in = pcmux_out;
	wire [31:0] rf_out1, rf_out2, immgen_out, alumux_out, aluramMUX_out;
	
	programCounter PC(reset, clk, pc_in, pc_out);
	
	adder_32 A(pc_out, 32'd4, pc_ADDa_out);
	
	adder_32 B(pc_out, immgen_out, pc_ADDb_out);
	
	mux2_1_32bit PCmux(pcsrc, pc_ADDa_out, pc_ADDb_out, pcmux_out);
	
	ROM rom(rom_out, pc_out, clk);
	
	instr_Decoder decoder(rom_out, rd, rs1, rs2, instruc);
	
	regfile5x32a regfile(clk, reset, regrw, rd, aluramMUX_out, rs1, rf_out1, rs2, rf_out2);
	
	mux2_1_32bit ALUmux(alusrc, rf_out2, immgen_out, alumux_out);
	
	immGenerator immgen(instruc, immgenctrl, immgen_out);
	
	ALU alu(rf_out1, alumux_out, aluop, alu_out);
	
	RAM_256x64 RAM(mrw, alu_out, clk, ram_out, rf_out2);
	
	mux2_1_32bit ALUramMUX(wb, ram_out, alu_out, aluramMUX_out);
	
	
	endmodule 