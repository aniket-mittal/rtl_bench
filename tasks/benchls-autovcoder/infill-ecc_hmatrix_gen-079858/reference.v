module autovcoder_079858 #(
    parameter CODE_WIDTH = 72,
    parameter ECC_WIDTH  = 8,
    parameter DATA_WIDTH = 64
) (
    /*AUTOARG*/
    // Outputs
    h_rows
);


  function integer factorial(input integer i);
    integer index;
    if (i == 1) factorial = 1;
    else begin
      factorial = 1;
      for (index = 2; index <= i; index = index + 1) factorial = factorial * index;
    end
  endfunction  // factorial

  function integer combos(input integer n, k);
    combos = factorial(n) / (factorial(k) * factorial(n - k));
  endfunction  // combinations

  // function next_combo
  // Given a combination, return the next combo in lexicographical
  // order.  Scans from right to left.  Assumes the first combination
  // is k ones all of the way to the left.
  //
  // Upon entry, initialize seen0, trig1, and ones.  "seen0" means
  // that a zero has been observed while scanning from right to left.
  // "trig1" means that a one have been observed _after_ seen0 is set.
  // "ones" counts the number of ones observed while scanning the input.
  //
  // If trig1 is one, just copy the input bit to the output and increment
  // to the next bit.  Otherwise  set the the output bit to zero, if the 
  // input is a one, increment ones.  If the input bit is a one and seen0
  // is true, dump out the accumulated ones.  Set seen0 to the complement
  // of the input bit.  Note that seen0 is not used subsequent to trig1 
  // getting set.
  function [ECC_WIDTH-1:0] next_combo(input [ECC_WIDTH-1:0] i);
    integer index;
    integer dump_index;
    reg seen0;
    reg trig1;
    //    integer ones;
    reg [ECC_WIDTH-1:0] ones;
    begin
      seen0 = 1'b0;
      trig1 = 1'b0;
      ones  = 0;
      for (index = 0; index < ECC_WIDTH; index = index + 1) begin
        // The "== 1'bx" is so this will converge at time zero.
        // XST assumes false, which should be OK.
        if (trig1) next_combo[index] = i[index];
        else begin
          next_combo[index] = 1'b0;
          ones = ones + i[index];
          if (i[index] && seen0) begin
            trig1 = 1'b1;
            for (dump_index = index - 1; dump_index >= 0; dump_index = dump_index - 1)
            if (dump_index >= index - ones) next_combo[dump_index] = 1'b1;
          end
          seen0 = ~i[index];
        end  // else: !if(trig1)
      end
    end  // function
  endfunction  // next_combo

  wire [ECC_WIDTH-1:0] ht_matrix[CODE_WIDTH-1:0];
  output wire [CODE_WIDTH*ECC_WIDTH-1:0] h_rows;

  localparam COMBOS_3 = combos(ECC_WIDTH, 3);
  localparam COMBOS_5 = combos(ECC_WIDTH, 5);
  genvar n;
  genvar s;
  generate
    for (n = 0; n < CODE_WIDTH; n = n + 1) begin : ht
      if (n == 0) assign ht_matrix[n] = {{3{1'b1}}, {ECC_WIDTH - 3{1'b0}}};
      else if (n == COMBOS_3 && n < DATA_WIDTH)
        assign ht_matrix[n] = {{5{1'b1}}, {ECC_WIDTH - 5{1'b0}}};
      else if ((n == COMBOS_3 + COMBOS_5) && n < DATA_WIDTH)
        assign ht_matrix[n] = {{7{1'b1}}, {ECC_WIDTH - 7{1'b0}}};
      else if (n == DATA_WIDTH) assign ht_matrix[n] = {{1{1'b1}}, {ECC_WIDTH - 1{1'b0}}};
      else assign ht_matrix[n] = next_combo(ht_matrix[n-1]);

      for (s = 0; s < ECC_WIDTH; s = s + 1) begin : h_row
        assign h_rows[s*CODE_WIDTH+n] = ht_matrix[n][s];
      end
    end
  endgenerate

endmodule

