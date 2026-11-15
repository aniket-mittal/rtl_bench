module NV_NVDLA_CMAC_CORE_MAC_booth (
   code
  ,is_8bit
  ,sign
  ,src_data
  ,out_data
  ,out_inv
  );

input   [2:0] code;
input         is_8bit;
input         sign;
input  [15:0] src_data;
output [16:0] out_data;
output        out_inv;
reg     [2:0] in_code;
reg    [16:0] out_data;
reg           out_inv;


always @(
  sign
  or code
  ) begin
    in_code = {3{sign}} ^ code;
end

[MASKED]

endmodule