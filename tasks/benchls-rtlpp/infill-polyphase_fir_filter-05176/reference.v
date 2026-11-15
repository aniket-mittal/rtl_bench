module rtlpp_05176
               (
                clk,
                clk_enable,
                reset,
                filter_in,
                filter_out,
                ce_out
                );

  input   clk; 
  input   clk_enable; 
  input   reset; 
  input   signed [16:0] filter_in; 
  output  signed [15:0] filter_out; 
  output  ce_out; 

  parameter signed [16:0] coeffphase1_1 = 17'b11110110100000011; 
  parameter signed [16:0] coeffphase1_2 = 17'b01001001011111101; 
  parameter signed [16:0] coeffphase2_1 = 17'b01001001011111101; 
  parameter signed [16:0] coeffphase2_2 = 17'b11110110100000011; 

  reg  [1:0] cur_count; 
  wire phase_1; 
  reg  signed [16:0] delay_pipeline [0:1] ; 
  wire signed [33:0] product; 
  wire signed [16:0] product_mux; 
  wire signed [33:0] product_1; 
  wire signed [16:0] product_mux_1; 
  wire signed [34:0] sum1; 
  wire signed [33:0] add_signext; 
  wire signed [33:0] add_signext_1; 
  wire signed [15:0] output_typeconvert; 
  reg  signed [15:0] output_register; 

  always @ (posedge clk or posedge reset)
    begin: ce_output
      if (reset == 1'b1) begin
        cur_count <= 2'b00;
      end
      else begin
        if (clk_enable == 1'b1) begin
          if (cur_count >= 2'b01) begin
            cur_count <= 2'b00;
          end
          else begin
            cur_count <= cur_count + 2'b01;
          end
        end
      end
    end 

  assign  phase_1 = (cur_count == 2'b01 && clk_enable == 1'b1) ? 1'b1 : 1'b0;

  always @( posedge clk or posedge reset)
    begin: Delay_Pipeline_process
      if (reset == 1'b1) begin
        delay_pipeline[0] <= 17'b0;
        delay_pipeline[1] <= 17'b0;
      end
      else begin
        if (phase_1 == 1'b1) begin
          delay_pipeline[0] <= filter_in;
          delay_pipeline[1] <= delay_pipeline[0];
        end
      end
    end 

  assign product_mux = (cur_count == 2'b00) ? coeffphase1_2 :
                      coeffphase2_2;
  assign product = delay_pipeline[1] * product_mux;

  assign product_mux_1 = (cur_count == 2'b00) ? coeffphase1_1 :
                        coeffphase2_1;
  assign product_1 = delay_pipeline[0] * product_mux_1;

  assign add_signext = product;
  assign add_signext_1 = product_1;
  assign sum1 = add_signext + add_signext_1;

  assign output_typeconvert = ((sum1[34] == 1'b0 & sum1[33:30] != 4'b0000) || (sum1[34] == 1'b0 && sum1[30:15] == 16'b0111111111111111) 
) ? 16'b0111111111111111 : 
      (sum1[34] == 1'b1 && sum1[33:30] != 4'b1111) ? 16'b1000000000000000 : (sum1[30:0] + {sum1[15], {14{~sum1[15]}}})>>>15;

  always @ (posedge clk or posedge reset)
    begin: Output_Register_process
      if (reset == 1'b1) begin
        output_register <= 16'b0;
      end
      else begin
        if (clk_enable == 1'b1) begin
          output_register <= output_typeconvert;
        end
      end
    end 

  assign ce_out = phase_1;
  assign filter_out = output_register;
endmodule