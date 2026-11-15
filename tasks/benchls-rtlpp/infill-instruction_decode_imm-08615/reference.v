module rtlpp_08615 (
  input            rst_n,
  input            clk,
  
  input            write_enable,
  input      [31:0] write_data,
  input            imm_16_out,
  input            imm_20_out,
  input            sign_extend,
  
  output reg [31:0] a_out, 
  output reg [31:0] current_instruction
  );
    
	reg [31:0] ir_register;
	reg [31:0] imm_out;
	
	always @(*) begin
		if (imm_16_out) begin
			if (sign_extend) begin
				imm_out = {{16{ir_register[15]}},ir_register[15:0]};	
			end else begin
				imm_out = {16'b0,ir_register[15:0]};					
			end
		end else if (imm_20_out) begin
			if (sign_extend) begin
				imm_out = {{12{ir_register[19]}},ir_register[19:0]};	
			end else begin
				imm_out = {12'b0,ir_register[19:0]};					
			end
		end else begin
			imm_out = 32'hzzzzzzzz;
		end
	end

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			ir_register <= 32'b0;
			current_instruction <= 32'b0;
			a_out <= 32'hzzzzzzzz;
		end else begin
			if (write_enable) begin				
				ir_register <= write_data;
			end
			current_instruction <= ir_register;
			a_out <= (imm_16_out || imm_20_out) ? imm_out : 32'hzzzzzzzz;
		end
	end

endmodule