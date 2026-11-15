module soc2nvdla_time_gen (
    clk
   ,reset_
   ,soc2nvdla_time1_gray
   ,soc2nvdla_time0_gray
   ,soc2nvdla_time_tick
  );

 input         clk;
 input         reset_;
 output [28:0] soc2nvdla_time1_gray;
 output [26:0] soc2nvdla_time0_gray;
 output        soc2nvdla_time_tick;
   
 reg    [28:0] soc2nvdla_time1_gray;
 reg    [26:0] soc2nvdla_time0_gray;
 reg    [28:0] soc2nvdla_time1_bin;
 reg    [26:0] soc2nvdla_time0_bin;

 wire   [55:0] soc2nvdla_time_bin_right_shift;

 always @(posedge clk or negedge reset_) begin
   if (!reset_) begin
     {soc2nvdla_time1_bin,soc2nvdla_time0_bin} <= {56{1'b0}};
   end else begin
     {soc2nvdla_time1_bin,soc2nvdla_time0_bin} <= {soc2nvdla_time1_bin,soc2nvdla_time0_bin} + 1;
   end
 end

 assign  soc2nvdla_time_bin_right_shift = ( {soc2nvdla_time1_bin,soc2nvdla_time0_bin} >> 1) ;

 assign  soc2nvdla_time_tick = soc2nvdla_time_bin_right_shift[4];

 always @( soc2nvdla_time1_bin or soc2nvdla_time0_bin or soc2nvdla_time_bin_right_shift) begin
     {soc2nvdla_time1_gray[28:0],soc2nvdla_time0_gray[26:0]} = Bin2Gray({soc2nvdla_time1_bin[28:0], soc2nvdla_time0_bin[26:0]}, soc2nvdla_time_bin_right_shift) ;
 end

 function [55:0] Bin2Gray ;
   input [55:0] Bin;
   input [55:0] Bin_right_shift;
   begin
     Bin2Gray = Bin ^ Bin_right_shift;
   end
 endfunction

endmodule