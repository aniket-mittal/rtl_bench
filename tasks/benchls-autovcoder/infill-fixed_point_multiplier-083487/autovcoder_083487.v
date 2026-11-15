module autovcoder_083487 #(
    parameter number_bits = 22,  // 1 bit sign +9 int ( 3 ovr + 7 data)+ 11 fraction
    parameter weight_bits = 12   // [1 bit sign + 11 data] (fraction)
) (

    input  wire [number_bits-1:0] num,     // 21-bit  input  data
    input  wire [weight_bits-1:0] weight,  // 8-bit   input  data weight +1 bit sign
    output reg  [number_bits-1:0] out      // 21-bit output data
);

  wire flag;  // determine the sign of the product
  wire [number_bits+weight_bits-1-1:0] mul;
  wire [number_bits-1-1:0] cut_data;  //20 bits for data without sign
  reg  [number_bits+weight_bits-1-1:0] result_of_product; // 20bits *11 bits  =30data +1 ovr = 31 bits >>>> product without sign

  //**************************** multiplication (weight and num without sign) ****************************
  [MASKED]
  //**********************************************************************************************************************************
  //******************************* Determine the sign of the product. **************************************************************
  assign flag = num[number_bits-1] ^ weight[weight_bits-1];
  //******************************* result of product is reg and. **************************************************************               
  assign cut_data = result_of_product[30:weight_bits-1];  //[(number_bits-1) +(weight_bits-1)]- 1(sign) =30
  //**********************************************************************************************************************************

  //if weight is 0 and num is -ve i want out to be +0 not -0 
  always @(*) begin
    if (result_of_product == 0) out = 0;
    else out = {flag, cut_data};
  end

endmodule

