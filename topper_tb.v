module topper_tb(clk, reset, pcsrc, alusrc, aluop, mrw, wb, instruc, regrw, immgenctrl);


		output reg clk, reset, pcsrc, alusrc, mrw, wb, regrw;
		output reg [3:0] aluop;
		output [31:0] instruc;
		output reg [1:0] immgenctrl;
	
		topper top(clk, reset, pcsrc, alusrc, aluop, mrw, wb, instruc, regrw, immgenctrl);
		
		initial begin
		
		clk <= 0;
		reset <= 0;
		#5
		reset <= 1;
		#5
		reset <= 0;
		#5
		// add
		regrw <= 1;
		alusrc <= 1;
		mrw <= 1;
		wb <= 0;
		pcsrc <= 0;
		immgenctrl <= 2'b00;
		aluop <= 4'b0010;
		#5
		clk <= 1;
		#5
		clk <= 0;
		// load
		regrw <= 1;
		alusrc <= 1;
		mrw <= 0;
		wb <= 0;
		pcsrc <= 0;
		immgenctrl <= 2'b01;
		aluop <= 4'b0010;
		#5
		clk <= 1;
		#5
		clk <= 0;
		// store
		regrw <= 0;
		alusrc <= 1;
		mrw <= 1;
		wb <= 0;
		pcsrc <= 0;
		immgenctrl <= 2'b10;
		aluop <= 4'b0010;
		#5
		clk <= 1;
		#5
		clk <= 0;
		
		// beq
		regrw <= 0;
		alusrc <= 0;
		mrw <= 0;
		wb <= 0;
		pcsrc <= 01;
		immgenctrl <= 2'b11;
		aluop <= 4'b0110;
		#5
		clk <= 1;
		#5
		clk <= 0;
		end		
	endmodule
		