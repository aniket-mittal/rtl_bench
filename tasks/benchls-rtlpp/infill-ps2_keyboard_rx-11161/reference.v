module rtlpp_11161
  (input wire       ps2_clk,
   input wire       ps2_data,
   output reg [15:0] data,
   output reg       strobe,
   input wire       clk,
   input wire       reset);

   // Internal signals
   reg [9:0] ps2_shift;
   reg [3:0] ps2_count;
   reg ps2_state;
   reg parity_bit;
   reg [7:0] code;
   reg ready_flag;
   reg busy;
   reg error;
   
   // PS2 Interface Logic
   always @(posedge clk or posedge reset) begin
      if (reset) begin
         ps2_shift <= 10'b0;
         ps2_count <= 4'b0;
         ps2_state <= 1'b0;
         busy <= 1'b0;
         ready_flag <= 1'b0;
         error <= 1'b0;
         code <= 8'b0;
         parity_bit <= 1'b0;
      end else if (ps2_state == 1'b0) begin
         busy <= 1'b0;
         if (!ps2_clk & !busy) begin
            // Start bit detection
            if (ps2_data == 1'b0) begin
               ps2_state <= 1'b1;
               ps2_count <= 4'd0;
            end
         end
      end else if (ps2_state == 1'b1) begin
         busy <= 1'b1;
         if (ps2_clk) begin
            ps2_shift <= {ps2_data, ps2_shift[9:1]};
            ps2_count <= ps2_count + 1'b1;
            if (ps2_count == 4'd9) begin
               ps2_state <= 1'b0;
               busy <= 1'b0;
               parity_bit <= ps2_shift[0];
               code <= ps2_shift[8:1];
               ready_flag <= 1'b1;
               // Parity check (even parity)
               if (^ps2_shift[9:1] != ps2_shift[0]) error <= 1'b1; else error <= 1'b0;
            end
         end
      end
   end

   // Logic to convert scan code to keycode
   reg [15:0] keycode;
   always @(posedge clk or posedge reset) begin
      if (reset) begin
         keycode <= 16'b0;
         strobe <= 1'b0;
      end else if (ready_flag) begin
         keycode[7:0] <= code;
         keycode[15:8] <= 8'b0;
         strobe <= 1'b1;
         ready_flag <= 1'b0;
      end else begin
         strobe <= 1'b0;
      end
   end
  
   always @(posedge clk or posedge reset) begin
      if (reset) begin
         data <= 16'h0;
      end else if (strobe) begin
         data <= keycode;
      end
   end

endmodule