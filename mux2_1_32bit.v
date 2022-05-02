module mux2_1_32bit (f, a, b, out);

		input f;
		input [31:0] a, b;
		output reg [31:0] out;
		always@(*) begin
			if (f==0) begin
					out <= a;
					
			end
				else if (f==1) begin
						out <= b;
			end
	end
endmodule 