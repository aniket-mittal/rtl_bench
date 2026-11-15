module rtlpp_02550(
`ifdef USE_POWER_PINS
	inout vccd1, // User area 1 1.8V supply
	inout vssd1, // User area 1 digital ground
`endif
	input clk,
	input reset,
	input req_core0,
	input [31:0] data_core0,
	output reg print_hex_enable,
	output reg [31:0] print_output,
	output reg is_ready_core0
);

	// State definitions
	localparam ARB_IO_IDLE_STATE = 2'b00;
	localparam ARB_IO_CORE1_USE = 2'b01;

	reg [1:0] arb_state, next_arb_state;

	always @(posedge clk) begin
		if (reset) begin
			arb_state <= ARB_IO_IDLE_STATE;
		end else begin
			arb_state <= next_arb_state;
		end
		end
	
  	always @(arb_state or req_core0) begin
		case (arb_state)
			ARB_IO_IDLE_STATE: begin
				if (req_core0) begin
					next_arb_state <= ARB_IO_CORE1_USE;
				end else begin
					next_arb_state <= ARB_IO_IDLE_STATE;
				end
			end
			ARB_IO_CORE1_USE: begin
				next_arb_state <= ARB_IO_IDLE_STATE;
			end
			default: begin
				next_arb_state <= ARB_IO_IDLE_STATE;
			end
		endcase
	end

	always @(arb_state or reset or req_core0 or data_core0) begin
		case (arb_state)
			ARB_IO_IDLE_STATE: begin
				print_hex_enable <= 1'b0;
				print_output <= 32'b0;
				if (reset) begin
					is_ready_core0 <= 1'b1;
				end else begin
					is_ready_core0 <= !req_core0;
				end
			end
			ARB_IO_CORE1_USE: begin
				print_hex_enable <= 1'b1;
				print_output <= data_core0; 
				is_ready_core0 <= 1'b1;
			end
			default: begin
				print_hex_enable <= 1'b0;
				print_output <= 32'b0;
				is_ready_core0 <= 1'b1;	
			end
		endcase
	end

endmodule